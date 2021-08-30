import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.borderColor,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final Color borderColor;
  final Color backgroundColor;
  final Function(String action) onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RawMaterialButton(
          elevation: 0,
          shape: CircleBorder(
            side: BorderSide(color: borderColor),
          ),
          padding: const EdgeInsets.all(15.0),
          fillColor: backgroundColor,
          onPressed: () => onPressed(label),
          child: Icon(
            icon,
            size: 35.0,
            color: backgroundColor == Colors.white ? Colors.black : Colors.white,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
