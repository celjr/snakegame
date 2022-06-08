import 'package:flutter/material.dart';
import 'package:snakegame/src/presentation/pages/home_page.dart';

import '../pages/game_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const HomePage(),
        '/game' :(context) => const GamePage(title: 'title')
      }
    );
  }
}