from django.db import models
from accounts.models import Accounts
from django.core.validators import MinValueValidator, MaxValueValidator

# Create your models here.
class Clubs(models.Model):
    clubname = models.CharField(blank=False, max_length = 255,unique=True)
    shortname = models.CharField(blank=False, max_length = 10)
    clubemail = models.EmailField(max_length=255,blank=True)
    password = models.CharField(max_length=255,blank=True)
    logo = models.ImageField(upload_to="club_logo/")
    description = models.TextField(blank=False)
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

class Gallery(models.Model):
    club = models.ForeignKey(Clubs, on_delete=models.CASCADE)
    image = models.ImageField(upload_to="gallery/")
    upload_date = models.DateField(auto_now_add=True)


class member(models.Model):
    name = models.CharField(blank=False, max_length = 255)
    std_id = models.CharField(blank=False, max_length = 13)
    email = models.EmailField(max_length=255,blank=True)
    phone_number = models.CharField(max_length = 15)
    semister = models.IntegerField(validators=[MinValueValidator(0),MaxValueValidator(21)])
    completed_credit = models.IntegerField(validators=[MinValueValidator(0)])
    club = models.ForeignKey(Clubs, on_delete=models.CASCADE)
    approved = models.BooleanField(default=False)
