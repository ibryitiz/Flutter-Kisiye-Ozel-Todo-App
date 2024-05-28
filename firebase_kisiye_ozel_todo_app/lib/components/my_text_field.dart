import 'package:firebase_kisiye_ozel_todo_app/constant/my_colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  const MyTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: _buildDecoration,
    );
  }

  get _buildDecoration => InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: MyColors.instance.fillColor,
        contentPadding: const EdgeInsets.all(20),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide.none,
        ),
      );
}
