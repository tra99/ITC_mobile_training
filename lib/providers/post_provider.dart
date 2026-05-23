import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/post.dart';
import '../services/post_service.dart';

final postServiceProvider = Provider<PostService>((ref) {
  return PostService();
});

final postControllerProvider =
    StateNotifierProvider<PostController, AsyncValue<List<Post>>>((ref) {
  final service = ref.watch(postServiceProvider);
  return PostController(service);
});

class PostController extends StateNotifier<AsyncValue<List<Post>>> {
  final PostService service;

  PostController(this.service) : super(const AsyncValue.loading()) {
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      state = const AsyncValue.loading();

      final posts = await service.getPosts();

      state = AsyncValue.data(posts);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> addPost(Post post) async {
    try {
      final newPost = await service.createPost(post);

      final currentPosts = state.value ?? [];

      state = AsyncValue.data([
        newPost,
        ...currentPosts,
      ]);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updatePost(int id, Post updatedPost) async {
    try {
      final result = await service.updatePost(id, updatedPost);

      final currentPosts = state.value ?? [];

      final updatedList = currentPosts.map((post) {
        if (post.id == id) {
          return result;
        }
        return post;
      }).toList();

      state = AsyncValue.data(updatedList);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> deletePost(int id) async {
    try {
      await service.deletePost(id);

      final currentPosts = state.value ?? [];

      final updatedList = currentPosts.where((post) {
        return post.id != id;
      }).toList();

      state = AsyncValue.data(updatedList);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}