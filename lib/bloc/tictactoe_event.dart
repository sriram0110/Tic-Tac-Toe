part of 'tictactoe_bloc.dart';

@immutable
abstract class TictactoeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TapBoxEvent extends TictactoeEvent {
  final int number;

  TapBoxEvent(this.number);

  @override
  List<Object?> get props => [number];
}

class RestartEvent extends TictactoeEvent {}
