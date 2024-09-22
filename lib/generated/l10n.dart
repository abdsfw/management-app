// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Management App`
  String get management_app {
    return Intl.message(
      'Management App',
      name: 'management_app',
      desc: '',
      args: [],
    );
  }

  /// `change language`
  String get change_language {
    return Intl.message(
      'change language',
      name: 'change_language',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `no product yet`
  String get no_product_yet {
    return Intl.message(
      'no product yet',
      name: 'no_product_yet',
      desc: '',
      args: [],
    );
  }

  /// `no category yet`
  String get no_category_yet {
    return Intl.message(
      'no category yet',
      name: 'no_category_yet',
      desc: '',
      args: [],
    );
  }

  /// `name of product`
  String get name_of_product {
    return Intl.message(
      'name of product',
      name: 'name_of_product',
      desc: '',
      args: [],
    );
  }

  /// `name of category`
  String get name_of_category {
    return Intl.message(
      'name of category',
      name: 'name_of_category',
      desc: '',
      args: [],
    );
  }

  /// `price of buy`
  String get price_of_buy {
    return Intl.message(
      'price of buy',
      name: 'price_of_buy',
      desc: '',
      args: [],
    );
  }

  /// `price of sell`
  String get price_of_sell {
    return Intl.message(
      'price of sell',
      name: 'price_of_sell',
      desc: '',
      args: [],
    );
  }

  /// `quantity`
  String get quantity {
    return Intl.message(
      'quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `old quantity`
  String get old_quantity {
    return Intl.message(
      'old quantity',
      name: 'old_quantity',
      desc: '',
      args: [],
    );
  }

  /// `enter`
  String get enter {
    return Intl.message(
      'enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `cancel`
  String get cancel {
    return Intl.message(
      'cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `add product`
  String get add_product {
    return Intl.message(
      'add product',
      name: 'add_product',
      desc: '',
      args: [],
    );
  }

  /// `add category`
  String get add_category {
    return Intl.message(
      'add category',
      name: 'add_category',
      desc: '',
      args: [],
    );
  }

  /// `item of product`
  String get item_of_product {
    return Intl.message(
      'item of product',
      name: 'item_of_product',
      desc: '',
      args: [],
    );
  }

  /// `add`
  String get add {
    return Intl.message(
      'add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `minus`
  String get minus {
    return Intl.message(
      'minus',
      name: 'minus',
      desc: '',
      args: [],
    );
  }

  /// `save`
  String get save {
    return Intl.message(
      'save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `are you sure to delete this item?`
  String get delete_item_question {
    return Intl.message(
      'are you sure to delete this item?',
      name: 'delete_item_question',
      desc: '',
      args: [],
    );
  }

  /// `delete`
  String get delete {
    return Intl.message(
      'delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `ok`
  String get ok {
    return Intl.message(
      'ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `all Item`
  String get all_item {
    return Intl.message(
      'all Item',
      name: 'all_item',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
