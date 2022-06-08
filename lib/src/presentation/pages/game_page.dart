import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snakegame/src/domain/entities/snake_entity.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int _counter = 0;
  SnakeEntity snake = SnakeEntity(name: 'Snake');

  late ValueNotifier position;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    position = ValueNotifier<Offset>(
        Offset(snake.headPosition['dx'], snake.headPosition['dy']));
  }

  void _incrementSize() {
    setState(() {
      _counter++;
      snake.grow();
    });
  }

  void _moveLeft() {
    if (position.value.dx > 10) {
      snake.move('left');
      position.value =
          Offset(snake.headPosition['dx'], snake.headPosition['dy']);
      print(snake.moveDirection);
    }
  }

  void _moveRight() {
    if (position.value.dx < MediaQuery.of(context).size.width - 50) {
      snake.move('right');
      position.value =
          Offset(snake.headPosition['dx'], snake.headPosition['dy']);
      print(snake.moveDirection);
    }
  }

  void _moveUp() {
    if (position.value.dy > 10) {
      snake.move('up');
      position.value =
          Offset(snake.headPosition['dx'], snake.headPosition['dy']);
      print(snake.moveDirection);
    }
  }

  void _moveDown() {
    if (position.value.dy < MediaQuery.of(context).size.height - 100) {
      snake.move('down');
      position.value =
          Offset(snake.headPosition['dx'], snake.headPosition['dy']);
      print(snake.moveDirection);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    print(screenSize * 0.1);
    return RawKeyboardListener(
      focusNode: FocusNode(),
      onKey: (event) {
        if (event is RawKeyDownEvent) {
          if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) _moveLeft();
          if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) _moveDown();
          if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) _moveRight();
          if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) _moveUp();
          if (event.isKeyPressed(LogicalKeyboardKey.space)) _incrementSize();
        }
        ;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  color: Colors.green,
                ),
                ValueListenableBuilder(
                  valueListenable: position,
                  builder: (context, value, child) => Positioned(
                    left: position.value.dx,
                    top: position.value.dy,
                    child: Container(
                      color: Colors.white,
                      width: (snake.snakeSize),
                      height: (snake.snakeSize),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: ValueListenableBuilder(
            builder: (context, value, child) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton(
                  onPressed: _incrementSize,
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: _moveLeft,
                  tooltip: 'Left',
                  child: const Icon(Icons.arrow_back),
                ),
                FloatingActionButton(
                  onPressed: _moveRight,
                  tooltip: 'Right',
                  child: const Icon(Icons.arrow_forward),
                ),
                FloatingActionButton(
                  onPressed: _moveUp,
                  tooltip: 'Up',
                  child: const Icon(Icons.arrow_upward),
                ),
                FloatingActionButton(
                  onPressed: _moveDown,
                  tooltip: 'Down',
                  child: const Icon(Icons.arrow_downward),
                ),
              ],
            ),
            valueListenable: position,
          )),
    );
  }
}
