// Optimized Performance Monitor for Low-End Devices
// Showcase: UI updates without global rebuilds

import 'package:flutter/material.dart';

class PerformanceMonitor extends StatelessWidget {
  final ValueNotifier<int> _frameCounter = ValueNotifier<int>(0);

  // This demonstrates how to update specific pixels without heating up the CPU
  void simulateHighFrequencyUpdate() {
    // Updating value 60 times per second
    _frameCounter.value++;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _frameCounter,
      builder: (context, value, child) {
        return Text('Surgical Update: $value'); // Only this text rebuilds!
      },
    );
  }
}
