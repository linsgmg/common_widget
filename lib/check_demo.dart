import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckBoxDemo extends StatefulWidget {
  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _checkBoxValueA = true;
  bool _checkBoxValueB = true;
  int _radioGroupA = 1;
  int _radialGroupValueB = 1;
  bool _switchA = false;
  bool _switchB = false;
  double _sliverA = 0.0;
  DateTime selectDateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBoxDemo'),
        elevation: 3,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: _checkBoxValueA,
                  onChanged: ((value) {
                    setState(() {
                      _checkBoxValueA = value;
                    });
                  }),
                  activeColor: Colors.yellow,
                ),
              ],
            ),
            CheckboxListTile(
              value: _checkBoxValueB,
              onChanged: (value) {
                setState(() {
                  _checkBoxValueB = value;
                });
              },
              title: Text('checkbox item B'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.bookmark),
              selected: _checkBoxValueB,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: _radioGroupA,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupA = value;
                      debugPrint('$value');
                    });
                  },
                  activeColor: Colors.blue,
                ),
                Radio(
                  value: 1,
                  groupValue: _radioGroupA,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupA = value;
                      debugPrint('$value');
                    });
                  },
                  activeColor: Colors.green,
                ),
                Radio(
                  value: 2,
                  groupValue: _radioGroupA,
                  onChanged: (value) {
                    setState(() {
                      _radioGroupA = value;
                      debugPrint('$value');
                    });
                  },
                  activeColor: Colors.orange,
                ),
              ],
            ),
            Text('RadioGroupValue :$_radialGroupValueB'),
            SizedBox(
              height: 0,
            ),
            RadioListTile(
              value: 0,
              groupValue: _radialGroupValueB,
              onChanged: (value) {
                setState(() {
                  _radialGroupValueB = value;
                });
              },
              title: Text('Option A'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.filter_1),
              selected: _radialGroupValueB == 0,
            ),
            RadioListTile(
              value: 1,
              groupValue: _radialGroupValueB,
              onChanged: (value) {
                setState(() {
                  _radialGroupValueB = value;
                });
              },
              title: Text('Option B'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.filter_2),
              selected: _radialGroupValueB == 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _switchA ? '笑脸' : '哭脸',
                  style: TextStyle(fontSize: 20),
                ),
                Switch(
                  value: _switchA,
                  onChanged: (value) {
                    setState(() {
                      _switchA = value;
                    });
                  },
                ),
              ],
            ),
            SwitchListTile(
              value: _switchB,
              onChanged: (value) {
                setState(() {
                  _switchB = value;
                  ;
                });
              },
              title: Text('Switch item B'),
              subtitle: Text('Description'),
              secondary:
                  Icon(_switchB ? Icons.visibility : Icons.visibility_off),
              selected: _switchB == true,
            ),
            Slider(
              value: _sliverA,
              onChanged: (value) {
                setState(() {
                  _sliverA = value;
                });
              },
              activeColor: Theme.of(context).accentColor,
              inactiveColor: Theme.of(context).accentColor.withOpacity(0.3),
              min: 0.0,
              max: 10.0,
              divisions: 10,
              label: '${_sliverA.toInt()}',
            ),
            Text('SliverValue : $_sliverA'),
          ],
        ),
      ),
    );
  }
}
