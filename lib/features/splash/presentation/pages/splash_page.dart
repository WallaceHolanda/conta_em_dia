import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/splash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashRedirect?>(
      listener: (context, state) {
        if (state == SplashRedirect.login) {
          Navigator.pushReplacementNamed(context, '/login');
        } else if (state == SplashRedirect.onboarding) {
          Navigator.pushReplacementNamed(context, '/onboarding');
        }
      },
      child: Scaffold(body: Center(child: CircularProgressIndicator())),
    );
  }
}
