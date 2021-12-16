import 'package:theta_bloc_chop/cubit/home_state.dart';
import 'package:theta_bloc_chop/cubit/theta_basic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'view/info_button.dart';
import 'view/pano_viewer.dart';
import 'view/state_button.dart';
import 'view/take_picture_button.dart';
import 'view/thumb_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ThetaBasicCubit(),
        child: Scaffold(
          body: BlocBuilder<ThetaBasicCubit, ThetaBasicState>(
            builder: (context, state) {
              Widget responseWidget = const HomeState();
              return Column(
                children: [
                  Expanded(flex: 4, child: responseWidget),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              InfoButton(),
                              StateButton(),
                              TakePictureButton(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              ThumbButton(),
                            ],
                          )
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
