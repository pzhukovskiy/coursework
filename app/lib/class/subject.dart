class Subject {
  final int id;
  final String dateCreate;
  final String subject;
  final String description;
  final String typeSubject;
  final String dateEdit;

  Subject({
    required this.id,
    required this.dateCreate,
    required this.subject,
    required this.description,
    required this.typeSubject,
    required this.dateEdit,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      dateCreate: json['date_create'],
      subject: json['subject'],
      description: json['description'],
      typeSubject: json['type_subject'],
      dateEdit: json['date_edit'],
    );
  }
}