import 'package:flutter/material.dart';
import 'person.dart';

class PersionDataSource extends DataTableSource {
  int _selectedCount = 0;

  @override
  // TODO: implement rowCount
  int get rowCount => persons.length;

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(int index) {
    // TODO: implement getRow
    final Person person = persons[index];
    return DataRow.byIndex(index: index, cells: [
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
  }

  void _sort(getLength(persion), bool ascending) {
    persons.sort((a, b) {
      if (!ascending) {
        final c = a;
        a = b;
        b = c;
      }
      final aValue = getLength(a);
      final bValue = getLength(b);

      return Comparable.compare(aValue, bValue);
    });

    notifyListeners();
  }
}

class PageDataTableDemo extends StatefulWidget {
  @override
  _PageDataTableDemoState createState() => _PageDataTableDemoState();
}

class _PageDataTableDemoState extends State<PageDataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  final PersionDataSource _persionDataSource = PersionDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageDataTableDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              header: Text('Persion'),
              rowsPerPage: 5,
              source: _persionDataSource,
              columns: [
                DataColumn(
                    label: Text('title'),
                    onSort: (int index, bool ascending) {
                      setState(() {
                        _persionDataSource._sort(
                            (person) => person.title.length, ascending);
                        _sortColumnIndex = index;
                        _sortAscending = ascending;
                      });
                    }),
                DataColumn(
                  label: Text('author'),
                ),
                DataColumn(
                  label: Text('picture'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
