from django.db import models
from accounts.models import Accounts

# Create your models here.
class Clubs(models.Model):
    clubname = models.CharField(blank=False, max_length = 255,unique=True)
    shortname = models.CharField(blank=False, max_length = 10)
    clubemail = models.EmailField(max_length=255,blank=True)
    password = models.CharField(max_length=255,blank=True)
    logo = models.ImageField(upload_to="club_logo/")
    form = models.DateField(auto_now_add=True)
    is_active = models.BooleanField(default=True)
    ec = models.ManyToManyField(Accounts, through='club_ec')


    def __str__(self):
        return self.clubname

class Club_Ec(models.Model):
    ec = models.ForeignKey(Accounts, on_delete=models.CASCADE)
    club = models.ForeignKey(Clubs, on_delete=models.CASCADE)
    date_joined = models.DateField(auto_now_add=True)
    designation = models.CharField(max_length=64)
