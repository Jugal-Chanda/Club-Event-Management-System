from django.contrib import admin
from django.urls import path,include
from mainadmin import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.mainAdmin, name='adminHome'),
    path('registerclub/', views.registerclub, name='registerclub'),
    path('clubs/', views.allclubs, name='allclubs'),
    path('clubs/<str:clubname>/', views.clubsingle, name='clubsingle'),
    path('uploadcalendar/', views.uploadcalendar, name='uploadcalendar'),
]
