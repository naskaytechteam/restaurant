import 'dart:async';

import 'package:flutter/material.dart';

class DelayScreen extends StatefulWidget {
  final int delay;
  final Widget child;

  const DelayScreen({this.delay = 300, required this.child, Key? key})
      : super(key: key);

  @override
  State<DelayScreen> createState() => _DelayScreenState();
}

class _DelayScreenState extends State<DelayScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slideAnimation;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
            CurvedAnimation(
                parent: animationController, curve: Curves.decelerate));

    _runAnimation();
  }

  void _runAnimation() {
    _timer = Timer(Duration(milliseconds: widget.delay), () {
      animationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: animationController,
        child: SlideTransition(
          position: slideAnimation,
          child: widget.child,
        ));
  }
}
