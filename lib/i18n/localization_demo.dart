import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class LocalizationDemo {
  final Locale locale;
  LocalizationDemo(this.locale);

  static LocalizationDemo of(BuildContext context) {
    return Localizations.of<LocalizationDemo>(context, LocalizationDemo);
  }

  static Map<String, Map<String, String>> _locale = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': '您好',
    },
  };

  String get title {
    return _locale[locale.languageCode]['title'];
  }
}

class LocalizationDemoDelegate extends LocalizationsDelegate<LocalizationDemo> {
  LocalizationDemoDelegate();

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return true;
  }

  @override
  Future<LocalizationDemo> load(Locale locale) {
    // TODO: implement load
    return SynchronousFuture<LocalizationDemo>(LocalizationDemo(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocalizationDemo> old) {
    // TODO: implement shouldReload
    return false;
  }
}
