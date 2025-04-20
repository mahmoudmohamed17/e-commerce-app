import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('Bloc $bloc, Change: ${change.nextState}');
  }

  @override
  void onClose(BlocBase bloc) {
    log('Close $bloc');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('Create $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {}

  @override
  void onEvent(Bloc bloc, Object? event) {}

  @override
  void onTransition(Bloc bloc, Transition transition) {}
}
