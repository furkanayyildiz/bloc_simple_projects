import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void incement() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}
