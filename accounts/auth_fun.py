from accounts.models import Accounts
from club.models import Clubs,Club_Ec

def is_authenticate(user):
    return user.is_authenticated

def redirect_permision(user):
    if user.is_admin:
        return 'adminHome'
    elif user.is_ec:
        club_ec = Club_Ec.objects.get(ec=request.user)
        club = Clubs.objects.get(pk=club_ec.club_id)
        if club.is_active:
            return 'clubHome'
        else:
            return 'home'
    else:
        return 'home'

def club_per(user):
    if is_authenticate(user):
        if user.is_ec:
            club_ec = Club_Ec.objects.get(ec=user)
            club = Clubs.objects.get(pk=club_ec.club_id)
            if club.is_active:
                return True
            else:
                return False
        else:
            return False
    else:
        return False

def admin_per(user):
    if is_authenticate(user):
        if user.is_admin:
            return True
        else:
            return False
    else:
        return False
