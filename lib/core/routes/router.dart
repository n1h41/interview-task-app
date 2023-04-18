import 'package:go_router/go_router.dart';
import 'package:interview_task_app/features/posts/presentation/view/post_screen.dart';

import '../../features/posts/presentation/view/post_detail_screen.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'Posts',
      path: '/',
      builder: (context, state) => const PostScreen(),
      routes: [
        GoRoute(
          name: 'Post Details',
          path: 'details/:id',
          builder: (context, state) => PostDetailScreen(
            id: int.parse(state.params['id']!),
          ),
        ),
      ],
    )
  ],
);
