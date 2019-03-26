import 'package:flutter/material.dart';

class PopMenuButtonDemo extends StatefulWidget {
  _PopMenuButtonDemoState createState() => _PopMenuButtonDemoState();
}

class _PopMenuButtonDemoState extends State<PopMenuButtonDemo> {
  String _value='Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopButtom'),
        elevation: 3,
        actions: <Widget>[],
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('$_value'),
                PopupMenuButton(
                  onSelected: (value){
                    setState(() {
                     _value=value; 
                    });
                  },
                  itemBuilder: (BuildContext context) => [
                        PopupMenuItem(
                          child: Text('Home'),
                          value: 'Home',
                        ),
                        PopupMenuItem(
                          child: Text('One'),
                          value: 'One',
                        ),
                        PopupMenuItem(
                          child: Text('Two'),
                          value: 'Two',
                        ),
                        CheckedPopupMenuItem(
                          child: Text('Three'),
                          value: 'Three',
                        ),
                      ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
