from django.shortcuts import render
from django.urls import path

from . import views

urlpatterns = [
    path("", views.view_index, name="index")
]
