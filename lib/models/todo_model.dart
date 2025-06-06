class Todo {
  int? id;
  String title;
  String description;
  DateTime dateTime;
  bool isCompleted;
  bool isSynced;
  bool isDeleted;

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    this.isCompleted = false,
    this.isSynced = false,
    this.isDeleted = false,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'description': description,
    'dateTime': dateTime.millisecondsSinceEpoch,
    'isCompleted': isCompleted ? 1 : 0,
    'isSynced': isSynced ? 1 : 0,
    'isDeleted': isDeleted ? 1 : 0,
  };

  static Todo fromMap(Map<String, dynamic> map) => Todo(
    id: map['id'],
    title: map['title'],
    description: map['description'],
    dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
    isCompleted: map['isCompleted'] == 1,
    isSynced: map['isSynced'] == 1,
    isDeleted: map['isDeleted'] == 1,
  );
}
