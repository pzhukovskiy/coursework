class Group {
  int id;
  String groupName;

  Group({
    required this.id,
    required this.groupName,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      groupName: json['group'],
    );
  }
}
