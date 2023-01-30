// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:bloc/bloc.dart';

class SeatCubit extends Cubit<List<String>> {
  SeatCubit() : super([]);

  bool isSelected(String id) {
    int index = state.indexOf(id);

    if (index == -1) {
      return false;
    } else {
      return true;
    }
  }

  void selecSeat(String id) {
    print("Previous State: $state");
    if (!isSelected(id)) {
      state.add(id);
    } else {
      state.remove(id);
    }
    print("New State: $state");
    emit(List.from(state));
  }
}
