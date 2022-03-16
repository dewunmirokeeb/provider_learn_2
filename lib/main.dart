import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn_2/module/new_data.dart';
import 'package:provider_learn_2/pages/stories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ChangeNotifierProvider(
        create: (context) => NewsData(),
        builder: (context, child) {
          return const StoriesPage();
        },
      ),
    );
  }
}
