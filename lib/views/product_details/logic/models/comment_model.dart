class CommentModel {
  final String userName;
  final String comment;
  final String? adminReply;

  CommentModel({
    required this.userName,
    required this.comment,
    this.adminReply = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'user_name': userName,
      'comment': comment,
      'admin_reply': adminReply,
    };
  }

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      userName: json['user_name'],
      comment: json['comment'],
      adminReply: json['admin_reply'],
    );
  }
}
