import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

// NOTE: To connect Firebase, uncomment below after running
// `flutterfire configure` and adding firebase_options.dart
//
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ZelqoApp());
}

class ZelqoApp extends StatelessWidget {
  const ZelqoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zelqo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF1D9E75), // Zelqo green accent
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: const WelcomeScreen(),
    );
  }
}
