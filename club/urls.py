from django.contrib import admin
from django.urls import path,include
from club import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.clubHome, name='clubHome'),
    #path('clubs/', views.clubs, name='allclubs'),

]
urlpatterns = urlpatterns + static(settings.MEDIA_URL,document_root =settings.MEDIA_ROOT)
