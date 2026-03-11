// 🕐 SHOWCASE: Real-Time Countdown Pro
// Elegant high-performance countdown widget for production dashboards.

import 'dart:async';
import 'package:flutter/material.dart';

class CountdownEngine extends StatefulWidget {
  final DateTime nextEventTime;
  const CountdownEngine({super.key, required this.nextEventTime});

  @override
  State<CountdownEngine> createState() => _CountdownEngineState();
}

class _CountdownEngineState extends State<CountdownEngine> {
  final ValueNotifier<String> _remainingNotifier = ValueNotifier<String>("--:--");
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startPrecisionTimer();
  }

  void _startPrecisionTimer() {
    _updateCountdown();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateCountdown());
  }

  void _updateCountdown() {
    final now = DateTime.now();
    final remaining = widget.nextEventTime.difference(now);
    if (remaining.isNegative) {
      _remainingNotifier.value = "00:00";
      _timer?.cancel();
      return;
    }

    _remainingNotifier.value = _format(remaining);
  }

  String _format(Duration d) {
    final h = d.inHours.remainder(24).toString().padLeft(2, '0');
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$h:$m:$s";
  }

  @override
  void dispose() {
    _timer?.cancel();
    _remainingNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Color(0xFF0F172A), Color(0xFF1E3A8A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: Colors.blueAccent.withOpacity(0.4), blurRadius: 20)
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Next Event Countdown",
            style: TextStyle(color: Colors.white70, fontSize: 13, letterSpacing: 0.8),
          ),
          const SizedBox(height: 10),
          ValueListenableBuilder<String>(
            valueListenable: _remainingNotifier,
            builder: (context, value, _) {
              return TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(milliseconds: 600),
                builder: (context, anim, child) {
                  return ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        Colors.cyanAccent.withOpacity(0.7 + 0.3 * anim),
                        Colors.lightBlueAccent.withOpacity(0.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
                        fontFeatures: [FontFeature.tabularFigures()],
                        shadows: [
                          Shadow(blurRadius: 18, color: Colors.cyanAccent),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 8),
          const Text(
            "Auto-synced • Low CPU",
            style: TextStyle(color: Colors.white24, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
