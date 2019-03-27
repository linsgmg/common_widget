import 'package:flutter/material.dart';
import 'dart:async';

enum Options { A, B, C }
enum Checkouts { cancel, ok }

class SimpleDialogDemo extends StatefulWidget {
  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _choice = 'Nothing';
  String _checkout = 'Nothing';
  bool _isExpend = false;
  List<ExpandPanelItem> _expandPanelItens;

  final _bottmSheetKey = GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
    _expandPanelItens = <ExpandPanelItem>[
      ExpandPanelItem(
        headerText: 'Panel A',
        body: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: Text('Content for Panel A'),
        ),
        isExpend: false,
      ),
      ExpandPanelItem(
        headerText: 'Panel B',
        body: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: Text('Content for Panel B'),
        ),
        isExpend: false,
      ),
      ExpandPanelItem(
        headerText: 'Panel B',
        body: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: Text('Content for Panel B'),
        ),
        isExpend: false,
      ),
    ];
  }

  _shwoModalBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 180,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Option A'),
                  onTap: () {
                    Navigator.pop(context, "A");
                  },
                ),
                ListTile(
                  title: Text('Option B'),
                  onTap: () {
                    Navigator.pop(context, "B");
                  },
                ),
                ListTile(
                  title: Text('Option C'),
                  onTap: () {
                    Navigator.pop(context, "C");
                  },
                ),
              ],
            ),
          );
        });

    debugPrint('$option');
  }

  _shwoBottomSheet() {
    _bottmSheetKey.currentState.showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 80,
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_filled),
              SizedBox(
                width: 16,
              ),
              Text('01:30 03:30'),
              Expanded(
                child: Text('Fix you -ColdPlay', textAlign: TextAlign.right),
              )
            ],
          ),
        ),
      );
    });
  }

  _showSimpleDialog() async {
    final option = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('SimpleDialog'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('Option A'),
                onPressed: () {
                  Navigator.pop(context, Options.A);
                },
              ),
              SimpleDialogOption(
                child: Text('Option B'),
                onPressed: () {
                  Navigator.pop(context, Options.B);
                },
              ),
              SimpleDialogOption(
                child: Text('Option C'),
                onPressed: () {
                  Navigator.pop(context, Options.C);
                },
              ),
            ],
          );
        });
    switch (option) {
      case Options.A:
        setState(() {
          _choice = "A";
        });
        break;
      case Options.B:
        setState(() {
          _choice = "B";
        });
        break;
      case Options.C:
        setState(() {
          _choice = "C";
        });
        break;
      default:
    }
  }

  Future _showAlertDialog() async {
    Checkouts checkouts = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog'),
            content: Text('Are you sure?'),
            actions: <Widget>[
              FlatButton(
                child: Text('cancel'),
                onPressed: () {
                  Navigator.pop(context, Checkouts.cancel);
                },
              ),
              FlatButton(
                child: Text('ok'),
                onPressed: () {
                  Navigator.pop(context, Checkouts.ok);
                },
              )
            ],
          );
        });

    switch (checkouts) {
      case Checkouts.cancel:
        setState(() {
          _checkout = 'cancel';
        });
        break;
      case Checkouts.ok:
        setState(() {
          _checkout = 'ok';
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottmSheetKey,
      appBar: AppBar(
        title: Text('SimpleDialogDemo'),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(32),
            child: Column(
              children: <Widget>[
                Text('Option is : $_choice'),
              ],
            ),
          ),
          Text('checkout : $_checkout'),
          RaisedButton(
            child: Text('show a alertDialog'),
            onPressed: _showAlertDialog,
          ),
          RaisedButton(
            child: Text('show a buttomSheet'),
            onPressed: _shwoBottomSheet,
          ),
          RaisedButton(
            child: Text('show modal buttomSheet'),
            onPressed: _shwoModalBottomSheet,
          ),
          SnackBarDemo(),
          ExpansionPanelList(
            expansionCallback: (int panelIndex, bool isExpend) {
              setState(() {
                _expandPanelItens[panelIndex].isExpend = !isExpend;
              });
            },
            children: _expandPanelItens.map((ExpandPanelItem iten) {
              return ExpansionPanel(
                  isExpanded: iten.isExpend,
                  body: iten.body,
                  headerBuilder: (BuildContext context, bool isExpend) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        iten.headerText,
                        style: Theme.of(context).textTheme.title,
                      ),
                    );
                  });
            }).toList(),
            // [
            //   ExpansionPanel(
            //     headerBuilder: (BuildContext context,bool isOpen){
            //       return Container(
            //         padding: EdgeInsets.all(16),
            //         child: Text('Panel A',style:Theme.of(context).textTheme.title),
            //       );
            //     },
            //     body: Container(
            //       padding: EdgeInsets.all(16),
            //       width: double.infinity,
            //       child: Text('Content for Panel A'),
            //     ),
            //     isExpanded: _isExpend,
            //   )
            // ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        onPressed: _showSimpleDialog,
      ),
    );
  }
}

class SnackBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Open SnackBar'),
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Processing...'),
          action: SnackBarAction(
            label: 'ok',
            onPressed: () {},
          ),
        ));
      },
    );
  }
}

class ExpandPanelItem {
  final String headerText;
  bool isExpend;
  final Widget body;

  ExpandPanelItem({this.headerText, this.body, this.isExpend});
}
