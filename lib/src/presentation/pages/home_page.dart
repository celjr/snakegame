import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children:  [
              const Text('Snake Game',style: TextStyle(fontSize: 30),),
               const Spacer(),
               ElevatedButton(onPressed: () {
                 Navigator.pushNamed(context,'/game');
               }, child: const Text("PLAY")),
               const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}