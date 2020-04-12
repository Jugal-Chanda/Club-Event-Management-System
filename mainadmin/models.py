from django.db import models

# Create your models here.
class Academic_calendar(models.Model):
    calendar_label = models.CharField(blank=False,max_length = 255,unique=True)
    file = models.FileField(upload_to='academic_calendar/')
    uploaded_at = models.DateField(auto_now_add=True)
