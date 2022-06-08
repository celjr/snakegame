import 'package:flutter/material.dart';

class SnakeEntity {
  late int _part;
  final String name;
  late Map _headPosition;

  SnakeEntity({required this.name}) {
    _part = 1;
    _headPosition = {
      'dx': 5,
      'dy': 5,
    };
  }

  void grow() {
    _part += 1;
    print('uuuhm, tasty!!');
  }

  int get part => _part;

  void move(String direction) {
    switch (direction) {
      case "left":
        {
          _headPosition['dx'] -= 10;
        }
        break;
      case "right":
        {
          _headPosition['dx'] += 10;
        }
        break;
      case "up":
        {
          _headPosition['dy'] += 10;
        }
        break;
      case "down":
        {
          _headPosition['dy'] -= 10;
        }
        break;
    }
    ;
  }
}
