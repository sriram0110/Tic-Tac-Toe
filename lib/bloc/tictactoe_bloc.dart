import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tictactoe_event.dart';
part 'tictactoe_state.dart';

class TictactoeBloc extends Bloc<TictactoeEvent, TictactoeState> {
  List<int> tappedNumbers = [];
  int currentNumber = 1;

  TictactoeBloc() : super(TictactoeInitialState()) {
    on<TapBoxEvent>(_onTapBoxEvent);
    on<RestartEvent>(_onRestartEvent);
  }

  void _onTapBoxEvent(TapBoxEvent event, Emitter<TictactoeState> emit) {
    if (!tappedNumbers.contains(event.number)) {
      tappedNumbers.add(event.number);

      currentNumber++;

      if (currentNumber < 26 || (currentNumber == 26)) {
        emit(TictactoeUpdatedState(List.from(tappedNumbers)));
      }
    }
  }

  void _onRestartEvent(RestartEvent event, Emitter<TictactoeState> emit) {
    tappedNumbers = [];
    currentNumber = 1;
    emit(TictactoeInitialState());
  }
}
