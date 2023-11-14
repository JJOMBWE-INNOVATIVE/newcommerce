


import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool obserText;
  final TextEditingController? controller;
  final String? name;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;

  final Function onTap;
  const PasswordTextFormField({super.key, 
     this.controller,
     this.validator,
    required this.onTap,
    this.onChanged,
     this.name,
    required this.obserText,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      obscureText: obserText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: name,
        suffixIcon: GestureDetector(
          onTap:()=> onTap(),
          child: Icon(
            obserText == false ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
        hintStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}