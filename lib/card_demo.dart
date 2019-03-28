import 'package:flutter/material.dart';
import 'person.dart';

class CardDemo extends StatefulWidget {
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card demo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: persons.map((Person person) {
            return Card(
              child: Column(
                children: <Widget>[
                  AspectRatio(
                      aspectRatio: 16 / 9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        child: Image.network(
                          person.url,
                          fit: BoxFit.cover,
                        ),
                      )),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(person.url),
                    ),
                    title: Text(person.title),
                    subtitle: Text(person.name),
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      person.descripe,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ButtonTheme.bar(
                    child: ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: Text('like'.toUpperCase()),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text('read'.toUpperCase()),
                          onPressed: () {},
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
