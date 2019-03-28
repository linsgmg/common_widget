import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = ['Apple', 'Banana', 'Lemon'];
  String _action = 'Nothing';
  List<String> _selects = [];
  String _choice='Lemon';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Wrap(
              spacing: 8,
              runSpacing: 0,
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                Chip(
                  label: Text('Life'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('lin sheng ming'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Text('Mir'),
                  ),
                ),
                Chip(
                  label: Text('lin sheng'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://img11.360buyimg.com/n1/s350x449_jfs/t1/22511/11/5772/280889/5c429e8fE22e172e5/e4790e6d6faa50b1.jpg!cc_350x449.jpg'),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.red,
                  deleteButtonTooltipMessage: 'delete this tag',
                ),
                Divider(
                  color: Colors.purple,
                  height: 20,
                  indent: 0,
                ),
                Wrap(
                  spacing: 8,
                  children: _tags.map((String tag) {
                    return Chip(
                      label: Text('$tag'),
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.purple,
                  height: 20,
                  indent: 0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('$_action'),
                ),
                Wrap(
                  spacing: 8,
                  children: _tags.map((String tag) {
                    return ActionChip(
                      label: Text('$tag'),
                      onPressed: () {
                        setState(() {
                          _action = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.purple,
                  height: 20,
                  indent: 0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('${_selects.toString()}'),
                ),
                Wrap(
                  spacing: 8,
                  children: _tags.map((String tag) {
                    return FilterChip(
                      label: Text('$tag'),
                      selected: _selects.contains(tag),
                      onSelected: (value) {
                        setState(() {
                          if (_selects.contains(tag)) {
                            _selects.remove(tag);
                          } else {
                            _selects.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.purple,
                  height: 20,
                  indent: 0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('${_choice}'),
                ),
                Wrap(
                  spacing: 8,
                  children: _tags.map((String tag) {
                    return ChoiceChip(
                      label: Text('$tag'),
                      selected: _choice==tag,
                      onSelected: (value) {
                        setState(() {
                          _choice=tag;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = ['Apple', 'Banana', 'Lemon'];
            _selects = [];
            _choice='Lemon';
          });
        },
      ),
    );
  }
}
