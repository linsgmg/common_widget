import 'package:intl/intl.dart';

class Welcome {
  String get title=>Intl.message(
    'hello',
    name:'title',
    desc:'demo title'
  );
  String greet(String name)=>Intl.message(
    'hello $name',
    name:'title',
    desc:'demo title',
    args: [name]
  );
  
}