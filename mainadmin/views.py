from django.shortcuts import render,redirect
from club.forms import registerClub
from mainadmin.forms import upload_calendar_form
from accounts.models import Accounts
from club.models import Clubs,Club_Ec
from accounts import auth_fun

# Create your views here.
def mainAdmin(request):
    if auth_fun.admin_per(request.user):
        return render(request, 'admin/admin.html')
    else:
        return redirect('login')


def uploadcalendar(request):
    context={}
    if auth_fun.admin_per(request.user):
        if request.POST:
            form = upload_calendar_form(request.POST, request.FILES)
            if form.is_valid():
                form.save()
                return redirect('adminHome')
            else:
                context['form'] = form
        else:
            form = upload_calendar_form()
            context['form'] = form
        return render(request, 'admin/addcalendar.html',context)
    else:
        return redirect('login')



def registerclub(request):
    context={}
    if auth_fun.admin_per(request.user):
        if request.POST:
            form = registerClub(request.POST, request.FILES)
            if form.is_valid():
                form.save()
                return redirect('adminHome')
            else:
                context['form'] = form
        else:
            form = registerClub()
            context['form'] = form
        return render(request, 'admin/createclub.html',context)
    else:
        return redirect('login')

def allclubs(request):
    if auth_fun.admin_per(request.user):
        context={}
        context['clubs'] = Clubs.objects.all()
        return render(request, 'admin/allclubs.html',context)
    else:
        return redirect('login')


def clubsingle(request,clubname):
    context={}
    if auth_fun.admin_per(request.user):
        club = Clubs.objects.get(clubname=clubname)
        club_ec = Club_Ec.objects.filter(club=club).values('id','ec_id__username','ec_id__email','ec_id__phone_number','date_joined','club__clubname','designation')
        context['details'] = club_ec
        context['club'] = club
        if request.POST:
            print("hello")
        return render(request, 'admin/clubsingle.html',context)
    else:
        return redirect('login')
