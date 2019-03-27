import 'package:flutter/material.dart';
import 'pop_menu_button_demo.dart';
import 'check_demo.dart';
import 'check_demo2.dart';
import 'simple_dialog_demo.dart';

class MaterialComponets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponets'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(title: 'FloatingBotton', page: FloatingBotton()),
          ListItem(title: 'Botton', page: BottonDemo()),
          ListItem(title: 'PopMenuButtonDemo', page: PopMenuButtonDemo()),
          ListItem(title: 'CheckBoxDemo', page: CheckBoxDemo()),
          ListItem(title: 'CheckBoxDemo2', page: CheckBoxDemo2()),
          ListItem(title: 'SimpleDialogDemo', page: SimpleDialogDemo()),
        ],
      ),
    );
  }
}

class BottonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
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
                FlatButton(
                  child: Text('Button'),
                  onPressed: () {},
                  splashColor: Colors.grey,
                  textColor: Theme.of(context).primaryColor,
                ),
                FlatButton.icon(
                  icon: Icon(Icons.home),
                  label: Text('Button'),
                  onPressed: () {},
                  splashColor: Colors.grey,
                  textColor: Theme.of(context).accentColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                      buttonColor: Theme.of(context).accentColor,
                      buttonTheme: ButtonThemeData(
                        textTheme: ButtonTextTheme.accent,
                        shape: StadiumBorder(),
                      )),
                  child: RaisedButton(
                    child: Text('Button1'),
                    onPressed: () {},
                    elevation: 8,
                    splashColor: Colors.grey,
                    // textColor: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  width: 32,
                ),
                RaisedButton.icon(
                  icon: Icon(Icons.home),
                  label: Text('Button2'),
                  elevation: 8,
                  onPressed: () {},
                  splashColor: Colors.grey,
                  textColor: Theme.of(context).accentColor,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                      buttonColor: Theme.of(context).accentColor,
                      buttonTheme: ButtonThemeData(
                        textTheme: ButtonTextTheme.accent,
                        shape: StadiumBorder(),
                      )),
                  child: OutlineButton(
                    child: Text('Button1'),
                    onPressed: () {},
                    splashColor: Colors.grey[200],
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 3,
                    ),
                    highlightedBorderColor: Colors.grey,
                    textColor: Colors.black,
                    // textColor: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  width: 32,
                ),
                OutlineButton.icon(
                  icon: Icon(Icons.home),
                  label: Text('Button2'),
                  onPressed: () {},
                  splashColor: Colors.grey,
                  textColor: Theme.of(context).accentColor,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                      buttonColor: Theme.of(context).accentColor,
                      buttonTheme: ButtonThemeData(
                        textTheme: ButtonTextTheme.accent,
                        shape: StadiumBorder(),
                      )),
                  child: OutlineButton(
                    child: Text('Button3'),
                    onPressed: () {},
                    splashColor: Colors.grey[200],
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 3,
                    ),
                    highlightedBorderColor: Colors.grey,
                    textColor: Colors.black,
                    // textColor: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  width: 32,
                ),
                Container(
                  width: 150,
                  child: OutlineButton.icon(
                    icon: Icon(Icons.home),
                    label: Text('Button4'),
                    onPressed: () {},
                    splashColor: Colors.grey,
                    textColor: Theme.of(context).accentColor,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: OutlineButton.icon(
                    icon: Icon(Icons.home),
                    label: Text('Button5'),
                    onPressed: () {},
                    splashColor: Colors.grey,
                    textColor: Theme.of(context).accentColor,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  flex: 3,
                  child: OutlineButton.icon(
                    icon: Icon(Icons.home),
                    label: Text('Button6'),
                    onPressed: () {},
                    splashColor: Colors.grey,
                    textColor: Theme.of(context).accentColor,
                    color: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                    buttonTheme: ButtonThemeData(
                      padding: EdgeInsets.symmetric(horizontal: 10)
                    )
                  ),
                  child: ButtonBar(
                    children: <Widget>[
                      OutlineButton.icon(
                        icon: Icon(Icons.home),
                        label: Text('Button7'),
                        onPressed: () {},
                        splashColor: Colors.grey,
                        textColor: Theme.of(context).accentColor,
                        color: Theme.of(context).primaryColor,
                      ),
                      OutlineButton.icon(
                        icon: Icon(Icons.home),
                        label: Text('Button8'),
                        onPressed: () {},
                        splashColor: Colors.grey,
                        textColor: Theme.of(context).accentColor,
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _WidegetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 3,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }
}

class FloatingBotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      elevation: 5,
      // backgroundColor: Colors.lightBlue,
      // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );

    final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
      onPressed: () {},
      icon: Icon(Icons.add),
      label: Text('添加'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingBotton'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: _floatingActionButtonExtended,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.purpleAccent,
          height: 50,
        ),
        // shape:CircularNotchedRectangle(),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$title',
      ),
      leading: Icon(Icons.menu),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return page;
        }));
      },
    );
  }
}
