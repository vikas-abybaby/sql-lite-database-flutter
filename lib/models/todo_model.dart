class Todo {
  int? id;
  String? title;
  String? description;
  String? dateTime;
  int? isEdit;
  String? productId;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['dateTime'] = dateTime;
    data['isEdit'] = isEdit;
    data['productId'] = productId;
    data['isDeleted'] = isDeleted;
    return data;
  }

  Todo copyWith({
    int? id,
    String? title,
    String? description,
    String? dateTime,
    int? isEdit,
    String? productId,
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
