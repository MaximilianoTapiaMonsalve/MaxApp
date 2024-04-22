import 'package:flutter/material.dart';
import 'package:maxapp/src/providers/providers.dart';
import 'package:maxapp/src/services/services.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FirebaseAuthProvider>(
          create: (_) => FirebaseAuthProvider(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: const AuthGate(),
      ),
    );
  }
}
