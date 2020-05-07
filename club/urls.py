from django.contrib import admin
from django.urls import path,include
from club import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.clubHome, name='clubHome'),
    path('settings/', views.settings, name='settings'),
    path('requests/', views.requests, name='mem_requests'),
    path('members/', views.members, name='members'),
    path('update_email/', views.update_email, name='update_email'),
    path('gallery/', views.gallery, name='update_gallery'),
    path('update_description/', views.update_description, name='update_description'),
    #path('clubs/', views.clubs, name='allclubs'),

]
urlpatterns = urlpatterns + static(settings.MEDIA_URL,document_root =settings.MEDIA_ROOT)
