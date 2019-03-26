import 'package:flutter/material.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  final Widget child;

  BottomNavigationBarDemo({Key key, this.child}) : super(key: key);

  _BottomNavigationBarDemoState createState() =>
      _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _index = 0;
  _indexHandler(int index) {
    setState(() {
      if (index == 0) {
        Navigator.pushNamed(context, '/form_demo');
        debugPrint('底部按钮一');
      } else {
        debugPrint('底部按钮二');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _index,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,
      onTap: _indexHandler,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.explore), title: Text('explore')),
        BottomNavigationBarItem(
            icon: Icon(Icons.history), title: Text('history')),
        BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('list')),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text('person')),
      ],
    );
  }
}
