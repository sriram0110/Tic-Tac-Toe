part of 'tictactoe_bloc.dart';

@immutable
abstract class TictactoeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TictactoeInitialState extends TictactoeState {}

class TictactoeUpdatedState extends TictactoeState {
  final List<int> tappedNumbers;

  TictactoeUpdatedState(this.tappedNumbers);

  @override
  List<Object?> get props => [tappedNumbers];
}
