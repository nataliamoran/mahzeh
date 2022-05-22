from django.db import models


class Question(models.Model):
    image = models.ImageField(upload_to='media/', blank=False, null=False)
    description = models.TextField(blank=True)
    is_ukrainian_lang = models.BooleanField(default=True)
    is_russian_lang = models.BooleanField(default=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)


class Answer(models.Model):
    content = models.TextField(blank=False, max_length=500)
    question = models.ForeignKey(Question, on_delete=models.CASCADE, blank=False, null=False, related_name='+')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
