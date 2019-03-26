import 'package:flutter/material.dart';

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
          ListItem(title: 'FloatingBotton', page: FloatingBotton())
        ],
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
      elevation: 0,
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
        child:Container(
          color: Colors.purpleAccent,
          height: 60,
        ),
        shape:CircularNotchedRectangle(),
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
