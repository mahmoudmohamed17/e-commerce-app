import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/views/product_details/logic/models/comment_model.dart';
import 'package:flutter/material.dart';

class UserComment extends StatelessWidget {
  const UserComment({super.key, required this.commentModel});
  final CommentModel commentModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(commentModel.userName, style: AppTextStyles.bold12),
        Text(commentModel.comment, style: AppTextStyles.regular12),
        commentModel.adminReply != null
            ? Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Youssef (Admin): ',
                    style: AppTextStyles.bold12,
                  ),
                  TextSpan(
                    text: commentModel.adminReply ?? 'NO REPLY',
                    style: AppTextStyles.regular12,
                  ),
                ],
              ),
            )
            : const SizedBox.shrink(),
      ],
    );
  }
}
