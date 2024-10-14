import 'package:go_router/go_router.dart';
import 'package:typed_routes/utils/shell_scaffold.dart';
import 'package:typed_routes/pages.dart';
import 'package:typed_routes/routes.dart';

class AppRouter {
  static GoRouter get config {
    return GoRouter(
      initialLocation: RoutePaths.home,
      errorBuilder: (_, __) => const ErrorPage(),
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (_, __, shell) => ShellScaffold(shell: shell),
          branches: [
            Tabs.home,
            Tabs.search,
            Tabs.myBooks,
          ],
        ),
        Routes.player,
      ],
    );
  }
}
