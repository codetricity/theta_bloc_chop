import 'package:flutter/material.dart';
import 'package:theta_bloc_chop/cubit/theta_basic_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TakePictureButton extends StatelessWidget {
  const TakePictureButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('take pict'),
      onPressed: () async {
        context.read<ThetaBasicCubit>().takePicture();
      },
    );
  }
}
