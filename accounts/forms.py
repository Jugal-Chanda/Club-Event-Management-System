from django import forms
from django.contrib.auth.forms import UserCreationForm
from accounts.models import Accounts
from django.contrib.auth import authenticate

class RegistrationForm(UserCreationForm):
    """docstring for ."""
    image = forms.ImageField(label="Upload Your Image",widget = forms.FileInput(attrs={'class':'form-control','placeholder':"Your Image"}))
    fullname = forms.CharField(label="Full Name",widget= forms.TextInput(attrs={'class': 'form-control','placeholder':'Enter Your Full Name'}))
    email = forms.EmailField(label="Email Address",help_text="We'll never share your email with anyone else.", widget= forms.EmailInput(attrs={'class': 'form-control','aria-describedby':'emailHelp','placeholder':'Enter email'}))
    username = forms.CharField(label="Username",widget= forms.TextInput(attrs={'class': 'form-control','placeholder':'Enter Username'}))
    phone_number = forms.CharField(label="Phone Number",widget= forms.TextInput(attrs={'class': 'form-control','placeholder':'Enter Your Phone Number'}))
    password1 = forms.CharField(label="Password",help_text="Don't share your password with others",widget= forms.PasswordInput(attrs={'class': 'form-control','placeholder':'Enter Password'}))
    password2 = forms.CharField(label="Confirm Password",help_text="",widget= forms.PasswordInput(attrs={'class': 'form-control','placeholder':'Re-Enter Password'}))


    class Meta:
        """docstring for ."""
        model = Accounts
        fields = ('image','fullname','email','username','phone_number','password1','password2')


class Log_in_Form(forms.Form):
    """docstring for ."""
    email = forms.EmailField(label="Email Address",help_text="We'll never share your email with anyone else.", widget= forms.EmailInput(attrs={'class': 'form-control','aria-describedby':'emailHelp','placeholder':'Enter email'}))
    password = forms.CharField(label="Password",help_text="Don't share your password with others",widget= forms.PasswordInput(attrs={'class': 'form-control','placeholder':'Enter Password'}))
    class Meta:
        """docstring for ."""
        model = Accounts
        fields = ('email','password')

        def clean(self):
            email = self.cleaned_data['email']
            password = self.cleaned_data['password']
            if not authenticate(email=email,password=password):
                raise forms.ValidationError("Invalid login")
