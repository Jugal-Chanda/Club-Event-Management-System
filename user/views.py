from django.shortcuts import render
from eventapp.models import Events
from newAndNotices.models import News,Notices
# Create your views here.noticesingle.html
def home(request):
    context = {}
    events = Events.objects.all().order_by('-startdate');
    news = News.objects.all().order_by('-created_at');
    notices = Notices.objects.all().order_by('-created_at');
    context['news'] = news
    context['notices'] = notices
    if(len(events)>3):
        events = events[:3]
    context['events'] = events
    return render(request, 'index.html',context)
def event_single(request,eventname):
    context = {}
    context['event'] = Events.objects.get(eventname=eventname)
    events = Events.objects.all().order_by('-startdate');
    if(len(events)>3):
        events = events[:3]
    context['events'] = events
    return render(request, 'eventsingle.html',context)


def newssingle(request,newsname):
    context = {}
    context['news'] = News.objects.get(newstitle=newsname)
    return render(request, 'newssingle.html',context)

def noticeingle(request,noticename):
    context = {}
    context['notice'] = Notices.objects.get(noticetitle=noticename)
    return render(request, 'noticesingle.html',context)
