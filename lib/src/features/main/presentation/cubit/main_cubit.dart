import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_states.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialState());

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeCurrentIndex(int index) {
  emit(MainChangeIndexLoadingState());
  _currentIndex = index;
  emit(MainChangeIndexSuccessState());
  }
}
