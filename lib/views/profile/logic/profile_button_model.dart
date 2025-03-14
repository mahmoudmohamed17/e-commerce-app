import 'package:flutter/widgets.dart';

class ProfileButtonModel {
  final String label;
  final IconData icon;
  final Function(BuildContext context) onPressed;

  ProfileButtonModel({
    required this.label,
    required this.icon,
    required this.onPressed,
  });
}
