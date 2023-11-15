class Employee {
  int id;
  String firstName;
  String middleName;
  String lastName;
  String image;
  String description;

  Employee({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.image,
    required this.description,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
        id: json['id'],
        firstName: json['first_name'],
        middleName: json['middle_name'],
        lastName: json['last_name'],
        image: json['image'],
        description: json['description']);
  }
}
