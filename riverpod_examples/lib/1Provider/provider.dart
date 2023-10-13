import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

// Provider 1 (stateless /immutable)
final titleProvider = Provider<String>((ref) {
  return "Provider App";
});
// Provider 2 (stateful /mutable)
final messageProvider = Provider<String>((ref) {
  return "THE CURRENT DATE AND TIME IS :";
});
// Provider 3 (stateful /mutable)
final dateProvider = Provider<DateTime>((ref) {
  return DateTime.now();
});
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget /*not StatelessWidget*/ {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref /*additionally*/) {
    final title = ref.watch(titleProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[900],
      ),
      body: const Center(
        child: BodyWidget(),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer /*here Consumer used */ (
      builder: (context, ref, child) {
        final message = ref.watch(messageProvider);
        final date = ref.watch(dateProvider);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              '$date',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[900]),
            ),
          ],
        );
      },
    );
  }
}
