from django.urls import path,include
from accounts import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('registration/', views.registraion_view, name='registraion'),
    path('login/', views.login_view, name='login'),
    path('logout/',views.logout_view,name="logout")
]
