import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'AppLocalizations.dart';

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalizations> load(Locale locale) {
    return new SynchronousFuture<DemoLocalizations>(
        new DemoLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<DemoLocalizations> old) {
    return false;
  }

  static DemoLocalizationsDelegate delegate = const DemoLocalizationsDelegate();
}
