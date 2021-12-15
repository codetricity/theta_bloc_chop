import 'package:bloc/bloc.dart';
import 'package:theta_bloc_chop/service/theta_basic_service.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';

part 'theta_basic_state.dart';

class ThetaBasicCubit extends Cubit<ThetaBasicState> {
  final chopper = ChopperClient(
    baseUrl: 'http://192.168.1.1',
    services: [ThetaBasicService.create()],
    converter: const JsonConverter(),
  );

  ThetaBasicCubit() : super(const ThetaBasicInitial('camera response'));

  void thetaInfo() async {
    final thetaBasicService = chopper.getService<ThetaBasicService>();
    var response = await thetaBasicService.thetaInfo();
    emit(ThetaBasicLoaded(response.body.toString()));
  }

  void thetaState() async {
    final thetaBasicService = chopper.getService<ThetaBasicService>();
    var response = await thetaBasicService.thetaState();
    emit(ThetaBasicLoaded(response.body.toString()));
  }

  void takePicture() async {
    final thetaBasicService = chopper.getService<ThetaBasicService>();
    var response =
        await thetaBasicService.thetaCommand({'name': 'camera.takePicture'});
    emit(ThetaBasicLoaded(response.body.toString()));
  }
}
