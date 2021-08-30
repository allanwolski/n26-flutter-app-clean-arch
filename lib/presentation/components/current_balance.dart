import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentBalance extends StatelessWidget {
  const CurrentBalance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.remove_red_eye_outlined,
          size: 20,
        ),
        SizedBox(width: 15.0),
        Text(
          'Current Balance',
          style: TextStyle(
            fontSize: 15.0,
            color: Color(0xFF838383),
          ),
        ),
      ],
    );
  }
}
