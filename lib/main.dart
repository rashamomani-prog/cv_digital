import 'package:cv_digital/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Digital CV',
            themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.blueGrey,
              scaffoldBackgroundColor: Colors.grey[100],
              cardColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.blueGrey,
              scaffoldBackgroundColor: Colors.grey[900],
              cardColor: Colors.grey[800],
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
              ),
            ),
            home: const Scaffold(
              body: Center(
                child: Text('Firebase Initialized with ThemeProvider!'),
              ),
            ),
          );
        },
      ),
    );
  }
}
