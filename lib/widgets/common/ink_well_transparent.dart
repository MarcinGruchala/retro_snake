import 'package:flutter/material.dart';

class InkWellTransparent extends StatelessWidget {
  final Function() onTap;
  final Widget child;

  const InkWellTransparent({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: child,
    );
  }
}
