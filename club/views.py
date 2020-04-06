from django.shortcuts import render,redirect
from club.models import Club_Ec,Clubs
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
    if is_authenticate(request):
            if request.user.is_ec:
                club_ec = Club_Ec.objects.get(ec=request.user)
                club = Clubs.objects.get(pk=club_ec.club_id)
                context['club'] = club
                return render(request, 'club/dashboard.html',context)
            else:
                return redirect(redirect_permisions(request.user))
    else:
        return redirect('login')
