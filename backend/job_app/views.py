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
                message={"Message":"No such User"}
                return JsonResponse(message, safe=False) 
        
    elif request.method == "POST":
        customer_data = JSONParser().parse(request)
        try :
            other_customer = User.objects.get(username = customer_data["username"])
            if other_customer:
                message={"Message":"The user Name already Exist!"}
                return JsonResponse(message, safe=False)
        except:
            customer_data["password"] = make_password(customer_data["password"])
            customer_serializer = UserSerializer(data=customer_data)
            if customer_serializer.is_valid():
                customer_serializer.save()
                message={"Message":"You have registered successfully!"}
                return JsonResponse(message, status=201, safe=False)
            message={"Message":"Failed to Register!","Statuscode":"400"}
            return JsonResponse(message, safe=False)
    
    elif request.method == "PUT":
        customer_data = JSONParser().parse(request)
        try:
            customer = User.objects.get(id = pk)
            customer_data["password"] = make_password(customer_data["password"])
            customer_serializer = UserSerializer(customer, data=customer_data)
            if customer_serializer.is_valid():
                customer_serializer.save()
                message={"Message":"Data Updated Successfully"}
                return JsonResponse(message, safe=False)
            message={"Message":"Unable to update!"}
            return JsonResponse(message, safe=False)
        except:
            message={"Message":"The same Id is Already in use!"}
            return JsonResponse(message, safe=False)
    elif request.method == "DELETE":
        try:
            customer = User.objects.get(id=pk)
            if customer:
                customer.delete()
                message={"Message":"Data Deleted successfuly"}
                return JsonResponse(message, safe=False)
        except:
            message={"Message":"No such user!"}
            return JsonResponse(message, safe=False)



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
                message={"Message":"No such company!"}
                return JsonResponse(message, safe=False) 
        
    elif request.method == "POST":
        company_data = JSONParser().parse(request)
        try :
            other_company = User.objects.get(name = company_data["name"])
            if other_company:
                message={"Message":"The User Name Already Exist!"}
                return JsonResponse(message, safe=False)
        except:
            company_data["password"] = make_password(company_data["password"])
            company_serializer = CompanySerializer(data=company_data)
            if company_serializer.is_valid():
                company_serializer.save()
                message={"Message":"The Company Registered successfully!","Statuscode":"201"}
                return JsonResponse(message, safe=False)
            message={"Message":"Failed to Register!","Statuscode":"400"}
            return JsonResponse(message, safe=False)
    
    elif request.method == "PUT":
        company_data = JSONParser().parse(request)
        try:
            company = User.objects.get(id = pk)
            company_data["password"] = make_password(company_data["password"])
            company_serializer = CompanySerializer(company, data=company_data)
            if company_serializer.is_valid():
                company_serializer.save()
                message={"Message":"Data Updated Successfully!"}
                return JsonResponse(message, safe=False)
            message={"Message":"Unable to update!"}
            return JsonResponse(message, safe=False)
        except:
            message={"Message":"The same ID is already in use!"}
            return JsonResponse(message, safe=False)
    elif request.method == "DELETE":
        try:
            company = User.objects.get(id=pk)
            if company:
                company.delete()
                message={"Message":"Data deleted succcessfully"}
                return JsonResponse(message, safe=False)
        except:
            message={"Message":"No such Company!"}
            return JsonResponse(message, safe=False)



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
                message={"Message":"No such Job!"}
                return JsonResponse(message, safe=False) 
        
    elif request.method == "POST":
        job_data = JSONParser().parse(request)
        try :
            other_jobs = User.objects.get(name = job_data["name"])
            if other_jobs:
                message={"Message":"The user name is already exist!"}
                return JsonResponse(message, safe=False)
        except:
            job_serializer = JobSerializer(data=job_data)
            if job_serializer.is_valid():
                job_serializer.save()
                message={"Message":"Company is registered successfully!","Statuscode":"201"}
                return JsonResponse(message, safe=False)
            message={"Message":"Failed to register!","Statuscode":"400"}
            return JsonResponse(message, safe=False)
    
    elif request.method == "PUT":
        job_data = JSONParser().parse(request)
        try:
            company = User.objects.get(id = pk)
            job_serializer = JobSerializer(job, data=job_data)
            if job_serializer.is_valid():
                job_serializer.save()
                message={"Message":"Data Updated successfully!"}
                return JsonResponse(message, safe=False)
            message={"Message":"Unable to udpate!"}
            return JsonResponse(message, safe=False)
        except:
            message={"Message":"The same ID is already in use!"}
            return JsonResponse(message, safe=False)
    elif request.method == "DELETE":
        try:
            job = Job.objects.get(id=pk)
            if job:
                job.delete()
                message={"Message":"Data is deleted successfully!"}
                return JsonResponse(message, safe=False)
        except:
            message={"Message":"No such Job!"}
            return JsonResponse(message, safe=False)

