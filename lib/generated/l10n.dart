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

  /// `No tasks to display`
  String get tasksViewNoTasksToDisplay {
    return Intl.message(
      'No tasks to display',
      name: 'tasksViewNoTasksToDisplay',
      desc: 'Text shown when no tasks to display in TasksView',
      args: [],
    );
  }

  /// `New Task`
  String get taskDialogTitle {
    return Intl.message(
      'New Task',
      name: 'taskDialogTitle',
      desc: 'Text shown to creater a new task in TaskDialog',
      args: [],
    );
  }

  /// `Title`
  String get taskDialogInputTitle {
    return Intl.message(
      'Title',
      name: 'taskDialogInputTitle',
      desc: 'Text shown on title field in TaskDialog',
      args: [],
    );
  }

  /// `Description`
  String get taskDialogInputDescription {
    return Intl.message(
      'Description',
      name: 'taskDialogInputDescription',
      desc: 'Text shown on description field in TaskDialog',
      args: [],
    );
  }

  /// `Cancel`
  String get taskDialogCancelButton {
    return Intl.message(
      'Cancel',
      name: 'taskDialogCancelButton',
      desc: 'Text shown on cancel button in TaskDialog',
      args: [],
    );
  }

  /// `Save`
  String get taskDialogSaveButton {
    return Intl.message(
      'Save',
      name: 'taskDialogSaveButton',
      desc: 'Text shown on save button in TaskDialog',
      args: [],
    );
  }

  /// `No tasks yet. Click + to add a new one.`
  String get noTasksYet {
    return Intl.message(
      'No tasks yet. Click + to add a new one.',
      name: 'noTasksYet',
      desc: 'Text shown when there are no tasks to display in HomeScreen',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
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