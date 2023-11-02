from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
class User(AbstractUser):
    first_name = models.CharField(verbose_name='Имя пользователя', max_length=30)#
    middle_name = models.CharField(verbose_name='Фамилия пользователя', max_length=30)#
    student = models.ForeignKey('Student', on_delete=models.CASCADE, null=True)
    teacher = models.ForeignKey('Teacher', on_delete=models.CASCADE, null=True)

    class Meta:
        verbose_name = 'Пользователь'
        verbose_name_plural = 'Пользователи'

    def __str__(self):
        return f"{self.id} {self.first_name} {self.middle_name} {self.student} {self.teacher}"

class Teacher(models.Model):
    middle_name = models.CharField(verbose_name='Фамилия преподавателя', max_length=30)
    first_name = models.CharField(verbose_name='Имя преподавателя', max_length=30)
    last_name = models.CharField(verbose_name='Отчество преподавателя', max_length=30)
    image = models.CharField(verbose_name='Изображение преподавателя', max_length=255)
    room = models.ForeignKey('Room', on_delete=models.CASCADE, null=True)
    group = models.ForeignKey('Group', on_delete=models.CASCADE, null=True, blank=True)
    kurator = models.BooleanField(verbose_name='Куратор группы', default=False, blank=True, null=True)
    date_create = models.DateTimeField(auto_now=False, auto_created=True, verbose_name='Дата создания')
    date_edit = models.DateTimeField(auto_now=True, auto_created=False, verbose_name='Дата изменения')

    class Meta:
        verbose_name = 'Преподаватель'
        verbose_name_plural = 'Преподаватели'

    def __str__(self):
        return f"{self.middle_name} {self.first_name} {self.last_name}"

class Room(models.Model):
    room = models.CharField(verbose_name='Номер кабинета', max_length=30)
    corpus = models.ForeignKey('Corpus', on_delete=models.CASCADE, null=True)

    class Meta:
        verbose_name = 'Кабинет'
        verbose_name_plural = 'Кабинеты'

    def __str__(self):
        return f"{self.room} {self.corpus}"
    
class Lesson(models.Model):
    type1 = 'Факультатив'
    type2 = 'Практическая работа'
    type3 = 'Практическое занятие'
    type4 = 'Лабораторная'
    type5 = 'Лекция'
    type6 = 'Курсовое проектирование'
    type7 = 'Дипломное проектирование'

    subgroup = models.PositiveSmallIntegerField(verbose_name='Номер подгруппы')
    type_lesson_choice = [
        (type1, type1),
        (type2, type2),
        (type3, type3),
        (type4, type4),
        (type5, type5),
        (type6, type6),
        (type7, type7),
    ]
    lesson_type = models.CharField(verbose_name='Тип занятия', max_length=255, choices=type_lesson_choice)
    room = models.ForeignKey('Room', on_delete=models.CASCADE, null=True)
    teacher = models.ForeignKey('Teacher', on_delete=models.CASCADE, null=True)
    subject = models.ForeignKey('Subject', on_delete=models.CASCADE, null=True)
    group = models.ForeignKey('Group', on_delete=models.CASCADE, null=True)
    corpus = models.ForeignKey('Corpus', on_delete=models.CASCADE, null=True)

    #Номер пары
    lesson_number = models.PositiveSmallIntegerField(verbose_name='Номер пары')
    date = models.DateField(auto_now=True, verbose_name='Дата проведения')

    class Meta:
        verbose_name = 'Урок'
        verbose_name_plural = 'Уроки'

    def __str__(self):
        return f"{self.subgroup} {self.lesson_type} {self.room} {self.teacher} {self.subject} {self.group} {self.date}"
    

class Corpus(models.Model):
    corpus = models.CharField(verbose_name='Корпус', max_length=30)

    class Meta:
        verbose_name = 'Корпус'
        verbose_name_plural = 'Корпуса'

    def __str__(self):
        return f"{self.corpus}"
    
class Subject(models.Model):
    type1 = 'Спецпредмет'
    type2 = 'Общеобразовательный предмет'

    subject = models.CharField(verbose_name='Название предмета', max_length=255)
    description = models.CharField(verbose_name='Описание предмета', max_length=255)
    type_subject_choice = [
        (type1, type1),
        (type2, type2),
    ]
    type_subject = models.CharField(verbose_name='Тип предмета', max_length=30, choices=type_subject_choice)
    
    #icon = models.CharField(verbose_name='Изображение предмета', max_length=30)
    date_create = models.DateTimeField(auto_now=False, auto_created=True, verbose_name='Дата создания')
    date_edit = models.DateTimeField(auto_now=True, auto_created=False, verbose_name='Дата изменения')

    class Meta:
        verbose_name = 'Предмет'
        verbose_name_plural = 'Предметы'

    def __str__(self):
        return f"{self.subject}"
    
class Student(models.Model):
    type1 = 'Полная'
    type2 = 'Неполная'

    middle_name = models.CharField(verbose_name='Фамилия студента', max_length=30)
    first_name = models.CharField(verbose_name='Имя студента', max_length=30)
    last_name = models.CharField(verbose_name='Отчество студента', max_length=30)
    date_of_birth = models.DateField(verbose_name='Дата рождения')
    type_family_choice = [
        (type1, type1),
        (type2, type2)
    ]
    type_family = models.CharField(verbose_name='Состояние семьи', max_length=30, choices=type_family_choice)
    address = models.CharField(verbose_name='Адрес проживания', max_length=255)
    telephone = models.CharField(verbose_name='Номер телефона', max_length=30)
    bank_data = models.CharField(verbose_name='Банковский счёт', max_length=30)
    passport_data_id = models.CharField(verbose_name='Идентификатор номера паспорта', max_length=30)
    passport_data = models.CharField(verbose_name='Паспортные данные', max_length=30)
    date_create = models.DateTimeField(auto_now=False, auto_created=True, verbose_name='Дата создания')
    date_edit = models.DateTimeField(auto_now=True, auto_created=False, verbose_name='Дата изменения')
    group = models.ForeignKey('Group', on_delete=models.CASCADE, null=True)
    
    class Meta:
        verbose_name = 'Студент'
        verbose_name_plural = 'Студенты'

    def __str__(self):
        return f"{self.first_name} {self.middle_name} {self.last_name} {self.address} {self.telephone}"
    
class Group(models.Model):
    group = models.CharField(verbose_name='Название группы', max_length=10)
    
    class Meta:
        verbose_name = 'Группа'
        verbose_name_plural = 'Группы'

    def __str__(self):
        return f"{self.group}"
    
#Отсутствующие
class Absent(models.Model):
    type1 = 'Заявление'
    type2 = 'Болезнь'
    type3 = 'Неуважительная причина'
    type4 = 'Приказ'
    type5 = 'Гос обязанность'

    group = models.ForeignKey('Group', on_delete=models.CASCADE, null=True)
    student = models.ForeignKey('Student', on_delete=models.CASCADE, null=True)
    type_absent_choice = [
        (type1, type1),
        (type2, type2),
        (type3, type3),
        (type4, type4),
        (type5, type5),
    ]
    reasone = models.CharField(verbose_name='Причина отсутствия', max_length=255, choices=type_absent_choice)
    date_create = models.DateTimeField(auto_now=False, auto_created=True, verbose_name='Дата создания')
    date_edit = models.DateTimeField(auto_now=True, auto_created=False, verbose_name='Дата изменения')

    class Meta:
        verbose_name = 'Отсутствующий'
        verbose_name_plural = 'Отсутствующие'

    def __str__(self):
        return f"{self.date_create} {self.group} {self.student} {self.reasone}"