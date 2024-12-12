// lib/l10n/app_localizations.dart
import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'food': 'Food',
      'drinks': 'Drinks',
      'desserts': 'Desserts',
      'coffee': 'Coffee',
      'kebab': 'Kebab',
      'kebabDesc': 'Traditional Turkish kebab with rice and salad',
      'pide': 'Pide',
      'pideDesc': 'Turkish pizza with various toppings',
      'ayran': 'Ayran',
      'ayranDesc': 'Traditional Turkish yogurt drink',
      'cola': 'Cola',
      'colaDesc': 'Refreshing cola drink',
    },
    'tr': {
      'food': 'Yemekler',
      'drinks': 'İçecekler',
      'desserts': 'Tatlılar',
      'coffee': 'Kahve',
      'kebab': 'Kebap',
      'kebabDesc': 'Pilav ve salata ile geleneksel Türk kebabı',
      'pide': 'Pide',
      'pideDesc': 'Çeşitli malzemeli Türk pidesi',
      'ayran': 'Ayran',
      'ayranDesc': 'Geleneksel Türk yoğurt içeceği',
      'cola': 'Kola',
      'colaDesc': 'Serinletici kola içeceği',
    },
  };

  String get food => _localizedValues[locale.languageCode]!['food']!;
  String get drinks => _localizedValues[locale.languageCode]!['drinks']!;
  String get desserts => _localizedValues[locale.languageCode]!['desserts']!;
  String get coffee => _localizedValues[locale.languageCode]!['coffee']!;
  String get kebab => _localizedValues[locale.languageCode]!['kebab']!;
  String get kebabDesc => _localizedValues[locale.languageCode]!['kebabDesc']!;
  String get pide => _localizedValues[locale.languageCode]!['pide']!;
  String get pideDesc => _localizedValues[locale.languageCode]!['pideDesc']!;
  String get ayran => _localizedValues[locale.languageCode]!['ayran']!;
  String get ayranDesc => _localizedValues[locale.languageCode]!['ayranDesc']!;
  String get cola => _localizedValues[locale.languageCode]!['cola']!;
  String get colaDesc => _localizedValues[locale.languageCode]!['colaDesc']!;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'tr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}