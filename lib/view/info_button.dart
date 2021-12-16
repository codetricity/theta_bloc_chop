import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:theta_bloc_chop/cubit/theta_basic_cubit.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('info'),
      onPressed: () async {
        context.read<ThetaBasicCubit>().thetaInfo();
      },
    );
  }
}
