import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String texto;
  final VoidCallback? onPressed;
  final IconData? icono;
  final bool outlined;
  const AppButton({super.key, required this.texto, required this.onPressed, this.icono, this.outlined=false});

  @override
  Widget build(BuildContext context) {
    if (outlined) return OutlinedButton.icon(onPressed:onPressed, icon:Icon(icono ?? Icons.arrow_forward), label:Text(texto));
    return ElevatedButton.icon(onPressed:onPressed, icon:Icon(icono ?? Icons.arrow_forward), label:Text(texto));
  }
}
