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
  SnakeEntity Snake = SnakeEntity(name: 'Snake');
  ValueNotifier position = ValueNotifier<Offset>(Offset(20, 80));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _incrementSize() {
    setState(() {
      _counter++;
      Snake.grow();
    });
  }

  void _moveLeft() {
    if (position.value.dx > 10) {
      position.value = Offset(position.value.dx - 10, position.value.dy);
    }
  }

  void _moveRight() {
    if (position.value.dy < MediaQuery.of(context).size.width - 10) {
      position.value = Offset(position.value.dx + 10, position.value.dy);
    }
  }

  void _moveUp() {
    if (position.value.dy > 10) {
      position.value = Offset(position.value.dx, position.value.dy - 10);
    }
  }

  void _moveDown() {
    if (position.value.dy < MediaQuery.of(context).size.height - 10) {
      position.value = Offset(position.value.dx, position.value.dy + 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
                      width: (screenSize.width * 0.1) * Snake.part,
                      height: (screenSize.width * 0.1) * Snake.part,
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
