import 'dart:async';

import 'package:flutter/material.dart';

class BlocHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CouterProvider.of(context).bloc;

    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context, snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'),
            onPressed: () {
              _counterBloc.couter.add(1);
            },
          );
        },
      ),
    );
  }
}

class BlocButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CouterProvider.of(context).bloc;
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        _counterBloc.couter.add(1);
      },
    );
  }
}

class CouterProvider extends InheritedWidget {
  final Widget child;
  final CounterBloc bloc;

  CouterProvider({
    this.child,
    this.bloc,
  }) : super(child: child);

  static CouterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CouterProvider);

  @override
  bool updateShouldNotify(CouterProvider oldWidget) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;
  final _counterActionController = StreamController<int>();
  StreamSink<int> get couter => _counterActionController.sink;
  final _counteController = StreamController<int>();
  Stream<int> get count => _counteController.stream;
  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }
  void log() {
    print('Bloc');
  }

  void onData(int onData) {
    print('$onData');
    _count = _count + onData;
    _counteController.add(_count);
  }

  @override
  void dispose() {
    _counterActionController.close();
    _counteController.close();
  }
}
