import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/post.dart';
import '../providers/post_provider.dart';

class PostFormScreen extends ConsumerStatefulWidget {
  final Post? post;

  const PostFormScreen({
    super.key,
    this.post,
  });

  @override
  ConsumerState<PostFormScreen> createState() => _PostFormScreenState();
}

class _PostFormScreenState extends ConsumerState<PostFormScreen> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  bool get isEditMode => widget.post != null;

  @override
  void initState() {
    super.initState();

    if (isEditMode) {
      titleController.text = widget.post!.title;
      bodyController.text = widget.post!.body;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  Future<void> savePost() async {
    final title = titleController.text.trim();
    final body = bodyController.text.trim();

    if (title.isEmpty || body.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
        ),
      );
      return;
    }

    final post = Post(
      id: widget.post?.id,
      title: title,
      body: body,
      userId: 1,
    );

    if (isEditMode) {
      await ref
          .read(postControllerProvider.notifier)
          .updatePost(widget.post!.id!, post);
    } else {
      await ref.read(postControllerProvider.notifier).addPost(post);
    }

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditMode ? 'Edit Post' : 'Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: bodyController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: savePost,
                child: Text(isEditMode ? 'Update' : 'Create'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}