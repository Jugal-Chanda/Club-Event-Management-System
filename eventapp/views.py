from django.shortcuts import render,redirect
from club.models import Clubs,Club_Ec
from eventapp.models import Events,Perticipants_details
from django.contrib import messages
from accounts import auth_fun

# Create your views here.
#------------------- helper function --------------------

def ec_is_autenticate(request):
    temp = {}
    if auth_fun.club_per(request.user):
        temp['auth'] = True
        club_ec = Club_Ec.objects.get(ec=request.user)
        club = Clubs.objects.get(pk=club_ec.club_id)
        temp['club'] = club
    else:
        temp['auth'] = False
    print(temp)
    return temp

def create_event_db(request):
    temp =  {}
    event_cover_photo = request.FILES.get('evet_cover')
    eventname = request.POST.get('event_name')
    eventlocation = request.POST.get('event_location')
    description = request.POST.get('event_description')
    startdate = request.POST.get('start_date_time')
    enddate = request.POST.get('end_date_time')
    club_ec = Club_Ec.objects.get(ec=request.user)
    club = Clubs.objects.get(pk=club_ec.club_id)
    print(event_cover_photo)
    event =  Events(event_cover_photo=event_cover_photo,eventname=eventname,eventlocation=eventlocation,description=description,startdate=startdate,enddate=enddate,created_by = club)
    try:
        event.save()
        temp['check'] = True
        temp['event'] = event
    except Exception as e:
        # print(e, e.__class__)
        temp['check'] = False
    return temp




#-------------------end helper ------------------------------

def createevent(request):
    context = {}
    temp = ec_is_autenticate(request)
    if temp['auth']:
        context['club'] = temp['club']
        if request.POST:
            temp = create_event_db(request)
            if temp['check']:
                messages.add_message(request, messages.SUCCESS, 'Event Successfully Created')
            else:
                messages.add_message(request, messages.ERROR, 'Something Error Please Try Again. Possile Duplicate entry')

        return render(request, 'club/createevents.html',context)
    else:
        return redirect('login')


def hosted_events(request):
    context = {}
    temp = ec_is_autenticate(request)
    if temp['auth']:
        context['club'] = temp['club']
        club = temp['club']
        context['events'] = Events.objects.filter(created_by = club)
        return render(request, 'club/hosted.html',context)
    else:
        return redirect('login')

def eventsingle(request,eventname):
    context = {}
    temp = ec_is_autenticate(request)
    if temp['auth']:
        context['club'] = temp['club']
        club = temp['club']
        context['event'] = Events.objects.filter(eventname=eventname)[0];
        return render(request, 'club/eventsingle.html',context)
    else:
        return redirect('login')


def perticipants(request):
    context = {}
    temp = ec_is_autenticate(request)
    if temp['auth']:
        context['club'] = temp['club']
        club = temp['club']
        context['events'] = Events.objects.filter(created_by = club).order_by('-startdate')
        return render(request, 'club/perticipants.html',context)
    else:
        return redirect('login')


def perticipants_details(request,eventname):
    context = {}
    temp = ec_is_autenticate(request)
    if temp['auth']:
        context['club'] = temp['club']
        club = temp['club']
        check = Events.objects.filter(eventname=eventname).filter(created_by=club).count()
        if check==0:
            return redirect('perticipants')
        else:
            event = Events.objects.filter(eventname=eventname)[0]
            context['perticipants'] = Perticipants_details.objects.filter(event = event)
            return render(request, 'club/perticipantsdetails.html',context)
    else:
        return redirect('login')
