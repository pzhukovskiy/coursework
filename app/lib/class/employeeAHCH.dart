class EmployeeAHCH {
  int id;
  String firstName;
  String middleName;
  String lastName;
  String image;
  String description;

  EmployeeAHCH({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.image,
    required this.description,
  });

  factory EmployeeAHCH.fromJson(Map<String, dynamic> json) {
    return EmployeeAHCH(
        id: json['id'],
        firstName: json['first_name'],
        middleName: json['middle_name'],
        lastName: json['last_name'],
        image: json['image'],
        description: json['description']);
  }
}
