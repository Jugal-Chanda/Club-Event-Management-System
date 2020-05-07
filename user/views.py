from django.shortcuts import render,redirect
from eventapp.models import Events
from newAndNotices.models import News,Notices
from accounts.models import Accounts
from accounts.forms import RegistrationForm
from mainadmin.models import Academic_calendar
from club.models import Clubs,Club_Ec,Gallery
from club.forms import member_request_form
from django.views.decorators.clickjacking import xframe_options_sameorigin
# Create your views here.noticesingle.html


def gallery(request,clubname):
    context = {}
    news = News.objects.all().order_by('-created_at')
    notices = Notices.objects.all().order_by('-created_at')
    context['news'] = news
    context['notices'] = notices
    try:
        news_first = news[0]
    except:
        news_first = False
    try:
        notice_first= notices[0]
    except:
        notice_first = False
    club = Clubs.objects.get(clubname=clubname)
    context['news_first']  = news_first
    context['notice_first']  = notice_first
    context['club'] = club
    context['images'] = Gallery.objects.all().filter(club=club).order_by('-upload_date')
    return render(request, 'gallery.html',context)

def club_ec_user(request,clubname):
    context = {}
    news = News.objects.all().order_by('-created_at')
    notices = Notices.objects.all().order_by('-created_at')
    context['news'] = news
    context['notices'] = notices
    try:
        news_first = news[0]
    except:
        news_first = False
    try:
        notice_first= notices[0]
    except:
        notice_first = False
    club = Clubs.objects.get(clubname=clubname)
    accounts = Club_Ec.objects.all().filter(club=club)
    context['news_first']  = news_first
    context['notice_first']  = notice_first
    context['club'] = club
    context['accounts'] = accounts
    return render(request, 'club_ec.html',context)

def all_clubs_user(request):
    context = {}
    news = News.objects.all().order_by('-created_at')
    notices = Notices.objects.all().order_by('-created_at')
    context['news'] = news
    context['notices'] = notices
    try:
        news_first = news[0]
    except:
        news_first = False
    try:
        notice_first= notices[0]
    except:
        notice_first = False
    context['clubs'] = Clubs.objects.all()
    context['news_first']  = news_first
    context['notice_first']  = notice_first
    return render(request, 'clubs.html',context)

def member_req(request,clubname):
    context = {}
    news = News.objects.all().order_by('-created_at')
    notices = Notices.objects.all().order_by('-created_at')
    context['news'] = news
    context['notices'] = notices
    try:
        news_first = news[0]
    except:
        news_first = False
    try:
        notice_first= notices[0]
    except:
        notice_first = False
    context['news_first']  = news_first
    context['notice_first']  = notice_first
    club = Clubs.objects.get(clubname=clubname)
    context['club'] = club
    if request.POST:
        form = member_request_form(request.POST)
        if form.is_valid():
            member_req = form.save(commit=False)
            member_req.club = club
            member_req.save()
            context['form'] = member_request_form()
        else:
            context['form'] = form
    else:
        form = member_request_form()
        context['form'] = form
    return render(request, 'become_a_member_form.html',context)


def club_single_user(request,clubname):
    context = {}
    news = News.objects.all().order_by('-created_at')
    notices = Notices.objects.all().order_by('-created_at')
    context['news'] = news
    context['notices'] = notices
    try:
        news_first = news[0]
    except:
        news_first = False
    try:
        notice_first= notices[0]
    except:
        notice_first = False
    context['news_first']  = news_first
    context['notice_first']  = notice_first
    club = Clubs.objects.get(clubname=clubname)
    context['club'] = club
    events = Events.objects.all().filter(created_by=club).order_by('-startdate')
    context['events'] = events
    return render(request, 'club_single.html',context)



def calender(request):
    context = {}
    news = News.objects.all().order_by('-created_at')
    notices = Notices.objects.all().order_by('-created_at')
    context['news'] = news
    context['notices'] = notices
    calendars = Academic_calendar.objects.all().order_by('-uploaded_at')
    try:
        news_first = news[0]
    except:
        news_first = False
    try:
        notice_first= notices[0]
    except:
        notice_first = False
    context['news_first']  = news_first
    context['notice_first']  = notice_first
    context['calendars'] = calendars
    return render(request, 'academic.html',context)

@xframe_options_sameorigin
def calender_label(request,label_name):
    context = {}
    news = News.objects.all().order_by('-created_at')
    notices = Notices.objects.all().order_by('-created_at')
    context['news'] = news
    context['notices'] = notices
    try:
        news_first = news[0]
    except:
        news_first = False
    try:
        notice_first= notices[0]
    except:
        notice_first = False
    context['news_first']  = news_first
    context['notice_first']  = notice_first
    context['caledar'] = Academic_calendar.objects.get(calendar_label=label_name)
    return render(request, 'calendar_single.html',context)

def home(request):
    context = {}
    events = Events.objects.all().order_by('-startdate')
    news = News.objects.all().order_by('-created_at')
    notices = Notices.objects.all().order_by('-created_at')
    context['news'] = news
    context['notices'] = notices
    try:
        news_first = news[0]
    except:
        news_first = False
    try:
        notice_first= notices[0]
    except:
        notice_first = False
    context['news_first']  = news_first
    context['notice_first']  = notice_first

    if(len(events)>3):
        events = events[:3]
    context['events'] = events
    return render(request, 'index.html',context)

def event_all(request):
    context = {}
    context['events'] = Events.objects.all().order_by('-startdate')
    news = News.objects.all().order_by('-created_at')
    notices = Notices.objects.all().order_by('-created_at')
    try:
        news_first = news[0]
    except:
        news_first = False
    try:
        notice_first= notices[0]
    except:
        notice_first = False
    context['news_first']  = news_first
    context['notice_first']  = notice_first
    return render(request, 'events.html',context)

def profile(request):
    context = {}
    news = News.objects.all().order_by('-created_at')
    notices = Notices.objects.all().order_by('-created_at')
    try:
        news_first = news[0]
    except:
        news_first = False
    try:
        notice_first= notices[0]
    except:
        notice_first = False
    context['news_first']  = news_first
    context['notice_first']  = notice_first
    if request.user.is_authenticated:
        context['user'] = request.user
        return render(request, 'profile.html',context)
    else:
        return redirect('login')
def event_single(request,eventname):
    context = {}
    context['event'] = Events.objects.get(eventname=eventname)
    events = Events.objects.all().order_by('-startdate')
    news = News.objects.all().order_by('-created_at')
    notices = Notices.objects.all().order_by('-created_at')
    try:
        news_first = news[0]
    except:
        news_first = False
    try:
        notice_first= notices[0]
    except:
        notice_first = False
    context['news_first']  = news_first
    context['notice_first']  = notice_first
    if(len(events)>3):
        events = events[:3]
    context['events'] = events
    return render(request, 'eventsingle.html',context)


def newssingle(request,newsname):
    context = {}
    context['news'] = News.objects.get(newstitle=newsname)
    news = News.objects.all().order_by('-created_at')
    notices = Notices.objects.all().order_by('-created_at')
    try:
        news_first = news[0]
    except:
        news_first = False
    try:
        notice_first= notices[0]
    except:
        notice_first = False
    context['news_first']  = news_first
    context['notice_first']  = notice_first
    context['all_news'] = news
    return render(request, 'newssingle.html',context)

def noticeingle(request,noticename):
    context = {}
    context['notice'] = Notices.objects.get(noticetitle=noticename)

    news = News.objects.all().order_by('-created_at')
    notices = Notices.objects.all().order_by('-created_at')
    try:
        news_first = news[0]
    except:
        news_first = False
    try:
        notice_first= notices[0]
    except:
        notice_first = False
    context['news_first']  = news_first
    context['notice_first']  = notice_first
    context['all_notice'] = notices
    return render(request, 'noticesingle.html',context)
