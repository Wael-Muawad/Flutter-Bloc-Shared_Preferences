import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement, sliding }

class MyCounter extends Bloc<CounterEvent, double> {
  MyCounter(double initialState) : super(initialState);

  @override
  Stream<double> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        if (state < 100) yield state + 1;
        break;
      case CounterEvent.decrement:
        if (state > 0) yield state - 1;
        break;
      case CounterEvent.sliding:
        yield state;
        break;
    }
  }
}
