import 'package:conta_em_dia/core/design_system/ds_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/assets/images_enum.dart';
import '../../../../core/design_system/ds_image.dart';
import '../cubit/splash_cubit.dart';
import '../cubit/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashToLogin) {
          Navigator.pushReplacementNamed(context, '/login');
        }

        if (state is SplashToOnboarding) {
          Navigator.pushReplacementNamed(context, '/onboarding');
        }
      },
      child: Scaffold(
        backgroundColor: DsColors.primary,
        body: Center(
          child: DsImage(
            height: 66,
            width: 180,
            path: ImagesEnum.logoAlt.path,
          ),
        ),
      ),
    );
  }
}
