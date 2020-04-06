from django.shortcuts import render,redirect
from club.forms import registerClub
from accounts.models import Accounts
from club.models import Clubs,Club_Ec

# Create your views here.
def mainAdmin(request):
    if request.user.is_authenticated and request.user.is_admin:
        return render(request, 'admin/admin.html')
    else:
        return redirect('login')




def registerclub(request):
    context={}
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

def allclubs(request):
    context={}
    context['clubs'] = Clubs.objects.all()
    return render(request, 'admin/allclubs.html',context)

def clubsingle(request,clubname):
    context={}
    club = Clubs.objects.get(clubname=clubname)
    club_ec = Club_Ec.objects.filter(club=club).values('id','ec_id__username','ec_id__email','ec_id__phone_number','date_joined','club__clubname','designation')
    context['details'] = club_ec
    context['club'] = club
    if request.POST:
        print("hello")
    return render(request, 'admin/clubsingle.html',context)
