# Generated by Django 4.2.6 on 2023-11-02 08:10

import django.contrib.auth.models
import django.contrib.auth.validators
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='Corpus',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('corpus', models.CharField(max_length=30, verbose_name='Корпус')),
            ],
            options={
                'verbose_name': 'Корпус',
                'verbose_name_plural': 'Корпуса',
            },
        ),
        migrations.CreateModel(
            name='Group',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('group', models.CharField(max_length=10, verbose_name='Название группы')),
            ],
            options={
                'verbose_name': 'Группа',
                'verbose_name_plural': 'Группы',
            },
        ),
        migrations.CreateModel(
            name='Room',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('room', models.CharField(max_length=30, verbose_name='Номер кабинета')),
                ('corpus', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='simpleView.corpus')),
            ],
            options={
                'verbose_name': 'Кабинет',
                'verbose_name_plural': 'Кабинеты',
            },
        ),
        migrations.CreateModel(
            name='Subject',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_create', models.DateTimeField(auto_created=True, verbose_name='Дата создания')),
                ('subject', models.CharField(max_length=255, verbose_name='Название предмета')),
                ('description', models.CharField(max_length=255, verbose_name='Описание предмета')),
                ('type_subject', models.CharField(choices=[('Спецпредмет', 'Спецпредмет'), ('Общеобразовательный предмет', 'Общеобразовательный предмет')], max_length=30, verbose_name='Тип предмета')),
                ('date_edit', models.DateTimeField(auto_now=True, verbose_name='Дата изменения')),
            ],
            options={
                'verbose_name': 'Предмет',
                'verbose_name_plural': 'Предметы',
            },
        ),
        migrations.CreateModel(
            name='Teacher',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_create', models.DateTimeField(auto_created=True, verbose_name='Дата создания')),
                ('first_name', models.CharField(max_length=30, verbose_name='Имя преподавателя')),
                ('middle_name', models.CharField(max_length=30, verbose_name='Фамилия преподавателя')),
                ('last_name', models.CharField(max_length=30, verbose_name='Отчество преподавателя')),
                ('image', models.CharField(max_length=255, verbose_name='Изображение преподавателя')),
                ('kurator', models.BooleanField(blank=True, default=False, null=True, verbose_name='Куратор группы')),
                ('date_edit', models.DateTimeField(auto_now=True, verbose_name='Дата изменения')),
                ('group', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='simpleView.group')),
                ('room', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='simpleView.room')),
            ],
            options={
                'verbose_name': 'Преподаватель',
                'verbose_name_plural': 'Преподаватели',
            },
        ),
        migrations.CreateModel(
            name='Student',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_create', models.DateTimeField(auto_created=True, verbose_name='Дата создания')),
                ('first_name', models.CharField(max_length=30, verbose_name='Имя студента')),
                ('middle_name', models.CharField(max_length=30, verbose_name='Фамилия студента')),
                ('last_name', models.CharField(max_length=30, verbose_name='Отчество студента')),
                ('date_of_birth', models.DateField(verbose_name='Дата рождения')),
                ('type_family', models.CharField(choices=[('Полная', 'Полная'), ('Неполная', 'Неполная')], max_length=30, verbose_name='Состояние семьи')),
                ('address', models.CharField(max_length=255, verbose_name='Адрес проживания')),
                ('telephone', models.CharField(max_length=30, verbose_name='Номер телефона')),
                ('bank_data', models.CharField(max_length=30, verbose_name='Банковский счёт')),
                ('passport_data_id', models.CharField(max_length=30, verbose_name='Идентификатор номера паспорта')),
                ('passport_data', models.CharField(max_length=30, verbose_name='Паспортные данные')),
                ('date_edit', models.DateTimeField(auto_now=True, verbose_name='Дата изменения')),
                ('group', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='simpleView.group')),
            ],
            options={
                'verbose_name': 'Студент',
                'verbose_name_plural': 'Студенты',
            },
        ),
        migrations.CreateModel(
            name='Lesson',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('subgroup', models.PositiveSmallIntegerField(verbose_name='Номер подгруппы')),
                ('lesson_type', models.CharField(choices=[('Факультатив', 'Факультатив'), ('Практическая работа', 'Практическая работа'), ('Практическое занятие', 'Практическое занятие'), ('Лабораторная', 'Лабораторная'), ('Лекция', 'Лекция'), ('Курсовое проектирование', 'Курсовое проектирование'), ('Дипломное проектирование', 'Дипломное проектирование')], max_length=255, verbose_name='Тип занятия')),
                ('lesson_number', models.PositiveSmallIntegerField(verbose_name='Номер пары')),
                ('date', models.DateField(auto_now=True, verbose_name='Дата проведения')),
                ('corpus', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='simpleView.corpus')),
                ('group', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='simpleView.group')),
                ('room', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='simpleView.room')),
                ('subject', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='simpleView.subject')),
                ('teacher', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='simpleView.teacher')),
            ],
            options={
                'verbose_name': 'Урок',
                'verbose_name_plural': 'Уроки',
            },
        ),
        migrations.CreateModel(
            name='Absent',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_create', models.DateTimeField(auto_created=True, verbose_name='Дата создания')),
                ('reasone', models.CharField(choices=[('Заявление', 'Заявление'), ('Болезнь', 'Болезнь'), ('Неуважительная причина', 'Неуважительная причина'), ('Приказ', 'Приказ'), ('Гос обязанность', 'Гос обязанность')], max_length=255, verbose_name='Причина отсутствия')),
                ('date_edit', models.DateTimeField(auto_now=True, verbose_name='Дата изменения')),
                ('group', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='simpleView.group')),
                ('student', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='simpleView.student')),
            ],
            options={
                'verbose_name': 'Отсутствующий',
                'verbose_name_plural': 'Отсутствующие',
            },
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('username', models.CharField(error_messages={'unique': 'A user with that username already exists.'}, help_text='Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.', max_length=150, unique=True, validators=[django.contrib.auth.validators.UnicodeUsernameValidator()], verbose_name='username')),
                ('last_name', models.CharField(blank=True, max_length=150, verbose_name='last name')),
                ('email', models.EmailField(blank=True, max_length=254, verbose_name='email address')),
                ('is_staff', models.BooleanField(default=False, help_text='Designates whether the user can log into this admin site.', verbose_name='staff status')),
                ('is_active', models.BooleanField(default=True, help_text='Designates whether this user should be treated as active. Unselect this instead of deleting accounts.', verbose_name='active')),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now, verbose_name='date joined')),
                ('first_name', models.CharField(max_length=30, verbose_name='Имя пользователя')),
                ('middle_name', models.CharField(max_length=30, verbose_name='Фамилия пользователя')),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.group', verbose_name='groups')),
                ('student', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='simpleView.student')),
                ('teacher', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='simpleView.teacher')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.permission', verbose_name='user permissions')),
            ],
            options={
                'verbose_name': 'Пользователь',
                'verbose_name_plural': 'Пользователи',
            },
            managers=[
                ('objects', django.contrib.auth.models.UserManager()),
            ],
        ),
    ]
