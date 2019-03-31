import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http demo'),
      ),
      body: HoemDemo(),
    );
  }
}

class HoemDemo extends StatefulWidget {
  @override
  _HoemDemoState createState() => _HoemDemoState();
}

class _HoemDemoState extends State<HoemDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    final respone =
        await http.get('https://resources.ninghao.net/demo/posts.json');
    print('statusCode:${respone.statusCode}');
    print('contents:${respone.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
