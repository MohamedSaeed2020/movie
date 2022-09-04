import 'package:flutter/material.dart';
import 'package:movie/core/services/services_locator.dart';
import 'package:movie/core/utils/app_strings.dart';
import 'package:movie/movies/presentation/screens/movies_screen.dart';
void main() {
  ServicesLocator.init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MoviesScreen(),
    );
  }
}


