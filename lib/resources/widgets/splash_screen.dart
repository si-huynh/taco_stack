import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '/resources/widgets/logo_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  /// Create a new instance of the MaterialApp
  static MaterialApp app() {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(),
              Gap(50),
              AnimatedLoader(),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedLoader extends StatefulWidget {
  const AnimatedLoader({
    super.key,
    this.size = 50.0,
    this.color = const Color(0xff7d570e),
  });
  final double size;
  final Color color;

  @override
  AnimatedLoaderState createState() => AnimatedLoaderState();
}

class AnimatedLoaderState extends State<AnimatedLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
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
        return Stack(
          alignment: Alignment.center,
          children: [
            _buildPulsatingCircle(),
            _buildRotatingDots(),
          ],
        );
      },
    );
  }

  Widget _buildPulsatingCircle() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.8, end: 1),
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }

  Widget _buildRotatingDots() {
    return Transform.rotate(
      angle: _controller.value * 2 * pi,
      child: Stack(
        alignment: Alignment.center,
        children: List.generate(8, (index) {
          final angle = (index / 8) * 2 * pi;
          final offset = widget.size * 0.35;
          return Transform(
            transform: Matrix4.identity()
              ..translate(
                offset * cos(angle),
                offset * sin(angle),
              ),
            child: _buildDot(index),
          );
        }),
      ),
    );
  }

  Widget _buildDot(int index) {
    final dotSize = widget.size * 0.1;
    final scaleFactor = 0.5 + (1 - _controller.value + index / 8) % 1 * 0.5;
    return Transform.scale(
      scale: scaleFactor,
      child: Container(
        width: dotSize,
        height: dotSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: widget.color,
        ),
      ),
    );
  }
}
