import 'package:safe_tech/ui/shared/start_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Safe Tech',
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}
