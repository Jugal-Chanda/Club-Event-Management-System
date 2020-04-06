from django import forms
from newAndNotices.models import News,Notices

class addnewsform(forms.ModelForm):
    """docstring for ."""
    newstitle = forms.CharField(max_length = 255, widget = forms.TextInput(attrs={'class':'form-control','placeholder':"News Title Here"}))
    description = forms.CharField(widget = forms.Textarea(attrs={'class':'form-control','placeholder':"News Here"}))

    class Meta:
        """docstring for ."""
        model = News
        fields = ('newstitle','description')

class addnoticesform(forms.ModelForm):
    """docstring for ."""
    noticetitle = forms.CharField(max_length = 255, widget = forms.TextInput(attrs={'class':'form-control','placeholder':"Notice Title Here"}))
    description = forms.CharField(widget = forms.Textarea(attrs={'class':'form-control','placeholder':"Notice Here"}))

    class Meta:
        """docstring for ."""
        model = Notices
        fields = ('noticetitle','description')
