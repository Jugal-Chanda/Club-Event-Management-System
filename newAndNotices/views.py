from django.shortcuts import render,redirect
from newAndNotices.forms import addnewsform,addnoticesform
from newAndNotices.models import News,Notices
from django.http import HttpResponse
# Create your views here.
def addnews(request):
    context={}
    context['success_msg'] = ""
    if request.POST:
        form = addnewsform(request.POST)
        if form.is_valid():
            form.save()
            form = addnewsform()
            context['form'] = form
            context['success_msg'] = "News is Added. This will be show for user "
        else:
            context['form'] = form
    else:
        form = addnewsform()
        context['form'] = form
    return render(request, 'admin/addnews.html',context)


def addnotices(request):
    context={}
    context['success_msg'] = ""
    if request.POST:
        form = addnoticesform(request.POST)
        if form.is_valid():
            form.save()
            form = addnoticesform()
            context['form'] = form
            context['success_msg'] = "Notice is Added. This will be show for user "
        else:
            context['form'] = form
    else:
        form = addnoticesform()
        context['form'] = form
    return render(request, 'admin/addnotices.html',context)

def allnews(request):
    context = {}
    context['news_all'] = News.objects.all()
    return render(request, 'admin/allnews.html',context)


def deletenews(request,id):
    context = {}
    try:
        news = News.objects.get(pk=id)
    except News.DoesNotExist:
        news = None
    if news:
        news.delete()
        return redirect('allnews')
    else:
        return HttpResponse("Does Not Exit")


def allnotice(request):
    context = {}
    context['notices'] = Notices.objects.all()
    return render(request, 'admin/allnotice.html',context)


def deletenotice(request,id):
    context = {}
    try:
        notice = Notices.objects.get(pk=id)
    except Notices.DoesNotExist:
        notice = None

    if notice:
        notice.delete()
        return redirect('allnotice')
    else:
        return HttpResponse("Does Not Exit")
