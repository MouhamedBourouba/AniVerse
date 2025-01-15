import 'package:ani_verse/presentation/screens/anime_feed.dart';
import 'package:ani_verse/presentation/screens/anime_search.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  AppRoutes._();

  static final GoRouter router = GoRouter(routes: [
    GoRoute(path: "/", builder: (context, state) => const AnimeFeedPage(), routes: [
      GoRoute(path: "search", builder: (context, state) => const AnimeSearchPage()),
    ]),
  ]);
}
