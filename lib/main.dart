import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var data = [
    {'index': 10, 'name': 'flutter'},
    {'index': 6, 'name': 'dart'},
    {'index': 87, 'name': 'javascript'},
    {'index': 24, 'name': 'react'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Data Table Part 2'),
        ),
        body: Center(
          child: DataTable(
            sortColumnIndex: 0,
            sortAscending: true,
            columns: <DataColumn>[
              DataColumn(
                label: Text('Index'),
                onSort: (i, b) {
                  setState(() {
                    data.sort((a, b) {
                      print('$a $b');
                      return (a['index'] as int).compareTo((b['index'] as int));
                    });
                  });
                },
              ),
              DataColumn(label: Text('Name')),
            ],
            rows: data
                .map(
                  (e) => DataRow(cells: [
                    DataCell(Text('${e['index']}')),
                    DataCell(Text('${e['name']}')),
                  ]),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
