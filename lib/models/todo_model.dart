class Todo {
  int? id;
  String? title;
  String? description;
  String? dateTime;
  int? isEdit;
  int? productId;
  int? isDeleted;

  Todo(
      {this.id,
      this.title,
      this.description,
      this.dateTime,
      this.isEdit,
      this.productId,
      this.isDeleted});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    dateTime = json['dateTime'];
    isEdit = json['isEdit'];
    productId = json['productId'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['dateTime'] = this.dateTime;
    data['isEdit'] = this.isEdit;
    data['productId'] = this.productId;
    data['isDeleted'] = this.isDeleted;
    return data;
  }

  Todo copyWith({
    int? id,
    String? title,
    String? description,
    String? dateTime,
    int? isEdit,
    int? productId,
    int? isDeleted,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      productId: productId ?? this.productId,
      isEdit: isEdit ?? this.isEdit,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
