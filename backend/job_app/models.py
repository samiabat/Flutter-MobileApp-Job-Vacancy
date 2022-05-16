from django.db import models
from django.contrib.auth.models import User

class Job(models.Model):
    title = models.CharField(max_length=30, null=True)
    poster = models.ForeignKey(User, on_delete=models.CASCADE)
    description = models.TextField(blank = True, null=True)
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)



class Company(models.Model):
    name = models.CharField(max_length=30, null=True)
    description = models.TextField(null=True, blank=True)
    follower = models.ForeignKey(User, on_delete=models.CASCADE)
    job = models.ForeignKey(Job, on_delete=models.CASCADE)
    logo = models.ImageField()


class Report(models.Model):
	company = models.ForeignKey(Company, on_delete=models.CASCADE)
	job = models.ForeignKey(Job, on_delete=models.DO_NOTHING)
class Post(models.Model):
    title = models.CharField(max_length=30, null=True)
    company = models.ForeignKey(Company, on_delete=models.CASCADE)
