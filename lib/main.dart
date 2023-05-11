import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nabu/generated/l10n.dart';
import 'package:nabu/themes/blue_light_theme.dart';
import 'package:nabu/widgets/task_dialog.dart';
import 'package:nabu/widgets/tasks_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://kdrpjedfdzpoishqxvdx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtkcnBqZWRmZHpwb2lzaHF4dmR4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODMzNzU0OTQsImV4cCI6MTk5ODk1MTQ5NH0.5ZHnscIuOAN3bKQwCmFMQIEc__bmp_sU42kfdWPijCU',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Nabu",
      theme: BlueLightTheme.light,
      darkTheme: BlueLightTheme.dark,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const MyHomePage(title: 'Nabu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(child: TasksView()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return TaskDialog();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
