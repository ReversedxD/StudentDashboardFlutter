from django.http import HttpResponse
from django.shortcuts import render
from .models import *
from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from rest_framework.decorators import api_view, permission_classes

# Create your views here.

def printHello(request):
    return HttpResponse("hello world")


@api_view(['GET'])
@permission_classes([AllowAny])
def hello_django(request):
    print("Request Received")
    return Response({'message: Got it!'}, status = 200)
