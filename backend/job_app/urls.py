from django.urls import path
from django.contrib.auth import views as auth_views
from . import views
from rest_framework.urlpatterns import format_suffix_patterns
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)




urlpatterns = [
    path('profile/', views.profileApi),
    path('users/', views.userApi),
    path('users/<str:pk>/', views.userApi),
    path('companies/', views.companyApi),
    path('companies/<str:pk>/', views.companyApi),
    path('jobs/', views.jobApi),
    path('jobs/<str:pk>/', views.jobApi),
    path('api/login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),

]


urlpatterns = format_suffix_patterns(urlpatterns)