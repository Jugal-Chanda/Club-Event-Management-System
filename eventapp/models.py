from django.db import models
from club.models import Clubs

# Create your models here.
class Events(models.Model):
    event_cover_photo = models.ImageField(upload_to="event_cover/")
    eventname = models.CharField(blank=False, max_length = 255,unique=True)
    eventlocation = models.TextField(blank=False)
    description = models.TextField(blank=False)
    startdate = models.DateTimeField()
    enddate = models.DateTimeField()
    created_at = models.DateTimeField(auto_now_add=True)
    created_by = models.ForeignKey(Clubs, on_delete=models.CASCADE)


class Perticipants_details(models.Model):
    name = models.CharField(blank=False, max_length = 255)
    std_id = models.CharField(blank=False, max_length = 255)
    email = models.EmailField(blank=False,max_length=255)
    phone = models.CharField(blank=False, max_length = 255)
    event = models.ForeignKey(Events, on_delete=models.CASCADE)
    club = models.ForeignKey(Clubs, on_delete=models.CASCADE)
