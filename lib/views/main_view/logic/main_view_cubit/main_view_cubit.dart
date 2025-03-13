import 'package:bloc/bloc.dart';
part 'main_view_state.dart';

class MainViewCubit extends Cubit<MainViewState> {
  MainViewCubit() : super(MainViewInitial());
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(MainViewIndexChanged());
  }
}
