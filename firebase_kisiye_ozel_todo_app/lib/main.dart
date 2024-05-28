import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_kisiye_ozel_todo_app/constant/providers.dart';
import 'package:firebase_kisiye_ozel_todo_app/firebase_options.dart';
import 'package:firebase_kisiye_ozel_todo_app/views/auth/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: Providers.getProviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Reddit Mono"),
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
    );
  }
}
