import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/business_logic/cubits/internet/internet_connection_cubit.dart';
import 'package:flutter_bloc_app/constants/enums.dart';
import 'package:flutter_bloc_app/presentation/screens/third_screen/third_screen.dart';

import '../../../business_logic/cubits/counters/counter_cubit.dart';
import '../second_screen/second_screen.dart';

class FirstScreen extends StatefulWidget {
  final String title;
  final Color color;

  const FirstScreen({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  static const String routeName = '/';

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  GlobalKey<ScaffoldState> firstScreenKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // return BlocListener(listener: listener),
    if (kDebugMode) {
      print('Build Main Widget');
    }
    return BlocListener<InternetConnectionCubit, InternetConnectionState>(
      listener: (context, state) {
        if (state is InternetConnected && state.connectionType == ConnectionType.wifi) {
          context.bloc<CounterCubit>.increment();
          context.
        } else if (state is InternetConnected && state.connectionType == ConnectionType.mobile) {
          context.bloc<CounterCubit>.decrement();
        }
      },
      child: SafeArea(
        child: Scaffold(
          key: firstScreenKey,
          appBar: AppBar(
            title: Text(widget.title),
            backgroundColor: widget.color,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
                    builder: (context, state) {
                  if (state is InternetConnected && state.connectionType == ConnectionType.wifi) {
                    return Text(
                      'Wifi',
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: Colors.green,
                          ),
                    );
                  } else if (state is InternetConnected &&
                      state.connectionType == ConnectionType.mobile) {
                    return Text(
                      'Mobile',
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: Colors.green,
                          ),
                    );
                  } else if (state is InternetDisconnected) {
                    return Text(
                      'Disconnected',
                      style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: Colors.green,
                          ),
                    );
                  }
                  return const CircularProgressIndicator();
                }),
                const Divider(height: 5),
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
                        print('secondScreen');
                        Navigator.of(context).pushNamed(
                          SecondScreen.routeName,
                          arguments: firstScreenKey,
                        );
                      },
                      child: const Text('Second'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print('Third');
                        Navigator.of(context).pushNamed(
                          ThirdScreen.routeName,
                          // arguments: firstScreenKey,
                        );
                      },
                      child: const Text('Third'),
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
                  heroTag: 'fs_increment',
                  onPressed: () {
                    print('Increment');
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: 'fs_decrement',
                  onPressed: () {
                    print('Decrement');
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: 'Decrement',
                  child: const Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: 'fs_reset',
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
      ),
    );
  }
}
