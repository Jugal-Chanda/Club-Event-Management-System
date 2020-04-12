# Generated by Django 3.0.2 on 2020-04-12 13:13

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('club', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='clubs',
            name='form',
            field=models.DateField(auto_now_add=True, default=django.utils.timezone.now),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='clubs',
            name='password',
            field=models.CharField(blank=True, max_length=255),
        ),
        migrations.AlterField(
            model_name='clubs',
            name='clubemail',
            field=models.EmailField(blank=True, max_length=255),
        ),
        migrations.CreateModel(
            name='Club_Ec',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_joined', models.DateField(auto_now_add=True)),
                ('designation', models.CharField(max_length=64)),
                ('club', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='club.Clubs')),
                ('ec', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='clubs',
            name='ec',
            field=models.ManyToManyField(through='club.Club_Ec', to=settings.AUTH_USER_MODEL),
        ),
    ]