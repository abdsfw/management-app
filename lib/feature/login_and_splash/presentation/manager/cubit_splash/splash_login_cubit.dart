import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'splash_login_state.dart';

class SplashLoginCubit extends Cubit<SplashLoginState> {
  SplashLoginCubit() : super(SplashLoginInitial());

  double animatedContainerHeight = 0;
  bool forTextAppear = false;
  int durationOfAnimation = 290;
  void changeContainerHeight() {
    animatedContainerHeight = 30;
    emit(AddToHeightState());
    Timer(Duration(milliseconds: durationOfAnimation), () {
      forTextAppear = true;
      emit(AddToHeightState());
    });
  }
}
