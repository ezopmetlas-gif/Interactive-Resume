// 🌿 PerformanceMonitor Pro (Styled + Ultra-Light CPU Load)
// Elegant, animated, low-cost performance visualizer.

import 'package:flutter/material.dart';

class PerformanceMonitor extends StatelessWidget {
  final ValueNotifier<int> _frameCounter = ValueNotifier<int>(0);

  PerformanceMonitor({super.key});

  void simulateHighFrequencyUpdate() {
    _frameCounter.value++;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Subtle moving background glow
          Positioned.fill(
            child: AnimatedGradientOverlay(),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Frame Pulse",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                ValueListenableBuilder<int>(
                  valueListenable: _frameCounter,
                  builder: (context, value, _) {
                    return TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0, end: value.toDouble()),
                      duration: const Duration(milliseconds: 400),
                      builder: (context, val, __) {
                        return Text(
                          val.toStringAsFixed(0),
                          style: const TextStyle(
                            color: Color(0xFF38BDF8),
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            shadows: [
                              Shadow(color: Colors.blueAccent, blurRadius: 12),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 6),
                const Text(
                  "Low CPU Mode",
                  style: TextStyle(
                    color: Colors.white24,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedGradientOverlay extends StatefulWidget {
  const AnimatedGradientOverlay({super.key});

  @override
  State<AnimatedGradientOverlay> createState() =>
      _AnimatedGradientOverlayState();
}

class _AnimatedGradientOverlayState extends State<AnimatedGradientOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 8))
        ..repeat();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.05),
                Colors.cyan.withOpacity(0.05),
                Colors.white.withOpacity(0.03),
              ],
              begin: Alignment(_controller.value, 0),
              end: Alignment(-_controller.value, 1),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
