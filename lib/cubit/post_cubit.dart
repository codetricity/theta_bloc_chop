import 'package:bloc/bloc.dart';
import 'package:bloc_chop/service/placeholder_service.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final chopper = ChopperClient(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    services: [PlaceholderService.create()],
    converter: const JsonConverter(),
  );

  PostCubit() : super(const PostInitial('api response'));

  void getPost() async {
    final placeholderService = chopper.getService<PlaceholderService>();
    var response = await placeholderService.getPosts();
    emit(PostsLoaded(response.body));
    print(response.body.runtimeType);
  }
}
