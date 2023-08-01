import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:music_education/provider/progress_point_provider.dart';
import 'package:music_education/provider/lecture_provider.dart';
import '../constants/textstyle.dart';
import 'dart:math' as math;

import '../provider/key_provider.dart';

// ignore: must_be_immutable
class FastForwardButton extends StatefulWidget {
  @override
  _FastForwardButtonState createState() => _FastForwardButtonState();

  // Constructor for FastForwardButton
  FastForwardButton({
    Key? key,
    this.animationDuration = const Duration(seconds: 2),
    required this.resetValue,
    required this.text,
    required this.icon,
    required this.borderColor,

  }) : super(key: key);

  var resetValue;
  final Duration animationDuration;
  final String text;
  final IconData icon;
  final Color borderColor;
}

class _FastForwardButtonState extends State<FastForwardButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;



  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration, // Use the duration from the constructor
    )..repeat(reverse: true); // Animates the container up and down indefinitely.
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lectureProvider = Provider.of<LectureProvider>(context, listen: false);
    final progressPointProvider = Provider.of<ProgressPointProvider>(context, listen:false);
    final keyProvider = Provider.of<KeyProvider>(context);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double offset = math.sin(_controller.value * 2 * math.pi) * 4.0;
        return Transform.translate(
          offset: Offset(0, offset),
          child: child!,
        );
      },
      child: GestureDetector(
        onTap: (){
          progressPointProvider.resetProgressPointNumber(widget.resetValue, keyProvider.key);
          lectureProvider.resetLectureNumber(keyProvider.key);
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: widget.borderColor, width: 2),
          ),
          child: Row(
            children: [
              Icon(widget.icon, color: Colors.white),
              Text(
                widget.text,
                style: PAR2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
