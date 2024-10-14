import 'package:flutter/material.dart';
import 'package:typed_routes/router.dart';

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: AppRouter.config,
      debugShowCheckedModeBanner: false,
    ),
  );
}
