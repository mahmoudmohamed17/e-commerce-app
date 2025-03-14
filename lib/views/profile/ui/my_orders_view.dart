import 'package:e_commerce_app/core/helpers/build_app_bar.dart';
import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:e_commerce_app/views/home/ui/recently_products_list.dart';
import 'package:flutter/material.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});
  static const String id = Routes.myOrdersView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'My Orders'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: const [SizedBox(height: 16), RecentlyProductsList()],
        ),
      ),
    );
  }
}
