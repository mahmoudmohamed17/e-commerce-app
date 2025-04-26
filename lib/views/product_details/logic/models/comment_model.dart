class CommentModel {
  final String userName;
  final String comment;

  CommentModel({required this.userName, required this.comment});


    Map<String, dynamic> toJson() {
      return {
        'user_name': userName,
        'comment': comment,
      };
    }

    factory CommentModel.fromJson(Map<String, dynamic> json) {
      return CommentModel(
        userName: json['user_name'],
        comment: json['comment'],
      );
    }
}
