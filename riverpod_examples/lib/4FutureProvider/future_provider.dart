import 'package:book/4FutureProvider/quote_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: FutureProviderApp()));
}

class FutureProviderApp extends StatelessWidget {
  const FutureProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureProviderHomeScreen(),
    );
  }
}

class FutureProviderHomeScreen extends ConsumerWidget {
  const FutureProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('FutureProvider Example'),
          centerTitle: true,
          backgroundColor: Colors.teal[900],
        ),
        body: const Center(
          child: QuoteScreen(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.refresh(quoteProvider);
          },
          backgroundColor: Colors.teal[900],
          child: const Icon(Icons.refresh),
        ));
  }
}

class QuoteScreen extends ConsumerWidget {
  const QuoteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quoteAsyncValue = ref.watch(quoteProvider);

    return Container(
      padding: const EdgeInsets.all(10),
      child: quoteAsyncValue.when(
        data: (quote) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                quote.content,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[900],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "by ${quote.author}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal[900],
                ),
              ),
            ],
          );
        },
        loading: () => const CircularProgressIndicator(
          color: Colors.teal,
        ),
        error: (error, stackTrace) => const Text(
          'Oops, something unexpected happened!',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
