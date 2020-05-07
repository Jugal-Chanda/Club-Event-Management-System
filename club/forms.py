from django import forms
from club.models import Clubs,member,Gallery

class registerClub(forms.ModelForm):
    """docstring for ."""
    clubname = forms.CharField(max_length = 60, widget = forms.TextInput(attrs={'class':'form-control','placeholder':"Club Name Here"}))
    shortname = forms.CharField(max_length = 60, widget = forms.TextInput(attrs={'class':'form-control','placeholder':"Club Short Name Here"}))
    logo = forms.ImageField(widget = forms.FileInput(attrs={'class':'form-control','placeholder':"Club Logo Here"}))
    # shortname = forms.TextInput(attrs={'class':'form-control','placeholder':"Club Name Here"})
    # shortname = forms.FileInput(attrs={'class':'form-control','placeholder':"Club Name Here"})

    class Meta:
        """docstring for ."""
        model = Clubs
        fields = ('clubname','shortname','logo')

class update_gallery(forms.ModelForm):
    """docstring for ."""
    image = forms.ImageField(label="Gallery Image",widget = forms.FileInput(attrs={'class':'form-control','placeholder':"Gallery Image"}))
    # shortname = forms.TextInput(attrs={'class':'form-control','placeholder':"Club Name Here"})
    # shortname = forms.FileInput(attrs={'class':'form-control','placeholder':"Club Name Here"})

    class Meta:
        """docstring for ."""
        model = Gallery
        fields = ('image',)

class member_request_form(forms.ModelForm):
    """docstring for ."""
    name = forms.CharField(label="Full Name",widget= forms.TextInput(attrs={'class': 'form-control','placeholder':'Enter Your Full Name'}))
    email = forms.EmailField(label="Email Address",help_text="We'll never share your email with anyone else.", widget= forms.EmailInput(attrs={'class': 'form-control','aria-describedby':'emailHelp','placeholder':'Enter email'}))
    std_id = forms.CharField(label="Student ID",widget= forms.TextInput(attrs={'class': 'form-control','placeholder':'Enter Your Student Id'}))
    phone_number = forms.CharField(label="Phone Number",widget= forms.TextInput(attrs={'class': 'form-control','placeholder':'Enter Your Phone Number'}))
    semister = forms.IntegerField(label="Number Of Semister",max_value=21,min_value=0,widget= forms.NumberInput(attrs={'class': 'form-control','placeholder':'Enter your semister'}))
    completed_credit = forms.IntegerField(label="Completed Credit",min_value=0,widget= forms.NumberInput(attrs={'class': 'form-control','placeholder':'Enter your completed credit'}))


    class Meta:
        """docstring for ."""
        model = member
        fields = ('name','std_id','email','phone_number','semister','completed_credit')
