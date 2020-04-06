from django import forms
from club.models import Clubs

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

# class add_ec(forms.ModelForm):
#     """docstring for ."""
#     OPTIONS = []
#     accounts = Accounts.objects.all()
#     for account in accounts:
#         temp = []
#         if not account.is_admin:
#             temp.append(account.email)
#             temp.append(account.username)
#             OPTIONS.append(tuple(temp))
#     OPTIONS = tuple(OPTIONS)
#
#     # ec = forms.ModelChoiceField(queryset=YourModel.objects.all()),empty_label="Choose a countries",)
#     #ec = forms.MultipleChoiceField(widget=forms.SelectMultiple,choices=OPTIONS)
#     ec = forms.MultipleChoiceField(widget=forms.CheckboxSelectMultiple,choices=OPTIONS)
#     class Meta:
#         """docstring for ."""
#         model = Club_Ec
#         fields = ('designation',)
