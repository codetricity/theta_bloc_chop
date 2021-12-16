import 'package:flutter/material.dart';
import 'package:theta_bloc_chop/cubit/theta_basic_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StateButton extends StatelessWidget {
  const StateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('state'),
      onPressed: () async {
        context.read<ThetaBasicCubit>().thetaState();
      },
    );
  }
}
