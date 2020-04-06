from django.shortcuts import render
from accounts.models import Accounts
from club.models import Clubs,Club_Ec
from eventapp.models import Events,Perticipants_details
from newAndNotices.models import News,Notices
from django.http import JsonResponse
from django.template import Context, Template
from django.core.mail import send_mail
from django.conf import settings
from django.core import serializers
# Create your views here.

def sendemail(request):
    data = {}
    if request.GET:
        id = request.GET.get('id')
        email_sub = request.GET.get('email_sub')
        perticipant = Perticipants_details.objects.get(pk=id)
        email = perticipant.email
        email_msg = request.GET.get('email_msg')
        print("email MSg: " + email_msg)
        print("To : "+email)
        email_from = "amibest50@gmail.com"
        email_pass = "jugal105488jugal"
        recipient_list = [email,]
        email_msg = email_msg.replace("[[Perticipant Name]]",perticipant.name)
        email_msg = email_msg.replace("[[Perticipant Student ID]]",perticipant.std_id)
        email_msg = email_msg.replace("[[Perticipant Email]]",perticipant.email)
        email_msg = email_msg.replace("[[Perticipant Phone]]",perticipant.phone)
        email_msg = email_msg.replace("[[Perticipant First Name]]",(perticipant.name.split())[0])

        send_mail( email_sub, email_msg, email_from, recipient_list,fail_silently=False, auth_user=email_from, auth_password=email_pass )
        return JsonResponse(data)
# 
# def shownews(request):
#     data = {}
#     # data['news'] = News.objects.all()
#     data = serializers.serialize('json', News.objects.all())
#     return JsonResponse(data)

def check_perticipate_data(request):
    data = {}
    if request.GET:
        email = request.GET.get('email')
        eventname = request.GET.get('eventname')

        event  = Events.objects.get(eventname = eventname)
        data['ok'] = False
        check = Perticipants_details.objects.filter(email=email).filter(event=event).count()
        if check>0:
            data['error'] = "Already register this event"
        else:
            try:
                user = Perticipants_details.objects.filter(email=email)[0]
            except Perticipants_details.DoesNotExist:
                user = None
            if user:
                data['name'] = user.name
                data['std_id'] = user.std_id
                data['phone'] = user.phone
                data['ok'] = True

        return JsonResponse(data)


def register_perticipant(request):
    data = {}
    if request.GET:
        email = request.GET.get('email')
        name = request.GET.get('name')
        phone = request.GET.get('phone')
        std_id = request.GET.get('std_id')
        eventname = request.GET.get('eventname')
        event  = Events.objects.get(eventname = eventname)
        club = Clubs.objects.get(clubname = event.created_by)
        check = Perticipants_details.objects.filter(email=email).filter(event=event).count()
        data['ok'] = False
        if check>0:
            data['error'] = "Already register this event"
        else:
            perticipants_details = Perticipants_details(name = name,std_id = std_id,email=email,phone=phone,event=event,club=club)
            perticipants_details.save()
            data['ok'] = True
    return JsonResponse(data)


def add_ec_email_validate(request):
    data = {}
    email = request.GET['email']
    print(email)
    try:
        user = Accounts.objects.get(email=email)
    except Accounts.DoesNotExist:
        user = None
    #user = Accounts.objects.get(email=email)
    data['check'] = False
    if user:
        if user.is_ec or user.is_admin:
            data['msg'] = "The User is already an Executive Member Or an Admin"
        else:
            data['check'] = True
            data['email'] = user.email
            data['fullname'] = user.fullname
            data['phone_number'] = user.phone_number
    else:
        data['msg'] = "User Not Found"
    return JsonResponse(data)

def add_ec_data_to_database(request):
    data = {}
    if request.GET:
        designation = request.GET.get('designation')
        clubname = request.GET.get('clubname')
        email = request.GET.get('email')

        club = Clubs.objects.get(clubname=clubname)
        ec =  Accounts.objects.get(email = email)

        club_ec = Club_Ec(designation = designation,club = club,ec=ec)
        club_ec.save()
        ec.is_ec = True
        ec.save()
        all_ec = request.POST.getlist('ec')
        data['check'] = True
        data['msg'] = ec.fullname + "is a new ec of " + clubname

    return JsonResponse(data)

def disable_club(request):
    template = Template("admin/allclubs.html")
    data = {}
    if request.GET:
        club = Clubs.objects.get(pk=request.GET.get('clubid'))
        club.is_active = False
        club.save()
        data['clubname'] = club.clubname
        data['check'] = True
        context = context = Context({"clubs": Clubs.objects.all()})
        template.render(context)
    return JsonResponse(data)


def enable_club(request):
    template = Template("admin/allclubs.html")
    data = {}
    if request.GET:
        club = Clubs.objects.get(pk=request.GET.get('clubid'))
        club.is_active = True
        club.save()
        data['clubname'] = club.clubname
        data['check'] = True
        context = context = Context({"clubs": Clubs.objects.all()})
        template.render(context)
    return JsonResponse(data)

def delete_ec(request):
    template = Template("admin/allclubs.html")
    data = {}
    if request.GET:
        club_ec = Club_Ec.objects.get(pk=request.GET.get('id'))
        ec_id  = club_ec.ec_id
        club_ec.delete()
        ec = Accounts.objects.get(pk=ec_id)
        ec.is_ec = False
        ec.save()
        data['check'] = True
        # context = context = Context({"clubs": Clubs.objects.all()})
        # template.render(context)
    return JsonResponse(data)
