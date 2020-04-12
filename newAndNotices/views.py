from django.shortcuts import render,redirect
from newAndNotices.forms import addnewsform,addnoticesform
from newAndNotices.models import News,Notices
from django.http import HttpResponse
from accounts import auth_fun
# Create your views here.
def addnews(request):
    context={}
    context['success_msg'] = ""
    if auth_fun.admin_per(request.user):
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
    else:
        return redirect('login')


def addnotices(request):
    context={}
    context['success_msg'] = ""
    if auth_fun.admin_per(request.user):
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
    else:
        return redirect('login')


def allnews(request):
    context = {}
    if auth_fun.admin_per(request.user):
        context['news_all'] = News.objects.all()
        return render(request, 'admin/allnews.html',context)
    else:
        return redirect('login')



def deletenews(request,id):
    context = {}
    if auth_fun.admin_per(request.user):
        try:
            news = News.objects.get(pk=id)
        except News.DoesNotExist:
            news = None
        if news:
            news.delete()
            return redirect('allnews')
        else:
            return HttpResponse("Does Not Exit")
    else:
        return redirect('login')


def allnotice(request):
    context = {}
    if auth_fun.admin_per(request.user):
        context['notices'] = Notices.objects.all()
        return render(request, 'admin/allnotice.html',context)
    else:
        return redirect('login')



def deletenotice(request,id):
    context = {}
    if auth_fun.admin_per(request.user):
        try:
            notice = Notices.objects.get(pk=id)
        except Notices.DoesNotExist:
            notice = None

        if notice:
            notice.delete()
            return redirect('allnotice')
        else:
            return HttpResponse("Does Not Exit")
    else:
        return redirect('login')
