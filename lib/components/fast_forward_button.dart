import 'package:flutter/material.dart';
import 'package:music_education/constants/colors.dart';

import '../constants/textstyle.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class FastForwardButton extends StatefulWidget {
  @override
  _FastForwardButtonState createState() => _FastForwardButtonState();
}

class _FastForwardButtonState extends State<FastForwardButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true); // Animates the container up and down indefinitely.
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double offset = math.sin(_controller.value * 0.8 * math.pi) * 5.0;
        return Transform.translate(
          offset: Offset(0, offset),
          child: child!,
        );
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          //color: SECONDARY,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: LILA, width: 2),
        ),
        child: Row(
          children: [
            Icon(Icons.fast_forward_rounded, color: Colors.white),
            Text(
              "Hierhin springen",
              style: PAR2,
            ),
          ],
        ),
      ),
    );
  }
}


