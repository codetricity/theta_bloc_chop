import 'package:bloc_chop/cubit/theta_basic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
                responseWidget = SingleChildScrollView(
                    child: SelectableText(state.responseText));
              } else if (state is ThetaBasicLoaded) {
                responseWidget = SingleChildScrollView(
                    child: SelectableText(state.responseText));
              }

              return Column(
                children: [
                  Expanded(flex: 4, child: responseWidget),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            child: const Text('info'),
                            onPressed: () async {
                              context.read<ThetaBasicCubit>().thetaInfo();
                            },
                          ),
                          ElevatedButton(
                            child: const Text('state'),
                            onPressed: () async {
                              context.read<ThetaBasicCubit>().thetaState();
                            },
                          ),
                          ElevatedButton(
                            child: const Text('take pict'),
                            onPressed: () async {
                              context.read<ThetaBasicCubit>().takePicture();
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
