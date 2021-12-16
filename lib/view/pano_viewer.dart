import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panorama/panorama.dart';
import 'package:theta_bloc_chop/cubit/theta_basic_cubit.dart';

class PanoViewer extends StatelessWidget {
  const PanoViewer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThetaBasicCubit, ThetaBasicState>(
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

        Widget panoContainer = Container();
        if (state is ResponseLoadedFullImage) {
          panoContainer = Panorama(child: state.fullImage);
        }
        return Stack(children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  width: panowidth,
                  height: double.infinity,
                  child: panoContainer,
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
      },
    );
  }
}
