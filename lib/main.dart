import 'package:bloc_chop/service/placeholder_service.dart';
import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String message = 'stateless message';
  final chopper = ChopperClient(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    services: [PlaceholderService.create()],
    converter: const JsonConverter(),
  );
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final placeholderService = chopper.getService<PlaceholderService>();
    return MaterialApp(
      home: Scaffold(
        body: ElevatedButton(
          child: const Text('get'),
          onPressed: () async {
            var response = await placeholderService.getPosts();
            print(response.body);
          },
        ),
      ),
    );
  }
}
