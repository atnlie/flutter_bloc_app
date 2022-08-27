// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/presentation/router/app_router.dart';
import 'package:flutter_bloc_app/presentation/screens/first_screen/first_screen.dart';

import 'business_logic/cubits/counters/counter_cubit.dart';

void main() {
  runApp(BlocApp());
}

class BlocApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  BlocApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: const FirstScreen(color: Colors.yellowAccent, title: 'Home',),
        // initialRoute: '/firstScreen',
        onGenerateRoute: (settings) {
          _appRouter.OnGenerateRoute(settings);
          return;
        },
      ),
    );
  }
}
