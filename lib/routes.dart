import 'package:go_router/go_router.dart';
import 'package:typed_routes/pages.dart';

sealed class Tabs {
  static final home = StatefulShellBranch(
    routes: [Routes.home],
  );

  static final search = StatefulShellBranch(
    routes: [Routes.search],
  );

  static final myBooks = StatefulShellBranch(
    routes: [Routes.myBooks],
  );
}

sealed class Routes {
  static final home = GoRoute(
    path: '/home',
    builder: (_, __) => const HomePage(),
    routes: [_book],
  );

  static final search = GoRoute(
    path: '/search',
    builder: (_, __) => const SearchPage(),
    routes: [_book],
  );

  static final myBooks = GoRoute(
    path: '/my-books',
    builder: (_, __) => const MyBooksPage(),
    routes: [_book],
  );

  static final player = GoRoute(
    path: '/player/:id',
    builder: (_, state) {
      final id = state.pathParameters['id'];
      return id == null ? const ErrorPage() : PlayerPage(id: id);
    },
  );

  static final _book = GoRoute(
    path: 'books/:id',
    builder: (_, state) {
      final id = state.pathParameters['id'];
      return id == null ? const ErrorPage() : BookPage(id: id);
    },
  );
}

sealed class RoutePaths {
  static String get home => Routes.home.path;

  static String get search => Routes.search.path;

  static String get myBooks => Routes.myBooks.path;

  static String homeBook({required String id}) {
    return '$home/${_book(id: id)}';
  }

  static String myBooksBook({required String id}) {
    return '$myBooks/${_book(id: id)}';
  }

  static String searchBook({required String id}) {
    return '$search/${_book(id: id)}';
  }

  static String player({required String mediaId}) {
    return Routes.player.path.replaceAll(':id', mediaId);
  }

  static String _book({required String id}) {
    return Routes._book.path.replaceAll(':id', id);
  }
}
