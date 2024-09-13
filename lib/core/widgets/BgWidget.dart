import 'package:flutter/material.dart';

class BgWidget extends StatelessWidget {
  final Widget child;

  const BgWidget({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/images/pattern.png"),
                fit: BoxFit.cover)),
        child: child);
  }
}
