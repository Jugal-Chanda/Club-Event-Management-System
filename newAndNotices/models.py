from django.db import models
from accounts.models import Accounts

# Create your models here.
class News(models.Model):
    newstitle = models.CharField(blank=False, max_length = 255,unique=True)
    description = models.TextField(blank=False)
    created_at = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.newstitle


class Notices(models.Model):
    noticetitle = models.CharField(blank=False, max_length = 255,unique=True)
    description = models.TextField(blank=False)
    created_at = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.noticetitle
