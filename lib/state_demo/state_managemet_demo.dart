import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

// class StateManagementDemo extends StatefulWidget {
//   @override
//   _StateManagementDemoState createState() => _StateManagementDemoState();
// }

// class _StateManagementDemoState extends State<StateManagementDemo> {
//   int _count = 0;
//   void _increaseCount() {
//     setState(() {
//       _count += 1;
//       debugPrint('$_count');
//     });
//   }

class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      // child: CounterProvider(
        
        model: CounterModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('state management demo'),
          ),
          body: Counter(),
          floatingActionButton: ScopedModelDescendant<CounterModel>(
            rebuildOnChange: false,
            builder: (context, _, model) => FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: model.increaseCount,
                ),
          ),
        ),
      // ),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final int count = CounterProvider.of(context).count;
    // final VoidCallback increateCount =
    //     CounterProvider.of(context).increaseCount;

    return Center(
        child: ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) => ActionChip(
            label: Text('${model.count}'),
            onPressed: model.increaseCount,
          ),
    ));
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  final Widget child;

  CounterProvider({this.count, this.increaseCount, this.child})
      : super(child: child);

  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }
}

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void increaseCount() {
    _count += 1;
    notifyListeners();
  }
}
