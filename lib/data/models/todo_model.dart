class TodoModel {
  final int? id;
  final String title;
  final bool isChecked;

  TodoModel({this.id, required this.title, this.isChecked = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isChecked': isChecked ? 1 : 0,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      title: map['title'],
      isChecked: map['isChecked'] == 1,
    );
  }
}
