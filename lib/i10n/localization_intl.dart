// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class IntlLocalizations {
//   static Future<IntlLocalizations> load(Locale locale) {
//     final String name = locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
//     final String localeName = Intl.canonicalizedLocale(name);
//     print("name：$localeName");
//     print(locale.countryCode);
//     return initializeMessages(localeName).then((b) {
//       Intl.defaultLocale = localeName;
//       return  IntlLocalizations();
//     });
//   }

//   static IntlLocalizations? of(BuildContext context) {
//     return Localizations.of<IntlLocalizations>(context, IntlLocalizations);
//   }

//   String get appName{
//     return Intl.message("One Day List",name: "appName",desc: "অ্যাপ্লিকেশন নাম");
//   }

// }

// class DemoLocalizationsDelegate extends LocalizationsDelegate<IntlLocalizations> {
//   const DemoLocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) => ['bn', 'us'].contains(locale.languageCode);

//   @override
//   Future<IntlLocalizations> load(Locale locale) {
//     return IntlLocalizations.load(locale);
//   }

//   @override
//   bool shouldReload(covariant DemoLocalizationsDelegate old) => false;
// }