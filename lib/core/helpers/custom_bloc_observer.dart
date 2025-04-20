import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('Bloc $bloc, Change: ${change.nextState}');
  }

  @override
  void onClose(BlocBase bloc) {
    log('Bloc $bloc Close');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('Bloc $bloc Create');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {}

  @override
  void onEvent(Bloc bloc, Object? event) {}

  @override
  void onTransition(Bloc bloc, Transition transition) {}
}
