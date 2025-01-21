import 'package:altimetre/data/barometer_repository.dart';
import 'package:altimetre/presentation/home_page/home_page.dart';
import 'package:altimetre/presentation/theme.dart';
import 'package:altimetre/presentation/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final brightness = Brightness
        .dark; // View.of(context).platformDispatcher.platformBrightness;
    final textTheme = createTextTheme(context, "DM Sans", "Lexend");
    final theme = MaterialTheme(textTheme);

    return RepositoryProvider(
      create: (_) => BarometerRepository(),
      child: MaterialApp(
        title: 'Voluptuaria',
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        home: const HomePage(),
      ),
    );
  }
}
