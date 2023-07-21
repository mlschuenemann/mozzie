import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomUpCurve extends Curve {
  @override
  double transformInternal(double t) {
    return 1 - (1 - t) * (1 - t);
  }
}

class AnimatedSvgIcon extends StatefulWidget {
  final String svgPath;
  final Color startColor;
  final Color endColor;
  final Duration animationDuration;

  AnimatedSvgIcon({
    required this.svgPath,
    required this.startColor,
    required this.endColor,
    this.animationDuration = const Duration(milliseconds: 2000), // Adjust the duration for slower animation
  });

  @override
  _AnimatedSvgIconState createState() => _AnimatedSvgIconState();
}

class _AnimatedSvgIconState extends State<AnimatedSvgIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.animationDuration);
    _colorAnimation = ColorTween(begin: widget.startColor, end: widget.endColor)
        .animate(CurvedAnimation(parent: _controller, curve: BottomUpCurve()))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _isAnimating = false;
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isAnimating) {
          _controller.reverse();
        } else {
          _controller.forward(from: 0);
        }
        _isAnimating = !_isAnimating;
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return ColorFiltered(
            colorFilter: ColorFilter.mode(_colorAnimation.value!, BlendMode.srcIn),
            child: SvgPicture.asset(
              widget.svgPath,
              semanticsLabel: 'SVG Icon',
            ),
          );
        },
      ),
    );
  }
}
