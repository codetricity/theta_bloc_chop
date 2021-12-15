// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theta_basic_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ThetaBasicService extends ThetaBasicService {
  _$ThetaBasicService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ThetaBasicService;

  @override
  Future<Response<dynamic>> thetaInfo() {
    final $url = '/osc/info';
    final $headers = {
      'Content-Type': 'application/json;charset=utf-8',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> thetaState() {
    final $url = '/osc/state';
    final $headers = {
      'Content-Type': 'application/json;charset=utf-8',
    };

    final $request = Request('POST', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
