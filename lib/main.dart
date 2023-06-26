import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>((ref) => "RiverPod Basics");
final textProvider =
    Provider<String>((ref) => "You have pushed the button this many times:");
final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

void main() {
  runApp(const ProviderScope(child: RiverpodBasic()));
}

class RiverpodBasic extends StatelessWidget {
  const RiverpodBasic({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Consumer(
            builder: (context, ref, child) {
              return Text(ref.watch(titleProvider));
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              MyText(),
              MyCounterText(),
            ],
          ),
        ),
        floatingActionButton: const MyFloadtingActionButton());
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class MyText extends ConsumerWidget {
  const MyText({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      ref.watch(textProvider),
    );
  }
}

class MyFloadtingActionButton extends ConsumerWidget {
  const MyFloadtingActionButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(counterStateProvider.state).state++;
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class MyCounterText extends ConsumerWidget {
  const MyCounterText({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      ref.watch(counterStateProvider).toString(),
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
