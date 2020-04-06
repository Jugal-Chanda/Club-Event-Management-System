from django.contrib import admin
from django.urls import path,include
from newAndNotices import views
urlpatterns = [
    path('addnews/', views.addnews, name='addnews'),
    path('addnotices/', views.addnotices, name='addnotices'),
    path('allnews/',views.allnews,name="allnews"),
    path('deletenews/<int:id>',views.deletenews,name="deletenews"),
    path('notices/',views.allnotice,name="allnotice"),
    path('deletenotice/<int:id>',views.deletenotice,name="deletenotice"),

]
