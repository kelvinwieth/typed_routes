import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:typed_routes/utils/fake.dart';
import 'package:typed_routes/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Fake.id;
    return ScaffoldWithAction(
      action: 'Go to book $id',
      content: 'Home Page',
      onAction: () => context.go(RoutePaths.homeBook(id: id)),
      showAppBar: false,
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Fake.id;
    return ScaffoldWithAction(
      action: 'Go to book $id',
      content: 'Search Page',
      onAction: () => context.go(RoutePaths.searchBook(id: id)),
      showAppBar: false,
    );
  }
}

class BookPage extends StatelessWidget {
  final String id;

  const BookPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAction(
      action: 'Open media',
      content: 'Book: $id',
      onAction: () => context.push(RoutePaths.player(mediaId: id)),
      showAppBar: true,
    );
  }
}

class MyBooksPage extends StatelessWidget {
  const MyBooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Fake.id;
    return ScaffoldWithAction(
      action: 'Go to book $id',
      content: 'My Books',
      onAction: () => context.go(RoutePaths.myBooksBook(id: id)),
      showAppBar: false,
    );
  }
}

class PlayerPage extends StatelessWidget {
  final String id;

  const PlayerPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAction(
      action: 'Go to book',
      content: 'Media: $id',
      onAction: () {
        context.go(RoutePaths.myBooksBook(id: id));
      },
      showAppBar: true,
    );
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithAction(
      action: 'Go to home',
      content: 'Error',
      onAction: () => context.go(RoutePaths.home),
      showAppBar: false,
    );
  }
}

class ScaffoldWithAction extends StatelessWidget {
  final String action;
  final String content;
  final void Function() onAction;
  final bool showAppBar;

  const ScaffoldWithAction({
    super.key,
    required this.action,
    required this.content,
    required this.onAction,
    required this.showAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar ? AppBar() : null,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(content),
            const SizedBox(height: 4),
            FilledButton(
              onPressed: onAction,
              child: Text(action),
            ),
          ],
        ),
      ),
    );
  }
}
