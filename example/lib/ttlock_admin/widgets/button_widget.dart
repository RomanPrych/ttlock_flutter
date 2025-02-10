import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key, this.onTap, this.color, this.label, this.height, this.style});

  final Function()? onTap;
  final Color? color;
  final TextStyle? style;
  final String? label;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: color ?? Colors.blueAccent,
            borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        height: height ?? 50,
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          label ?? 'no label',
          style: style,
        ),
      ),
    );
  }
}


class DD extends StatelessWidget {
  const DD ({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(child: Container(color: Colors.green, child: Text('Helo, world!'))) ;
  }
}
