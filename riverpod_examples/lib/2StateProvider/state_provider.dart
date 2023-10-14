import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// this is how we create a provider (stateless /immutable)
final titleProvider = Provider<String>((ref) {
  return "Counter App";
});
// this is how we create a stateProvider (stateful /mutable)
final countProvider = StateProvider<int>((ref) {
  return 0;
});
void main() {
  runApp(
    const ProviderScope(
      child: StateProviderApp(),
    ),
  );
}

class StateProviderApp extends StatelessWidget {
  const StateProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'stateProvider Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // this is how we read the state
    final count = ref.watch(countProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text(ref.watch(titleProvider)),
          centerTitle: true,
          backgroundColor: Colors.teal[900],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "This is a counter app using riverpod state management (provider and stateProvider).",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                '$count',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[900]),
              ),
            ],
          ),
        ),
        floatingActionButton: const FloatingActionTwin());
  }
}

class FloatingActionTwin extends ConsumerWidget {
  const FloatingActionTwin({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => ref.read(countProvider.notifier).state++,
          tooltip: 'Increment',
          backgroundColor: Colors.teal[900],
          child: const Icon(Icons.add),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          onPressed: () => ref.read(countProvider.notifier).state = 0,
          tooltip: 'reset',
          backgroundColor: Colors.teal[900],
          child: const Icon(Icons.loop),
        ),
        const SizedBox(width: 10),
        FloatingActionButton(
          onPressed: () => ref.read(countProvider.notifier).state--,
          tooltip: 'Decrement',
          backgroundColor: Colors.teal[900],
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
