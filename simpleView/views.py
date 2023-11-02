from django.shortcuts import render, HttpResponse
from .models import *
from rest_framework import viewsets
from .serializators import *

# Create your views here.
def pageindex(request):
    return HttpResponse("Hello world")

def pagetwo(request):
    data = {'teach': Teacher.objects.all()}
    return render(request, 'index.html', data)

def pageid(request, id):
    return HttpResponse(f'Number of route {id}')

class TeacherModelViewSet(viewsets.ModelViewSet):
    queryset = Teacher.objects.all()
    serializer_class = TeacherSerializer

class RoomModelViewSet(viewsets.ModelViewSet):
    queryset = Room.objects.all()
    serializer_class = RoomSerializer

class LessonModelViewSet(viewsets.ModelViewSet):
    queryset = Lesson.objects.all()
    serializer_class = LessonSerializer

class StudentModelViewSet(viewsets.ModelViewSet):
    queryset = Student.objects.all()
    serializer_class = StudentSerializer

class GroupModelViewSet(viewsets.ModelViewSet):
    queryset = Group.objects.all()
    serializer_class = GroupSerializer

class CorpusModelViewSet(viewsets.ModelViewSet):
    queryset = Corpus.objects.all()
    serializer_class = CorpusSerializer

class SubjectModelViewSet(viewsets.ModelViewSet):
    queryset = Subject.objects.all()
    serializer_class = SubjectSerializer

#python manage.py runserver
#python manage.py startapp simpleView
#python manage.py makemigrations
#python manage.py migrate
#python manage.py makemigrations simpleView
#django-admin startproject webapi . 
#pip freeze > req.txt
#python -m venv env
#env\scripts\activate
#createsuperuser

#http://127.0.0.1:8000/api/v1/auth/token/login

#docker tag diplomaback-web pavelzhukovskiy/diploma
#docker push pavelzhukovskiy/diploma