import 'package:bloc_chop/cubit/post_cubit.dart';
import 'package:bloc_chop/cubit/theta_basic_cubit.dart';
import 'package:bloc_chop/service/placeholder_service.dart';
import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ThetaBasicCubit(),
        child: Scaffold(
          body: BlocBuilder<ThetaBasicCubit, ThetaBasicState>(
            builder: (context, state) {
              Widget responseWidget = Container();
              if (state is ThetaBasicInitial) {
                responseWidget = Text(state.responseText);
              } else if (state is ThetaBasicLoaded) {
                responseWidget = Text(state.responseText);
              }

              return Column(
                children: [
                  Expanded(flex: 4, child: responseWidget),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ElevatedButton(
                            child: const Text('info'),
                            onPressed: () async {
                              context.read<ThetaBasicCubit>().thetaInfo();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
