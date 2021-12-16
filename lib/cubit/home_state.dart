import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theta_bloc_chop/cubit/theta_basic_cubit.dart';
import 'package:theta_bloc_chop/view/pano_viewer.dart';

class HomeState extends StatelessWidget {
  const HomeState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThetaBasicCubit, ThetaBasicState>(
      builder: (context, state) {
        Widget responseWidget = Container();
        if (state is ThetaBasicInitial) {
          responseWidget = SelectableText(state.responseText);
        } else if (state is ThetaBasicLoaded) {
          responseWidget =
              SingleChildScrollView(child: SelectableText(state.responseText));
        } else if (state is PictureListLoaded) {
          responseWidget = ListView(
            children: state.imageList,
          );
        } else if (state is ThetaLoading) {
          responseWidget = const CircularProgressIndicator();
        } else if (state is ResponseLoadedFullImage) {
          responseWidget = const PanoViewer();
        }
        return responseWidget;
      },
    );
  }
}
