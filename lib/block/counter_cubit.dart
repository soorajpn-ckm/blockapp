import 'package:flutter_bloc/flutter_bloc.dart';

final CounterCubit counterCubit = CounterCubit(8);

class CounterCubit extends Cubit<int> {
  CounterCubit(int state) : super(state);

  void add() => {print('## count $state'), emit(state + 1)};
  void remove() => emit(state - 1);
}
