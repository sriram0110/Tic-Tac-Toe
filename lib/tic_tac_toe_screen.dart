import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/bloc/tictactoe_bloc.dart';
import 'package:tic_tac_toe/utils/constants.dart';

class TicTacToeScreen extends StatelessWidget {
  const TicTacToeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(Constants.appBarTitle)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(
                    color: Constants.pink,
                    width: 2,
                  ),
                  color: Constants.pink),
              child: Container(
                margin: const EdgeInsets.all(0.5),
                padding: const EdgeInsets.all(0.5),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 239, 229, 217),
                      width: 2),
                  color: Colors.grey[200],
                ),
                child: Table(
                  children: List.generate(
                    5,
                    (i) {
                      return TableRow(
                        children: List.generate(
                          5,
                          (j) {
                            int index = i * 5 + j;
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<TictactoeBloc>(context)
                                    .add(TapBoxEvent(index + 1));
                              },
                              child: SizedBox(
                                height: 70,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  color: Constants.boxColors[index],
                                  child: Center(
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: BlocBuilder<TictactoeBloc,
                                            TictactoeState>(
                                          buildWhen: (previous, current) =>
                                              current
                                                  is TictactoeUpdatedState ||
                                              current is TictactoeInitialState,
                                          builder: (context, state) {
                                            if (state
                                                    is TictactoeUpdatedState &&
                                                state.tappedNumbers
                                                    .contains(index + 1)) {
                                              return Text(
                                                '${state.tappedNumbers.indexOf(index + 1) + 1}',
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              );
                                            }

                                            if (state
                                                is TictactoeInitialState) {
                                              return const Text('');
                                            }

                                            return Container();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<TictactoeBloc>(context).add(RestartEvent());
        },
        child: const Icon(
          Icons.restart_alt_rounded,
          size: 30.0,
        ),
      ),
    );
  }
}
