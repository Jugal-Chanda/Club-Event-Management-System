from django.shortcuts import render,redirect
from club.models import Club_Ec,Clubs
from eventapp.models import Events,Perticipants_details
from django.contrib import messages
from accounts import auth_fun
# Create your views here.

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


def clubHome(request):
    context={}
    if auth_fun.club_per(request.user):
        club_ec = Club_Ec.objects.get(ec=request.user)
        club = Clubs.objects.get(pk=club_ec.club_id)
        hosted_num = Events.objects.filter(created_by = club).count()
        num_clubs = Clubs.objects.all().count()
        num_member = Perticipants_details.objects.filter(club = club).count()
        tot_member = Perticipants_details.objects.all().count()

        context['club'] = club
        context['num_hosted_event'] = hosted_num
        context['num_clubs'] = num_clubs
        context['num_member'] = num_member
        context['tot_member'] = tot_member
        return render(request, 'club/dashboard.html',context)
    else:
        return redirect('login')


def settings(request):
    context = {}
    if auth_fun.club_per(request.user):
        club_ec = Club_Ec.objects.get(ec=request.user)
        club = Clubs.objects.get(pk=club_ec.club_id)
        context['club'] = club
        if request.POST:
            email = request.POST.get('email')
            password = request.POST.get('password')
            club.clubemail = email
            club.password = password
            club.save()
            messages.add_message(request, messages.SUCCESS, 'Email Updated')
        return render(request, 'club/settings.html',context)
    else:
        return redirect('login')
