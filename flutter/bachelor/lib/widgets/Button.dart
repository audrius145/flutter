import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final IconData icon;
  final Alignment alignment;

  const Button({
    required this.icon,
    required this.alignment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        margin: EdgeInsets.only(left: 20, bottom: 20),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 10,
            )
          ],
        ),
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
  }
}