import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counterValue: 0)) {
    on<CounterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
