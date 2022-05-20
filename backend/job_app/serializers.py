from rest_framework.serializers import ModelSerializer
from .models import Job, Company, Report
from django.contrib.auth.models import User

class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'

class JobSerializer(ModelSerializer):
    class Meta:
        model = Job
        fields = '__all__'

class CompanySerializer(ModelSerializer):
    class Meta:
        model = Company
        fields = '__all__'
        
class ReportSerializer(ModelSerializer):
    class Meta:
        model = Report
        fields = '__all__'