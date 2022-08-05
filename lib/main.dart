import 'package:flutter/material.dart';
import 'package:martial_arts_seeker/pages/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Martial Arts Seeker',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MainScreen(title: 'Martial Arts'),
      debugShowCheckedModeBanner: false,
    );
  }
}
