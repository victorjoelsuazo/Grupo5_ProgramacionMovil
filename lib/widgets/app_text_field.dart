import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final int maxLines;
  final bool obscureText;
  const AppTextField({super.key, required this.label, required this.icon, this.controller, this.validator, this.keyboardType=TextInputType.text, this.maxLines=1, this.obscureText=false});

  @override
  Widget build(BuildContext context) => TextFormField(
    controller:controller, validator:validator, keyboardType:keyboardType,
    maxLines:obscureText ? 1 : maxLines, obscureText:obscureText,
    decoration:InputDecoration(labelText:label, prefixIcon:Icon(icon)),
  );
}
