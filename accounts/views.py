from django.shortcuts import render,redirect
from django.contrib.auth import login,authenticate,logout
from accounts.forms import RegistrationForm,Log_in_Form
from club.models import Club_Ec,Clubs
from accounts.models import Accounts
from django.contrib import messages
from accounts import auth_fun



#Create your views here.


# helper funtions start
def is_authenticate(request):
    return request.user.is_authenticated

def redirect_permisions(user):
    if user.is_ec:
        club_ec = Club_Ec.objects.get(ec=user)
        club = Clubs.objects.get(pk=club_ec.club_id)
        if club.is_active:
            return 'clubHome'
        else:
            return 'home'
    elif user.is_admin:
        return 'adminHome'
    else:
        return 'home'

#helper functions end

def registraion_view(request):
    context={}
    if request.POST:
        form = RegistrationForm(request.POST,request.FILES)
        if form.is_valid():
            form.save()
            return redirect('login')
        else:
            context['form'] = form
    else:
        form = RegistrationForm()
        context['form'] = form
    return render(request, 'accounts/register.html',context)


def login_view(request):
    context={}
    if auth_fun.is_authenticate(request.user):
            return redirect(auth_fun.redirect_permision(request.user))
    if request.POST:
        form = Log_in_Form(request.POST)
        if form.is_valid():
            email = form.cleaned_data.get('email')
            password = form.cleaned_data.get('password')
            user = authenticate(email=email,password=password)
            if user:
                login(request,user)
                return redirect(redirect_permisions(user))
            else:
                messages.add_message(request, messages.ERROR, 'Invalid Login Try Again')

    else:
        form = Log_in_Form()
    context['form'] = form
    return render(request, 'accounts/login.html',context)


def logout_view(request):
    logout(request);
    # form = Log_in_Form()
    return redirect('login')
