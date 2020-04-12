from django.urls import path
from user import views

urlpatterns = [
    path('', views.home, name='home'),
    path('event/', views.event_all, name='event_all'),
    path('event/<str:eventname>/', views.event_single, name='eventsingleuser'),
    path('news/<str:newsname>/', views.newssingle, name='newssingle'),
    path('notice/<str:noticename>/', views.noticeingle, name='noticeingle'),
    path('profile/',views.profile,name="user_profile"),
    path('calendar/',views.calender,name="calendar"),
    path('calendar/<str:label_name>',views.calender_label,name="calender_label"),
]
