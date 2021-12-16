import 'package:panorama/panorama.dart';
import 'package:theta_bloc_chop/cubit/theta_basic_cubit.dart';
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
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ThetaBasicCubit(),
        child: Scaffold(
          body: BlocBuilder<ThetaBasicCubit, ThetaBasicState>(
            builder: (context, state) {
              double screenwidth = MediaQuery.of(context).size.width;

              double panowidth = screenwidth;
              double bufferwidth = 50;
              if (screenwidth > 600 && screenwidth < 900) {
                panowidth = screenwidth * .7;
                bufferwidth = 150;
              } else if (screenwidth >= 900 && screenwidth < 1200) {
                panowidth = screenwidth * .6;
                bufferwidth = screenwidth / 5;
              } else if (screenwidth >= 1200) {
                panowidth = screenwidth * .5;
                bufferwidth = screenwidth / 4;
              }
              Widget responseWidget = Container();
              if (state is ThetaBasicInitial) {
                responseWidget = SingleChildScrollView(
                    child: SelectableText(state.responseText));
              } else if (state is ThetaBasicLoaded) {
                responseWidget = SingleChildScrollView(
                    child: SelectableText(state.responseText));
              } else if (state is PictureListLoaded) {
                responseWidget = ListView(
                  children: state.imageList,
                );
              } else if (state is ThetaLoading) {
                responseWidget = const CircularProgressIndicator();
              } else if (state is ResponseLoadedFullImage) {
                responseWidget = Stack(children: [
                  Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          width: panowidth,
                          height: double.infinity,
                          child: Panorama(
                            child: state.fullImage,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: bufferwidth,
                        color: Colors.white,
                      ),
                      Container(
                        width: bufferwidth,
                        color: Colors.white,
                      ),
                    ],
                  )
                ]);
              }

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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                child: const Text('thumbs'),
                                onPressed: () async {
                                  context
                                      .read<ThetaBasicCubit>()
                                      .getLastTenPictures();
                                },
                              ),
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
