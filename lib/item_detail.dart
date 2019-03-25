import 'package:flutter/material.dart';
import 'person.dart';

class ShowDetailDemo extends StatelessWidget {
  final Person person;

  ShowDetailDemo({Key key, this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${person.name}'),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Image.network(
            person.url,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(32),
            child: Column(
              children: <Widget>[
                Text('${person.name}', style: Theme.of(context).textTheme.title),
                Text('${person.title}', style: Theme.of(context).textTheme.subtitle),
                SizedBox(height: 32,),
                Text('${person.descripe}')
              ],
            ),
          )
        ],
      ),
    );
  }
}
