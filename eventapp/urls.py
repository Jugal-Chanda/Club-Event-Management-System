
from django.contrib import admin
from django.urls import path,include
from eventapp import views
# from django.conf import settings
# from django.conf.urls.static import static
# manageevent.html
urlpatterns = [
    path('create/', views.createevent, name='createevent'),
    path('hosted/', views.hosted_events, name='hostedevent'),
    path('eventsingle/<str:eventname>', views.eventsingle, name='eventsingle'),
    path('perticipants/', views.perticipants, name='perticipants'),
    path('perticipants/<str:eventname>/', views.perticipants_details, name='perticipants_details'),
    #path('clubs/', views.clubs, name='allclubs')

]
# urlpatterns = urlpatterns + static(settings.MEDIA_URL,document_root =settings.MEDIA_ROOT)
