from django.shortcuts import render
from accounts.models import Accounts
from club.models import Clubs,Club_Ec,member
from eventapp.models import Events,Perticipants_details
from newAndNotices.models import News,Notices
from django.http import JsonResponse
from django.template import Context, Template
from django.core.mail import send_mail
from django.conf import settings
from django.core import serializers
from django.contrib.auth import authenticate
from django.contrib.auth.hashers import make_password
from django.contrib.auth.password_validation import validate_password
from django.core.exceptions import ValidationError
from accounts import auth_fun
# Create your views here.

def approve_member_request(request):
    data = {}

    if request.GET:
        clubid = request.GET.get('clubid')
        memid = int(request.GET.get('memid'))
        mem = member.objects.all().filter(pk=memid)[0]
        mem.approved = True
        mem.save()
        data['check'] = True
    return JsonResponse(data)

def remove_member_request(request):
    data = {}
    if request.GET:
        clubid = request.GET.get('clubid')
        memid = int(request.GET.get('memid'))
        mem = member.objects.all().filter(pk=memid)[0]
        mem.delete()
        data['check'] = True
    return JsonResponse(data)

def edit_event(request):
    data = {}
    template = Template("club/eventsingle.html")
    if request.GET:
        id = request.GET.get('id')
        event_name = request.GET.get('event_name')
        event_location = request.GET.get('event_location')
        event_description = request.GET.get('event_description')
        start_date_time = request.GET.get('start_date_time')
        end_date_time = request.GET.get('end_date_time')
        event = Events.objects.get(pk = id)

        event.eventname = event_name
        event.eventlocation = event_location
        event.description = event_description
        event.startdate = start_date_time
        event.enddate = end_date_time
        try:
            event.save()
            data['ok'] = True
        except Exception as e:
            data['ok'] = False
        context = Context({"event": event})
        template.render(context)
    return JsonResponse(data)

def update_profile(request):
    template = Template("profile.html")
    data = {}
    if request.GET:
        email = request.GET.get('email')
        fullname = request.GET.get('fullname')
        phone = request.GET.get('phone')
        if request.user.email != email:
            try:
                user = Accounts.objects.get(email=email)
            except Accounts.DoesNotExist:
                user = None
        else:
            user = None
        if user:
            data['ok'] = False
            data['error'] = "Email already exist"
        else:
            user = request.user
            user.fullname = fullname
            user.email = email
            user.phone_number = phone
            data['ok'] = True
            user.save()
        return JsonResponse(data)

def change_password(request):
    data = {}
    if request.GET:
        old_password = request.GET.get('check_password')
        user = authenticate(email=request.user.email,password=old_password)
        if user:
            password = request.GET.get('password')
            confirm_password = request.GET.get('confirm_password')
            if password==confirm_password:
                try:
                    check = validate_password(password, user=None, password_validators=None)
                except ValidationError:
                    data['ok'] = False
                    check = ValidationError((password), code='invalid')
                if check == None:
                    user.password = make_password(password, salt=None, hasher='default')
                    user.save()
                    request.user = user
                    data['ok'] = True
                else:
                    data['error'] = "May be This new password is too week "
            else:
                data['ok'] = False
                data['error'] = "New password and confirm password does not match"
        else:
            data['ok'] = False
            data['error'] = "Current Password Does not Match"
    return JsonResponse(data)

def sendemail(request):
    data = {}
    if request.GET:
        if request.user.is_authenticated:
            if request.user.is_ec:
                club_ec = Club_Ec.objects.get(ec=request.user)
                club = Clubs.objects.get(pk=club_ec.club_id)
                id = request.GET.get('id')
                email_sub = request.GET.get('email_sub')
                perticipant = Perticipants_details.objects.get(pk=id)
                email = perticipant.email
                email_msg = request.GET.get('email_msg')
                print("email MSg: " + email_msg)
                print("To : "+email)
                email_from = club.clubemail
                email_pass = club.password
                recipient_list = [email,]
                # Message Formatting
                email_msg = email_msg.replace("[[Perticipant Name]]",perticipant.name)
                email_msg = email_msg.replace("[[Perticipant Student ID]]",perticipant.std_id)
                email_msg = email_msg.replace("[[Perticipant Email]]",perticipant.email)
                email_msg = email_msg.replace("[[Perticipant Phone]]",perticipant.phone)
                email_msg = email_msg.replace("[[Perticipant First Name]]",(perticipant.name.split())[0])
                # End Message Formatting

                send_mail( email_sub, email_msg, email_from, recipient_list,fail_silently=False, auth_user='dc9cfa69b22768', auth_password='b40b2aac7695c3')
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
        context = Context({"clubs": Clubs.objects.all()})
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
