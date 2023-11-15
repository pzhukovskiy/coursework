from django.shortcuts import render, HttpResponse
from .models import *
from rest_framework import viewsets
from .serializators import *
from datetime import date, timedelta
from rest_framework.response import Response

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

class EmployeeModelViewSet(viewsets.ModelViewSet):
    queryset = Employee.objects.all()
    serializer_class = EmployeeSerializer

class EmployeeAHCHModelViewSet(viewsets.ModelViewSet):
    queryset = EmployeeAHCH.objects.all()
    serializer_class = EmployeeAHCHSerializer

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

class NewsModelViewSet(viewsets.ModelViewSet):
    queryset = News.objects.all()
    serializer_class = NewsSerializer

#get lesson
class GetLessonsForCurrentDateGroupViewSet(viewsets.ViewSet):
    def list(self, request, pk=1):
        queryset = Lesson.objects.filter(date=date.today()).filter(group=pk)
        serializer = LessonSerializer(queryset, many=True)
        return Response(serializer.data)
    
class GetLessonsForWeekGroupViewSet(viewsets.ViewSet):
    def list(self, request):
        day = date.today()
        start_week = day - timedelta(days=day.weekday())
        end_week = start_week + timedelta(days=6)
        queryset = Lesson.objects.filter(date__range = (start_week, end_week)).order_by("group__id")
        serializer = LessonSerializer(queryset, many=True)
        print(start_week)
        print(end_week)
        return Response(serializer.data)