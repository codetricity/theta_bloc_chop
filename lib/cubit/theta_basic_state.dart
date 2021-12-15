part of 'theta_basic_cubit.dart';

abstract class ThetaBasicState extends Equatable {
  const ThetaBasicState();

  @override
  List<Object> get props => [];
}

class ThetaBasicInitial extends ThetaBasicState {
  final String responseText;
  const ThetaBasicInitial(this.responseText);

  @override
  List<Object> get props => [responseText];
}

class ThetaBasicLoaded extends ThetaBasicState {
  final String responseText;
  const ThetaBasicLoaded(this.responseText);

  @override
  List<Object> get props => [responseText];
}
