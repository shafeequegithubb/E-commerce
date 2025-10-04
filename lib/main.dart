import 'package:ecommerce_spinecode/feature/auth/data/repositories/repositories.dart';
import 'package:ecommerce_spinecode/feature/products/domain/api_services/api_services.dart';
import 'package:ecommerce_spinecode/feature/products/presentation/screens/splash_screen.dart';
import 'package:ecommerce_spinecode/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginServices()),
        ChangeNotifierProvider(create: (context) => ApiServices()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
