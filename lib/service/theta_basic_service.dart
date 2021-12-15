import 'dart:async';
import 'package:chopper/chopper.dart';
part 'theta_basic_service.chopper.dart';

@ChopperApi(baseUrl: '/osc')
abstract class ThetaBasicService extends ChopperService {
  @Get(
      path: '/info',
      headers: {'Content-Type': 'application/json;charset=utf-8'})
  Future<Response> thetaInfo();

  @Post(
      path: '/state',
      headers: {'Content-Type': 'application/json;charset=utf-8'})
  Future<Response> thetaState();

  static ThetaBasicService create() {
    return _$ThetaBasicService();
  }
}
