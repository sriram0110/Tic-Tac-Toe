import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:tic_tac_toe/bloc/tictactoe_bloc.dart';

void main() {
  group('TicTacToeBloc', () {

    late TictactoeBloc tictactoeBloc;

    setUp(() {
      tictactoeBloc = TictactoeBloc();
    });

    tearDown(() {
      tictactoeBloc.close();
    });
    blocTest<TictactoeBloc, TictactoeState>(
      'emits [TictactoeUpdatedState] when TapBoxEvent is added',
      build: () => tictactoeBloc,
      act: (bloc) => bloc.add(TapBoxEvent(1)), // Simulate tapping box 1
      expect: () => [TictactoeUpdatedState(const [1])],
    );

    blocTest<TictactoeBloc, TictactoeState>(
      'emits [TictactoeUpdatedState] when RestartEvent is added',
      build: () => tictactoeBloc,
      act: (bloc) => bloc.add(RestartEvent()), // Simulate restarting the game
      expect: () => [TictactoeInitialState(),],
    );
  });

}
