import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubits/counters/counter_cubit.dart';

class ThirdScreen extends StatefulWidget {
  static const String routeName = '/thirdScreen';
  final String title;
  final Color color;

  const ThirdScreen({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  State<ThirdScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<ThirdScreen> {
  GlobalKey<ScaffoldState> thirdScreenKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('Build Main Widget');
    }
    return SafeArea(
      child: Scaffold(
        key: thirdScreenKey,
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  print('State -> ${state.counterValue}');
                  return Text(
                    'Counter: ${state.counterValue.toString()}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('test');
                    },
                    child: const Text('First'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('test');
                    },
                    child: const Text('Second'),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  print('Increment');
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  print('Decrement');
                  BlocProvider.of<CounterCubit>(context).decrement();
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  print('Reset');
                  BlocProvider.of<CounterCubit>(context).reset();
                },
                tooltip: 'Reset',
                child: const Icon(Icons.refresh),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
