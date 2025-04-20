import 'package:e_commerce_app/core/helpers/build_app_bar.dart';
import 'package:e_commerce_app/core/helpers/routes.dart';
import 'package:e_commerce_app/core/utils/custom_button.dart';
import 'package:e_commerce_app/core/utils/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditNameView extends StatefulWidget {
  const EditNameView({super.key});
  static const String id = Routes.editNameView;

  @override
  State<EditNameView> createState() => _EditNameViewState();
}

class _EditNameViewState extends State<EditNameView> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Edit Name'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              CustomTextFormField(
                labelText: 'Enter name',
                controller: controller,
              ),
              const SizedBox(height: 24),
              CustomButton(label: 'Update', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
