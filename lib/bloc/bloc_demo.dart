import 'package:demo001/bloc/bloc_widget.dart';
import 'package:flutter/material.dart';

class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CouterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bloc demo'),
        ),
        body: BlocHome(),
        floatingActionButton: BlocButton(),
      ),
    );
  }
}
