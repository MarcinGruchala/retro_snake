import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ChildWidgetSize extends StatefulWidget {
  final Widget child;
  final Function(Size) whenMeasured;

  const ChildWidgetSize({
    super.key,
    required this.whenMeasured,
    required this.child,
  });

  @override
  _ChildWidgetSizeState createState() => _ChildWidgetSizeState();
}

class _ChildWidgetSizeState extends State<ChildWidgetSize> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback(postFrameCallback);
    return Container(
      key: widgetKey,
      child: widget.child,
    );
  }

  final widgetKey = GlobalKey();

  void postFrameCallback(_) {
    final context = widgetKey.currentContext;
    if (context == null) return;

    final Size? size = context.size;
    if (size == null) return;

    widget.whenMeasured(size);
  }
}
