from django import forms
from mainadmin.models import Academic_calendar

class upload_calendar_form(forms.ModelForm):
    """docstring for ."""
    calendar_label = forms.CharField(max_length = 60, widget = forms.TextInput(attrs={'class':'form-control','placeholder':"Label Of this file"}))
    file = forms.FileField(widget = forms.FileInput(attrs={'class':'form-control','placeholder':"Pdf file of academic_ calendar"}))

    class Meta:
        """docstring for ."""
        model = Academic_calendar
        fields = ('calendar_label','file')
