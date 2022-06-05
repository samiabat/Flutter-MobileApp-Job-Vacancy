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
                'email':str(request.user.email),
            }
            return Response(content)
        except:
            content = {
                'user': str(request.user),
                'role': "admin",
                'id': str(request.user.id),
                'email':str(request.user.email),
            }
            return Response(content)


@csrf_exempt
@api_view (['GET', 'POST', 'DELETE', 'PUT'])
def userApi(request, pk=-1):
    if request.method == "GET":
        if pk==-1:
            users = User.objects.all()
            users_serializer = UserSerializer(users, many=True)
            return JsonResponse(users_serializer.data, status = 200,  safe=False)
        else:
            try:
                user = User.objects.get(id=pk)
                if user is not None:
                    user_serializer = UserSerializer(user)
                    return JsonResponse(user_serializer.data, status = 200, safe=False)
            except:
                message = {"message":"No such user!"}
                return JsonResponse(message, status = 404, safe=False) 
        
    elif request.method == "POST":
        customer_data = JSONParser().parse(request)
        try :
            other_customer = User.objects.get(username = customer_data["username"])
            if other_customer:
                message = {"message": "The User Name Already Exist!", "statusCode":400}
                return JsonResponse(message, safe=False)
        except:
            customer_data["password"] = make_password(customer_data["password"])
            customer_serializer = UserSerializer(data=customer_data)
            if customer_serializer.is_valid():
                customer_serializer.save()
                message = {"message":"User Registered Succesfully!", "statusCode":201}
                return JsonResponse(message, status=201, safe=False)
            message = {"message":"Email should be like sami@gmail.com!", "statusCode":400}
            return JsonResponse(message, status=400, safe=False)
    
    elif request.method == "PUT":
        customer_data = JSONParser().parse(request)
        try:
            customer = User.objects.get(id = pk)
            customer_data["password"] = make_password(customer_data["password"])
            customer_serializer = UserSerializer(customer, data=customer_data)
            if customer_serializer.is_valid():
                customer_serializer.save()
                message = {"message":"Data Updated Sucessfully!", "statusCode":204}
                return JsonResponse(message, safe=False)
        except:
            customer = User.objects.get(username = pk)
            print(customer)
            customer_data["password"] = make_password(customer_data["password"])
            customer_serializer = UserSerializer(customer, data=customer_data)
            if customer_serializer.is_valid():
                customer_serializer.save()
                message = {"message":"Data Updated Sucessfully!", "statusCode":204}
                return JsonResponse(message, safe=False)
        return JsonResponse("The Same ID Is Already In Use!", safe=False)

    elif request.method == "DELETE":
        try:
            customer = User.objects.get(id=pk)
            if customer:
                customer.delete()
                return JsonResponse("Data Deleted Sucessfully!", status=204, safe=False)
        except:
            customer = User.objects.get(username=pk)
            if customer:
                customer.delete()
                return JsonResponse("Data Deleted Sucessfully!", status=204, safe=False)
        return JsonResponse("No Such User!", status = 404,  safe=False)



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
            company = Company.objects.get(id=pk)
            if company:
                company.delete()
                message = {"message":"Data deleted succesfully!", "statusCode":200}
                return JsonResponse(message, safe=False)
        except:
            message = {"message":"No Such Company!", "statusCode":400}
            return JsonResponse(message, status = 401, safe=False)



@csrf_exempt
@api_view (['GET', 'POST', 'DELETE', 'PUT'])
@permission_classes([IsAuthenticated])
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
        print(job_data)
        job_serializer = JobSerializer(data=job_data)


        if job_serializer.is_valid():
            job_serializer.save()
            return JsonResponse("Job Register Sucessfully!", status=201, safe=False)
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

