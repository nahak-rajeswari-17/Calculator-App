import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title1;
  final Color color1;
  final VoidCallback onpress;
  const MyButton(
      {Key? key,
      required this.title1,
      this.color1 = const Color(0xffa5a5a5),
      required this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onpress,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            height: 80,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color1),
            child: Center(
              child: Text(
                title1,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
