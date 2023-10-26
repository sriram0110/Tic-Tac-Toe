import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/bloc/tictactoe_bloc.dart';
import 'package:tic_tac_toe/tic_tac_toe_screen.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => TictactoeBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const TicTacToeScreen(),
    );
  }
}
