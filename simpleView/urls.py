from django.urls import path, include, re_path
from .views import *
from rest_framework import routers

router = routers.DefaultRouter()
router.register(r'teachers', TeacherModelViewSet)
router.register(r'lessons', LessonModelViewSet)
router.register(r'students', StudentModelViewSet)
router.register(r'groups', GroupModelViewSet)

urlpatterns = [
    path('', pageindex),
    path('test/', pagetwo),
    path('<int:id>/', pageid),
    path('api/v1/', include(router.urls)),
    path('api/v1/auth/', include('djoser.urls')),
    re_path('api/v1/auth/', include('djoser.urls.authtoken')),
]
