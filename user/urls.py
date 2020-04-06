from django.urls import path
from user import views

urlpatterns = [
    path('', views.home, name='home'),
    path('event/<str:eventname>/', views.event_single, name='eventsingleuser'),
    path('news/<str:newsname>/', views.newssingle, name='newssingle'),
    path('notice/<str:noticename>/', views.noticeingle, name='noticeingle'),
]
