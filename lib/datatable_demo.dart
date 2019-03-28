import 'package:flutter/material.dart';
import 'person.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(0),
        child: ListView(
          children: <Widget>[
            DataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              // onSelectAll: (bool value){},
              columns: [
                DataColumn(
                    label: Text('title'),
                    onSort: (int index, bool ascending) {
                      setState(() {
                        _sortColumnIndex = index;
                        _sortAscending = ascending;
                        persons.sort((a, b) {
                          if (!ascending) {
                            final c = a;
                            a = b;
                            b = c;
                          }
                          return a.title.length.compareTo(b.title.length);
                        });
                      });
                    }),
                DataColumn(
                    label: Text('author'),
                    // onSort: (int index, bool ascending) {
                    //   setState(() {
                    //     _sortColumnIndex = index;
                    //     _sortAscending = ascending;
                    //   });
                    // }
                    ),
                DataColumn(
                    label: Text('picture'),
                    // onSort: (int index, bool ascending) {
                    //   setState(() {
                    //     _sortColumnIndex = index;
                    //     _sortAscending = ascending;
                    //   });
                    // }
                    ),
              ],
              // rows: [
              //   DataRow(
              //     cells: [
              //       DataCell(
              //         Text('dargon1'),
              //       ),
              //       DataCell(
              //         Text('lin1'),
              //       ),
              //     ],
              //   ),
              //   DataRow(
              //     cells: [
              //       DataCell(
              //         Text('dargon2'),
              //       ),
              //       DataCell(
              //         Text('lin2'),
              //       ),
              //     ],
              //   ),
              //   DataRow(
              //     cells: [
              //       DataCell(
              //         Text('dargon3'),
              //       ),
              //       DataCell(
              //         Text('lin3'),
              //       ),
              //     ],
              //   ),
              // ],
              rows: persons.map((person) {
                return DataRow(
                  selected: person.selected,
                  onSelectChanged: (bool value){
                    setState(() {
                      if(person.selected!=value){
                        person.selected=value;
                      }else{
                        person.selected=!value;
                      }
                    });
                  },
                  cells: [
                  DataCell(Text(person.title)),
                  DataCell(Text(person.name)),
                  DataCell(SizedBox(
                    width: 100,
                    child: Image.network(
                      person.url,
                      fit: BoxFit.cover,
                    ),
                  )),
                ]);
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
