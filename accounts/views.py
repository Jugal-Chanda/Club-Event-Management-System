from django.shortcuts import render,redirect
from django.contrib.auth import login,authenticate,logout
from accounts.forms import RegistrationForm,Log_in_Form
from accounts.models import Accounts


#Create your views here.


# helper funtions start
def is_authenticate(request):
    return request.user.is_authenticated

def redirect_permisions(user):
    if user.is_ec:
        return 'clubHome'
    elif user.is_admin:
        return 'adminHome'
    else:
        return 'home'

#helper functions end


def profile(request):
    # if is_authenticate(request):
    return render(request, 'accounts/profile.html')
    # else:
    # return redirect('login')

def registraion_view(request):
    context={}
    if request.POST:
        form = RegistrationForm(request.POST)
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
    #print("request to login")
    #user = request.user

    if is_authenticate(request):
            return redirect(redirect_permisions(request.user))
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
                print("invalid login")
    else:
        form = Log_in_Form()
    context['form'] = form
    return render(request, 'accounts/login.html',context)


def logout_view(request):
    logout(request);
    # form = Log_in_Form()
    return redirect('login')
