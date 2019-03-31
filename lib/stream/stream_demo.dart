import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatefulWidget {
  @override
  _StreamDemoState createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  StreamSubscription _streamSubScription;
  StreamController<String> _streamDemo;
  StreamSink _streamSink;
  String _data = '...';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Create a stream');
    // Stream<String> _streamDemo = Stream.fromFuture(getData());
    _streamDemo = StreamController.broadcast();
    _streamSink = _streamDemo.sink;
    _streamSubScription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    _streamSubScription =
        _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);
    print('Initialize completed.');
  }

  void onData(String data) {
    setState(() {
      _data = data;
    });
    print('$data');
  }

  void onDataTwo(String data) {
    print('onDataTwo:$data');
  }

  void onError(error) {
    print('$error');
  }

  void onDone() {
    print('Done');
  }

  void _pause() {
    print('pause subscription');
    _streamSubScription.pause();
  }

  void _resume() {
    print('resume subscription');
    _streamSubScription.resume();
  }

  void _cancel() {
    print('cancel subscription');
    _streamSubScription.cancel();
  }

  void _add() async {
    print('add data to stream');
    String data = await getData();
    // _streamDemo.add(data);
    _streamSink.add(data);
  }

  Future<String> getData() async {
    await Future.delayed(Duration(seconds: 2));
    // throw 'something is weong!';
    return 'hello -------';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stream demo'),
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('pause'),
                  onPressed: _pause,
                ),
                FlatButton(
                  child: Text('resume'),
                  onPressed: _resume,
                ),
                FlatButton(
                  child: Text('cancel'),
                  onPressed: _cancel,
                ),
                FlatButton(
                  child: Text('add'),
                  onPressed: _add,
                ),
              ],
            ),
            // Text('$_data'),
            StreamBuilder(
              stream: _streamDemo.stream,
              initialData: '...',
              builder: (context,snapshot){
                return Text('${snapshot.data}');
              },
            )
          ],
        ));
  }
}

