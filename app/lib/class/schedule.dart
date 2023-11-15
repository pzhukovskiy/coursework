import 'package:app/class/corpus.dart';
import 'package:app/class/group.dart';
import 'package:app/class/room.dart';
import 'package:app/class/subject.dart';
import 'package:app/class/teacher.dart';
class Lesson {
  int id;
  Room room;
  Teacher teacher;
  Subject subject;
  Group group;
  Corpus corpus;
  int subgroup;
  String lessonType;
  int lessonNumber;
  String date;

  Lesson({
    required this.id,
    required this.room,
    required this.teacher,
    required this.subject,
    required this.group,
    required this.corpus,
    required this.subgroup,
    required this.lessonType,
    required this.lessonNumber,
    required this.date,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      room: Room.fromJson(json['room']),
      teacher: Teacher.fromJson(json['teacher']),
      subject: Subject.fromJson(json['subject']),
      group: Group.fromJson(json['group']),
      corpus: Corpus.fromJson(json['corpus']),
      subgroup: json['subgroup'],
      lessonType: json['lesson_type'],
      lessonNumber: json['lesson_number'],
      date: json['date'],
    );
  }
}

class LessonForDay {
  Group group;
  List<Lesson> lessonsArray = [];

  LessonForDay({
    required this.group,
  });

  factory LessonForDay.fromJson(Map<String, dynamic> json) {
    return LessonForDay(
      group: Group.fromJson(json['group']),
    );
  } 
}

class LessonsForDayForAllGroup {
  
}

class LessonForWeek {
  Group group;
  List<LessonForDay> lessonsArray = [];

  LessonForWeek({
    required this.group,
  });

  factory LessonForWeek.fromJson(Map<String, dynamic> json) {
    return LessonForWeek(
      group: Group.fromJson(json['group']),
    );
  }
}
