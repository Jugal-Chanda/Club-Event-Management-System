from django.shortcuts import render,redirect
from club.models import Club_Ec,Clubs,member
from eventapp.models import Events,Perticipants_details
from django.contrib import messages
from accounts import auth_fun
from club.forms import update_gallery
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
def gallery(request):
    context={}
    if auth_fun.club_per(request.user):
        club_ec = Club_Ec.objects.get(ec=request.user)
        club = Clubs.objects.get(pk=club_ec.club_id)
        context['club'] = club
        if request.POST:
            form = update_gallery(request.POST, request.FILES)
            if form.is_valid():
                gal = form.save(commit=False)
                gal.club = club
                gal.save()
                form = update_gallery()
                context['form'] = form
                messages.add_message(request, messages.SUCCESS, 'Image Uploaded. It can show in user view')
            else:
                context['form'] = form
        else:
            form = update_gallery()
            context['form'] = form

        return render(request, 'club/gallery.html',context)
    else:
        return redirect('login')
def members(request):
    context={}
    if auth_fun.club_per(request.user):
        club_ec = Club_Ec.objects.get(ec=request.user)
        club = Clubs.objects.get(pk=club_ec.club_id)
        members = member.objects.all().filter(club=club,approved=True)
        context['club'] = club
        context['members'] = members
        return render(request, 'club/allmember.html',context)
    else:
        return redirect('login')
def requests(request):
    context={}
    if auth_fun.club_per(request.user):
        club_ec = Club_Ec.objects.get(ec=request.user)
        club = Clubs.objects.get(pk=club_ec.club_id)
        mem_requests = member.objects.all().filter(club=club,approved=False)
        context['club'] = club
        context['members'] = mem_requests

        return render(request, 'club/requests.html',context)
    else:
        return redirect('login')

def clubHome(request):
    context={}
    if auth_fun.club_per(request.user):
        club_ec = Club_Ec.objects.get(ec=request.user)
        club = Clubs.objects.get(pk=club_ec.club_id)
        hosted_num = Events.objects.filter(created_by = club).count()
        num_clubs = Clubs.objects.all().count()
        num_member = Perticipants_details.objects.filter(club = club).count()
        tot_member = member.objects.all().filter(club = club).count()

        context['club'] = club
        context['num_hosted_event'] = hosted_num
        context['num_clubs'] = num_clubs
        context['num_member'] = num_member
        context['tot_member'] = tot_member
        return render(request, 'club/dashboard.html',context)
    else:
        return redirect('login')


def update_email(request):
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

def update_description(request):
    context = {}
    if auth_fun.club_per(request.user):
        club_ec = Club_Ec.objects.get(ec=request.user)
        club = Clubs.objects.get(pk=club_ec.club_id)
        context['club'] = club
        if request.POST:
            description = request.POST.get('description')
            club.description = description
            club.save()
            messages.add_message(request, messages.SUCCESS, 'Club Description Updated')
        return render(request, 'club/settings.html',context)
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
