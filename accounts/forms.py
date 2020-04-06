from django import forms
from django.contrib.auth.forms import UserCreationForm
from accounts.models import Accounts
from django.contrib.auth import authenticate

class RegistrationForm(UserCreationForm):
    """docstring for ."""

    email = forms.EmailField(help_text="Enter Email Address")
    class Meta:
        """docstring for ."""
        model = Accounts
        fields = ('email','username','password1','password2')


class Log_in_Form(forms.Form):
    """docstring for ."""
    email = forms.EmailField(help_text="jacee tai")
    password = forms.CharField(help_text="enter Password",widget= forms.PasswordInput)
    class Meta:
        """docstring for ."""
        model = Accounts
        fields = ('email','password')

        def clean(self):
            email = self.cleaned_data['email']
            password = self.cleaned_data['password']
            if not authenticate(email=email,password=password):
                raise forms.ValidationError("Invalid login")
