import 'package:flutter/material.dart';

class SnakeEntity {
  late int _part;
  final String name;
  late Map _headPosition;
  late double snakeSize;
  late Map _tailPosition;
  late String moveDirection;

  SnakeEntity({required this.name}) {
    _part = 0;
    snakeSize = 30;
    _headPosition = {
      'dx': 5.0,
      'dy': 5.0,
    };
    _tailPosition = _headPosition;
    moveDirection = 'stoped';
  }

  void grow() {
    _part += 1;
    if(moveDirection =='left'){
      _tailPosition['dx'] += snakeSize + 5;
    } 
    if(moveDirection =='right'){
      _tailPosition['dx'] -= snakeSize - 5;
    } 
    if(moveDirection =='down'){
      _tailPosition['dy'] -= snakeSize - 5;
    } 
    if(moveDirection =='up'){
      _tailPosition['dy'] += snakeSize + 5;
    } 
    print('uuuhm, tasty!!');
  }

  int get part => _part;

  Map get headPosition => _headPosition;
  Map get tailPosition => _tailPosition;

  void move(String direction) {
    switch (direction) {
      case "left":
        {
          _headPosition['dx'] -= 10;
          moveDirection = 'left';
        }
        break;
      case "right":
        {
          _headPosition['dx'] += 10;
          moveDirection = 'right';
        }
        break;
      case "up":
        {
          _headPosition['dy'] -= 10;
          moveDirection = 'up';
        }
        break;
      case "down":
        {
          _headPosition['dy'] += 10;
          moveDirection = 'down';
        }
        break;
    }
  }
}
