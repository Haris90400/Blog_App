// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isObsure;
  const AuthField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isObsure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsure,
      validator: (value) {
        if (value!.isEmpty) {
          return "$hintText is missing";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
