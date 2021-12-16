import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:theta_bloc_chop/data/theta_image.dart';
import 'package:http/http.dart' as http;
import 'package:theta_bloc_chop/service/theta_basic_service.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'util/prettify.dart';

part 'theta_basic_state.dart';

class ThetaBasicCubit extends Cubit<ThetaBasicState> {
  final chopper = ChopperClient(
    baseUrl: 'http://192.168.1.1',
    services: [ThetaBasicService.create()],
    converter: const JsonConverter(),
  );

  void getFullImage(String url) async {
    emit(const ThetaLoading());
    var response = await http.get(Uri.parse(url));

    var imageBytes = response.bodyBytes;
    emit(ResponseLoadedFullImage(Image.memory(imageBytes)));
    Future.delayed(Duration.zero);
    print('image loaded');
  }

  ThetaBasicCubit() : super(const ThetaBasicInitial('camera response'));

  void thetaInfo() async {
    emit(const ThetaLoading());
    final thetaBasicService = chopper.getService<ThetaBasicService>();
    var response = await thetaBasicService.thetaInfo();
    emit(ThetaBasicLoaded(prettify(response.body)));
  }

  void thetaState() async {
    emit(const ThetaLoading());
    final thetaBasicService = chopper.getService<ThetaBasicService>();
    var response = await thetaBasicService.thetaState();
    emit(ThetaBasicLoaded(prettify(response.body)));
  }

  void takePicture() async {
    emit(const ThetaLoading());
    final thetaBasicService = chopper.getService<ThetaBasicService>();
    var response = await thetaBasicService.thetaCommand(
      {'name': 'camera.takePicture'},
    );
    emit(ThetaBasicLoaded(prettify(response.body)));
  }

  void getLastTenPictures() async {
    emit(const ThetaLoading());
    final thetaBasicService = chopper.getService<ThetaBasicService>();
    var response = await thetaBasicService.thetaCommand({
      'name': 'camera.listFiles',
      'parameters': {'fileType': 'image', 'entryCount': 10, 'maxThumbSize': 640}
    });

    List<InkWell> thumbList = [];
    var entriesList = response.body['results']['entries'];
    for (var entry in entriesList) {
      var thumb64 = entry['thumbnail'];
      Image thumbnail = Image.memory(base64Decode(thumb64));
      InkWell imageContainer = InkWell(
        child: thumbnail,
        onTap: () {
          getFullImage(entry['fileUrl']);
        },
      );
      thumbList.add(imageContainer);
    }
    emit(PictureListLoaded(thumbList));
  }
}
