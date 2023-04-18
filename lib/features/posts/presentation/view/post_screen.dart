// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interview_task_app/features/posts/presentation/viewModel/post_view_model.dart';

import '../../repository/entities/post.dart';
import '../viewModel/module.dart';
import '../viewModel/post_state.dart';

class PostScreen extends HookConsumerWidget {
  const PostScreen({super.key});

  Future<void> fetchPosts(int pageNumber, WidgetRef ref) async {
    final PostViewModel postViewModel =
        ref.read<PostViewModel>(postViewModelProvider.notifier);
    postViewModel.currentPage = pageNumber;
    await postViewModel.fetchPosts();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PostState state = ref.watch(postViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return fetchPosts(1, ref);
        },
        child: state.status == PostStatus.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : state.status == PostStatus.failure
                ? Center(
                    child: Text(
                      'Error occured. Try refreshing!',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.posts.length +
                              (state.status == PostStatus.loading ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == state.posts.length) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              final Post myItem = state.posts[index];
                              return InkWell(
                                child: ListTile(
                                  title: Text(myItem.title!),
                                  subtitle: Text(myItem.url!),
                                  leading: Hero(
                                    tag: 'post_${myItem.id}',
                                    child: FadeInImage(
                                      placeholder: AssetImage(
                                          'assets/images/placeholder.png'),
                                      image: NetworkImage(myItem.thumbnailUrl!),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  context.go('/details/${myItem.id}');
                                },
                              );
                            }
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: state.currentPage == 1
                                ? null
                                : () => fetchPosts(state.currentPage - 1, ref),
                            child: const Text('Prev'),
                          ),
                          Consumer(builder: (context, ref, child) {
                            return Text(
                              state.currentPage.toString(),
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }),
                          TextButton(
                            onPressed: () =>
                                fetchPosts(state.currentPage + 1, ref),
                            child: const Text('Next'),
                          ),
                        ],
                      )
                    ],
                  ),
      ),
    );
  }
}
