import 'dart:async';

import 'package:chopper/chopper.dart';

part 'placeholder_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PlaceholderService extends ChopperService {
  @Get()
  Future<Response> getPosts();

  static PlaceholderService create() {
    return _$PlaceholderService();
  }
}
