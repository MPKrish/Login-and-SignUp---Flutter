import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_page.dart';
import 'package:firebase_core/firebase_core.dart';  // Import Firebase core
import 'firebase_options.dart';  // Import your Firebase options
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // Ensure bindings are initialized

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const InitialScreen());
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
      title: appName,
      debugShowCheckedModeBanner: false,
    );
  }
}
