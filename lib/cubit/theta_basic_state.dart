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

class ThetaLoading extends ThetaBasicState {
  const ThetaLoading();
}

class ResponseLoadedFullImage extends ThetaBasicState {
  final Image fullImage;
  const ResponseLoadedFullImage(this.fullImage);

  @override
  List<Object> get props => [fullImage];
}

class ThetaBasicLoaded extends ThetaBasicState {
  final String responseText;
  const ThetaBasicLoaded(this.responseText);

  @override
  List<Object> get props => [responseText];
}

class PictureListLoaded extends ThetaBasicState {
  final List<InkWell> imageList;
  const PictureListLoaded(this.imageList);

  @override
  List<Object> get props => [imageList];
}
