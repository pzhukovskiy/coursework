from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(User)
# admin.site.register(Teacher)
# admin.site.register(Room)
# admin.site.register(Lesson)
admin.site.register(Corpus)
# admin.site.register(Subject)
# admin.site.register(Student)
# admin.site.register(Group)
admin.site.register(Absent)

@admin.register(Teacher)
class TeacherAdmin(admin.ModelAdmin):
    list_filter = ['middle_name']
    list_display = ['id', 'middle_name', 'first_name', 'last_name']
    list_display_links = ['middle_name', 'first_name', 'last_name']

@admin.register(Student)
class StudentAdmin(admin.ModelAdmin):
    list_filter = ['middle_name']
    list_display = ['id', 'middle_name', 'first_name', 'last_name']
    list_display_links = ['middle_name', 'first_name', 'last_name']

@admin.register(Lesson)
class LessonAdmin(admin.ModelAdmin):
    list_filter = ['subgroup']
    list_display = ['lesson_number', 'subgroup', 'lesson_type', 'room', 'teacher', 'subject']
    list_display_links = ['lesson_number', 'subgroup', 'lesson_type', 'room', 'teacher', 'subject']

@admin.register(Group)
class GroupAdmin(admin.ModelAdmin):
    list_filter = ['group']
    list_display = ['id', 'group']
    list_display_links = ['group']

@admin.register(Room)
class RoomAdmin(admin.ModelAdmin):
    list_filter = ['room']
    list_display = ['id', 'room', 'corpus']
    list_display_links = ['room', 'corpus']

@admin.register(Subject)
class SubjectAdmin(admin.ModelAdmin):
    list_filter = ['subject']
    list_display = ['id', 'subject', 'description', 'type_subject']
    list_display_links = ['subject', 'description', 'type_subject']