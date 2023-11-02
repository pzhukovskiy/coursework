import 'package:app/class/group.dart';
import 'package:app/class/room.dart';

class Teacher {
  int id;
  Room room;
  Group group;
  String dateCreate;
  String firstName;
  String middleName;
  String lastName;
  bool kurator;
  String dateEdit;
  String image;

  Teacher({
    required this.id,
    required this.room,
    required this.group,
    required this.dateCreate,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.kurator,
    required this.dateEdit,
    required this.image,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    if (json['group'] is Map<String, dynamic>) {
      return Teacher(
        id: json['id'],
        room: Room.fromJson(json['room']),
        group: Group.fromJson(json['group']),
        dateCreate: json['date_create'],
        firstName: json['first_name'],
        middleName: json['middle_name'],
        lastName: json['last_name'],
        kurator: json['kurator'],
        dateEdit: json['date_edit'],
        image: json['image'],
      );
    } else {
      return Teacher(
        id: json['id'],
        room: Room.fromJson(json['room']),
        group: Group(id: 0, groupName: ''),
        dateCreate: json['date_create'],
        firstName: json['first_name'],
        middleName: json['middle_name'],
        lastName: json['last_name'],
        kurator: json['kurator'],
        dateEdit: json['date_edit'],
        image: json['image'],
      );
    }
  }
}
