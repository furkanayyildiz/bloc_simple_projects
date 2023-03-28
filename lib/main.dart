import 'package:flutter/material.dart';
import 'package:simple_bloc_app/feature/project2/project2_page.dart';
import './feature/project1/project1_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Project2Page() //Project1Page() - HomePage(),
        );
  }
}
