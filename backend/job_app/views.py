from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth.hashers import make_password
from django.contrib.auth.models import User

from rest_framework.decorators import api_view, permission_classes
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser



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