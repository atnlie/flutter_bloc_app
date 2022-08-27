import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc_app/business_logic/cubits/counters/counter_cubit.dart';

// Mock Cubit
// class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

// Mock Bloc
// class MockCounterBloc extends MockBloc<CounterEvent, int>
//     implements CounterBloc {}

void main() {
  group('CounterCubit', () {
    // CounterCubit counterCubit = CounterCubit();
    CounterCubit counterCubit;
    counterCubit = CounterCubit();
    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test('The initial state for the CounterCubit is 0', () {
      expect(counterCubit.state, const CounterState(counterValue: 0));
    });

    // blocTest(
    //   'The cubit should emit a CounterState(counterValue:1) when cubit.increment function is call',
    //   build: () => counterCubit,
    //   act: (cubit) => cubit?.increment(),
    //   expect: [CounterState(counterValue: 1)],
    // );

  });
}
