import 'package:flutter/cupertino.dart';
import 'package:snakegame/src/domain/entities/snake_entity.dart';

class SnakeController extends ChangeNotifier{
final SnakeEntity snake;
late Offset position ;
final Size screenSize;

  SnakeController({required this.snake,required this.screenSize}){
    position =  Offset(snake.headPosition['dx'],snake.headPosition['dy']);
  }

  void incrementSize() { 
      snake.grow();
    }
  

  void moveLeft() {
    if (position.dx > 10) {
      snake.move('left');
      position = Offset(snake.headPosition['dx'],snake.headPosition['dy']);
      print(snake.moveDirection);
    }
  }

  void moveRight() {
    if (position.dx < screenSize.width - 50) {
       snake.move('right');
      position = Offset(snake.headPosition['dx'],snake.headPosition['dy']);
      print(snake.moveDirection);
    }
  }

  void moveUp() {
    if (position.dy > 10) {
      snake.move('up');
      position= Offset(snake.headPosition['dx'],snake.headPosition['dy']);
      print(snake.moveDirection);
    }
  }

  void moveDown() {
    if (position.dy < screenSize.height - 100) {
      
      snake.move('down');
      position = Offset(snake.headPosition['dx'],snake.headPosition['dy']);
      print(snake.moveDirection);
    }
  }
}