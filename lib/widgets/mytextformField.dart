
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String name;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const MyTextFormField({super.key, 
     this.controller,
    required this.name,
    this.onChanged,
    required this.validator
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: name,
      ),
    );
  }
}