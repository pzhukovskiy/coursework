from rest_framework import serializers
from .models import *

class CorpusSerializer(serializers.ModelSerializer):
    class Meta:
        model = Corpus
        fields = "__all__"

class RoomSerializer(serializers.ModelSerializer):
    corpus = CorpusSerializer()

    class Meta:
        model = Room
        fields = "__all__"

class GroupSerializer(serializers.ModelSerializer):
    class Meta:
        model = Group
        fields = "__all__"

class StudentSerializer(serializers.ModelSerializer):
    group = GroupSerializer()

    class Meta:
        model = Student
        fields = "__all__"

class SubjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Subject
        fields = "__all__"

class AbsentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Absent
        fields = "__all__"

class TeacherSerializer(serializers.ModelSerializer):
    room = RoomSerializer()
    group = GroupSerializer()

    class Meta:
        model = Teacher
        fields = "__all__"
        
class LessonSerializer(serializers.ModelSerializer):
    room = RoomSerializer()
    teacher = TeacherSerializer()
    subject = SubjectSerializer()
    group = GroupSerializer()
    corpus = CorpusSerializer()

    class Meta:
        model = Lesson
        fields = "__all__"

class NewsSerializer(serializers.ModelSerializer):
    class Meta:
        model = News
        fields = "__all__"