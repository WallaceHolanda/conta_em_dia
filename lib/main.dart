import 'package:flutter/material.dart';
import 'injection.dart';
import 'core/environment/app_environment.dart';
import 'core/navigation/app_router.dart';
import 'core/navigation/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(EnvironmentConfig.current.name);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conta em Dia',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.splash,
      routes: AppRouter.routes,
    );
  }
}
