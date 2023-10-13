import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class Clock extends StateNotifier<DateTime> {
  // this will be the initial value of the state value
  Clock() : super(DateTime.now()) {
    Timer.periodic(const Duration(seconds: 1), (_) {
      state = DateTime.now();
    });
  }
}

final clockProvider = StateNotifierProvider<Clock, DateTime>((ref) => Clock());

final appNameProvider = Provider<String>((ref) {
  return "Clock App with Riverpod StateNotifierProvider";
});
void main() {
  runApp(
    const ProviderScope(
      child: MaterialApp(
        home: StateNotifierProviderExample(),
      ),
    ),
  );
}

class StateNotifierProviderExample extends ConsumerWidget {
  const StateNotifierProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTime = ref.watch(clockProvider);
    final formattedTime = DateFormat('EEEE hh:mm:ss a').format(currentTime);
    final appName = ref.watch(appNameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(appName, style: const TextStyle(fontSize: 24)),
        backgroundColor: Colors.teal[900],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Today',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal),
            ),
            const SizedBox(height: 10),
            CircleAvatar(
              radius: 150,
              backgroundColor: Colors.teal[900],
              child: CircleAvatar(
                radius: 140,
                backgroundColor: const Color.fromARGB(255, 250, 221, 126),
                child: Text(
                  formattedTime,
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Monospace',
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[900]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
