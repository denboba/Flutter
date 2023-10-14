import 'package:book/1Provider/provider.dart';
import 'package:book/2StateProvider/state_provider.dart';
import 'package:book/3StateNotifierProvider/state_notifier_provider.dart';
import 'package:book/4FutureProvider/future_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: RiverpodApp()));
}

class RiverpodApp extends StatelessWidget {
  const RiverpodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RiverpodApps(),
    );
  }
}

class RiverpodApps extends StatelessWidget {
  const RiverpodApps({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          title: const Text("Riverpod"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.skip_next),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.skip_next),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.skip_next),
            )
          ],
          bottom: const TabBar(
              tabs: [
                Tab(
                  text: "Provider",
                ),
                Tab(
                  text: "StateProvider",
                ),
                Tab(
                  text: "StateNotefierNProvider",
                ),
                Tab(
                  text: "FutureProvider",
                ),
              ],
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.white,
                ),
                insets: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
              )),
        ),
        body: const TabBarView(
          children: [
            ProviderApp(),
            StateProviderApp(),
            StateNotifierProviderApp(),
            FutureProviderApp(),
          ],
        ),
      ),
    );
  }
}
