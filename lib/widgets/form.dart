import 'package:flutter/material.dart';

class TextFormGlobal extends StatelessWidget {
  const TextFormGlobal({
    Key? key,
    required this.controller,
    required this.text,
    required this.textInputType,
    required this.obscure,
  }) : super(key: key);

  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = Theme.of(context).colorScheme.surface.withOpacity(0.1); // Lighter background color
    final Color textColor = Theme.of(context).colorScheme.onSurface;
    final Color shadowColor = Theme.of(context).shadowColor.withOpacity(0.1);
    final Color borderColor = Colors.lightBlueAccent; // Light blue border color

    return Container(
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 7,
          ),
        ],
        border: Border.all(color: borderColor, width: 1.5), // Light blue border
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            height: 1,
            color: textColor.withOpacity(0.6), // Adjust the opacity to make the hint text less prominent
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(0),
        ),
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
