import 'package:flutter/material.dart';

class ChildWidgetSize extends StatefulWidget {
  final Widget child;
  final Function(Size) whenMeasured;

  const ChildWidgetSize({
    super.key,
    required this.whenMeasured,
    required this.child,
  });

  @override
  ChildWidgetSizeState createState() => ChildWidgetSizeState();
}

class ChildWidgetSizeState extends State<ChildWidgetSize> {
  final GlobalKey _key = GlobalKey();
  Size? oldSize;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
  }

  void _afterLayout(_) {
    final Size newSize = _getSize();
    if (oldSize == newSize) return;

    oldSize = newSize;
    widget.whenMeasured(newSize);
  }

  Size _getSize() {
    final RenderBox? renderBox =
        _key.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.size ?? Size.zero;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      child: widget.child,
    );
  }
}
