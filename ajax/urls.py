from django.urls import path,include
from ajax import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('email_validate_for_add_ec/', views.add_ec_email_validate, name='add_ec_email_validate'),
    path('add_ec_data_to_database/', views.add_ec_data_to_database, name='add_ec_data_to_database'),
    path('disable_club/', views.disable_club, name='disable_club'),
    path('enable_club/', views.enable_club, name='enable_club'),
    path('delete_ec/', views.delete_ec, name='delete_ec'),
    path('register_perticipant/',views.register_perticipant,name="register_perticipant"),
    path('check_perticipate_data/',views.check_perticipate_data,name="check_perticipate_data"),
    path('sendemail/',views.sendemail,name="sendemail"),
    path('update_profile/',views.update_profile,name="update_profile"),
    path('change_password/',views.change_password,name="change_password"),
    path('edit_event/',views.edit_event,name="edit_event"),
    path('approve_member_request/',views.approve_member_request,name="approve_member_request"),
    path('remove_member_request/',views.remove_member_request,name="remove_member_request"),

    # path('shownews/',views.shownews,name="shownews"),

]
