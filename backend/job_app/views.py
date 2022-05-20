from django.http import JsonResponse
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth.hashers import make_password
from django.contrib.auth.models import User

from rest_framework.decorators import api_view, permission_classes
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser

from .serializers import *



@api_view(['GET'])
@permission_classes([IsAuthenticated])
def profileApi(request, format=None):
    if request.user!="AnonymousUser":
        try:
            content = {
                'user': str(request.user),
                'role': str(request.user.groups.all()[0]),  
                'id': str(request.user.id),
            }
            return Response(content)
        except:
            content = {
                'user': str(request.user),
                'role': "admin",  
            }
            return Response(content)


@csrf_exempt
@api_view (['GET', 'POST', 'DELETE', 'PUT'])
def userApi(request, pk=-1):
    if request.method == "GET":
        if pk==-1:
            users = User.objects.all()
            users_serializer = UserSerializer(users, many=True)
            return JsonResponse(users_serializer.data, safe=False)
        else:
            try:
                user = User.objects.get(id=pk)
                if user is not None:
                    user_serializer = UserSerializer(user)
                    return JsonResponse(user_serializer.data, safe=False)
            except:
                return JsonResponse("No Such User!", safe=False) 
        
    elif request.method == "POST":
        customer_data = JSONParser().parse(request)
        try :
            other_customer = User.objects.get(username = customer_data["username"])
            if other_customer:
                return JsonResponse("The User Name Already Exist!", safe=False)
        except:
            customer_data["password"] = make_password(customer_data["password"])
            customer_serializer = UserSerializer(data=customer_data)
            if customer_serializer.is_valid():
                customer_serializer.save()
                return JsonResponse("User Register Sucessfully!", status=201, safe=False)
            return JsonResponse("Failed To Register!", status=400, safe=False)
    
    elif request.method == "PUT":
        customer_data = JSONParser().parse(request)
        try:
            customer = User.objects.get(id = pk)
            customer_data["password"] = make_password(customer_data["password"])
            customer_serializer = UserSerializer(customer, data=customer_data)
            if customer_serializer.is_valid():
                customer_serializer.save()
                return JsonResponse("Data Updated Sucessfully!", safe=False)
            return JsonResponse("Unable To Update!", safe=False)
        except:
            return JsonResponse("The Same ID Is Already In Use!", safe=False)
    elif request.method == "DELETE":
        try:
            customer = User.objects.get(id=pk)
            if customer:
                customer.delete()
                return JsonResponse("Data Deleted Sucessfully!", safe=False)
        except:
            return JsonResponse("No Such User!", safe=False)



@csrf_exempt
@api_view (['GET', 'POST', 'DELETE', 'PUT'])
def companyApi(request, pk=-1):
    if request.method == "GET":
        if pk==-1:
            comapnies = Company.objects.all()
            company_serializer = CompanySerializer(comapnies, many=True)
            return JsonResponse(company_serializer.data, safe=False)
        else:
            try:
                company = Company.objects.get(id=pk)
                if company is not None:
                    company_serializer = CompanySerializer(company)
                    return JsonResponse(company_serializer.data, safe=False)
            except:
                return JsonResponse("No Such Company!", safe=False) 
        
    elif request.method == "POST":
        company_data = JSONParser().parse(request)
        try :
            other_company = User.objects.get(name = company_data["name"])
            if other_company:
                return JsonResponse("The User Name Already Exist!", safe=False)
        except:
            company_data["password"] = make_password(company_data["password"])
            company_serializer = CompanySerializer(data=company_data)
            if company_serializer.is_valid():
                company_serializer.save()
                return JsonResponse("Company Register Sucessfully!", status=201, safe=False)
            return JsonResponse("Failed To Register!", status=400, safe=False)
    
    elif request.method == "PUT":
        company_data = JSONParser().parse(request)
        try:
            company = User.objects.get(id = pk)
            company_data["password"] = make_password(company_data["password"])
            company_serializer = CompanySerializer(company, data=company_data)
            if company_serializer.is_valid():
                company_serializer.save()
                return JsonResponse("Data Updated Sucessfully!", safe=False)
            return JsonResponse("Unable To Update!", safe=False)
        except:
            return JsonResponse("The Same ID Is Already In Use!", safe=False)
    elif request.method == "DELETE":
        try:
            company = User.objects.get(id=pk)
            if company:
                company.delete()
                return JsonResponse("Data Deleted Sucessfully!", safe=False)
        except:
            return JsonResponse("No Such Company!", safe=False)



@csrf_exempt
@api_view (['GET', 'POST', 'DELETE', 'PUT'])
def jobApi(request, pk=-1):
    if request.method == "GET":
        if pk==-1:
            jobs = Job.objects.all()
            job_serializer = JobSerializer(jobs, many=True)
            return JsonResponse(job_serializer.data, safe=False)
        else:
            try:
                job = Job.objects.get(id=pk)
                if job is not None:
                    job_serializer = JobSerializer(company)
                    return JsonResponse(job_serializer.data, safe=False)
            except:
                return JsonResponse("No Such Job!", safe=False) 
        
    elif request.method == "POST":
        job_data = JSONParser().parse(request)
        try :
            other_jobs = User.objects.get(name = job_data["name"])
            if other_jobs:
                return JsonResponse("The User Name Already Exist!", safe=False)
        except:
            job_serializer = JobSerializer(data=job_data)
            if job_serializer.is_valid():
                job_serializer.save()
                return JsonResponse("Company Register Sucessfully!", status=201, safe=False)
            return JsonResponse("Failed To Register!", status=400, safe=False)
    
    elif request.method == "PUT":
        job_data = JSONParser().parse(request)
        try:
            company = User.objects.get(id = pk)
            job_serializer = JobSerializer(job, data=job_data)
            if job_serializer.is_valid():
                job_serializer.save()
                return JsonResponse("Data Updated Sucessfully!", safe=False)
            return JsonResponse("Unable To Update!", safe=False)
        except:
            return JsonResponse("The Same ID Is Already In Use!", safe=False)
    elif request.method == "DELETE":
        try:
            job = Job.objects.get(id=pk)
            if job:
                job.delete()
                return JsonResponse("Data Deleted Sucessfully!", safe=False)
        except:
            return JsonResponse("No Such job!", safe=False)

