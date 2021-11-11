import 'package:asset_kktm/providers/asset_state.dart';
import 'package:asset_kktm/providers/auth_state.dart';
import 'package:asset_kktm/providers/dashboard_provider.dart';
import 'package:asset_kktm/screens/home_page.dart';
import 'package:asset_kktm/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DashboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AssetState(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthState(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light,
      ),
      home: LoginScreen(),
    );
  }
}
