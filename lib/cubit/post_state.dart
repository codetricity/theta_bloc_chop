part of 'post_cubit.dart';

@immutable
abstract class PostState extends Equatable {
  const PostState();
  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {
  final String responseText;
  const PostInitial(this.responseText);
  @override
  List<Object> get props => [responseText];
}

class PostsLoaded extends PostState {
  final List<dynamic> postList;
  const PostsLoaded(this.postList);
  @override
  List<Object> get props => [postList];
}
