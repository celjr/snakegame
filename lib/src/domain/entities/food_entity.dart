class Food{
  final String name;
  late Map _position;

  Food({required this.name,}){
    _position = {
      'dx': 5,
      'dy': 5,
    };
  }

  Map get position => _position;

  void set position(Map value) => _position = value; 

}