import 'package:flutter/material.dart';
import 'package:movie_bloc_freezed/injection.dart';

import 'src/core/routing/route_generator.dart';

void main() {
  init();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // initialRoute: HomePage.,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
    );
  }
}
