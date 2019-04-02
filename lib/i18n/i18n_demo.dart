import 'package:demo001/i18n/localization_demo.dart';
import 'package:flutter/material.dart';

class I18nDemo extends StatefulWidget {
  @override
  _I18nDemoState createState() => _I18nDemoState();
}

class _I18nDemoState extends State<I18nDemo> {
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('I18nDemo'),
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(locale.toString()),
              // Text(Localizations.of(context, LocalizationDemo).title,
              Text(LocalizationDemo.of(context).title,
              style: Theme.of(context).textTheme.title,),
            ],
          ),
        ));
  }
}
