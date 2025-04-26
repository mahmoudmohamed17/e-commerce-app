import 'package:e_commerce_app/core/services/supabase_service.dart';
import 'package:e_commerce_app/core/utils/app_constants.dart';
import 'package:e_commerce_app/core/utils/app_text_styles.dart';
import 'package:e_commerce_app/views/product_details/ui/user_comment.dart';
import 'package:flutter/material.dart';

class CommentsSectionWidget extends StatelessWidget {
  const CommentsSectionWidget({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: SupabaseService.supabaseClient
          .from(AppConstants.commentsTable)
          .stream(primaryKey: ['id']).eq('for_product', productId),
      builder: (context, snapshot) {
       return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            const Text('Comments', style: AppTextStyles.regular20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(10, (index) {
                return index == 9
                    ? const UserComment()
                    : const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UserComment(),
                        Divider(indent: 16, endIndent: 16, height: 24),
                      ],
                    );
              }),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
