import 'package:conta_em_dia/core/assets/ds_images_enum.dart';
import 'package:conta_em_dia/core/design_system/buttons/ds_primary_button.dart';
import 'package:conta_em_dia/core/design_system/ds_image.dart';
import 'package:conta_em_dia/core/design_system/ds_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/design_system/ds_colors.dart';
import '../../../../core/design_system/typography/typography.dart';
import '../cubit/onboarding_cubit.dart';
import '../../../../core/navigation/app_navigator.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DsColors.transparent,
      body: Padding(
        padding: const .only(
          bottom: 80,
          left: 24,
          right: 24,
          top: 48,
        ),
        child: Column(
          children: [
            DsImage(
              width: 150,
              height: 25,
              path: DsImagesEnum.logo.path,
              color: DsColors.neutralWhite,
            ),

            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: Opacity(
                      opacity: 0.8,
                      child: Image.asset(
                        DsImagesEnum.onboardingImage.path,
                        width: 300,
                        height: 380,
                      ),
                    ),
                  ),

                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            DsColors.black.withValues(alpha: 0.1),
                            DsColors.black,
                          ],
                        ),
                      ),
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DsText(
                          DsStrings.onboardingTitle,
                          variant: DsTextVariant.h1,
                          textAlign: TextAlign.left,
                          color: DsColors.neutralWhite,
                        ),
                        const SizedBox(height: 8),
                        DsText(
                          DsStrings.onboardingSubTitle,
                          variant: DsTextVariant.h4,
                          textAlign: TextAlign.left,
                          color: DsColors.neutralWhite,
                        ),
                        const SizedBox(height: 40),
                        DsPrimaryButton(
                          text: DsStrings.start,
                          onPressed: () async {
                            final onboardingCubit =
                                BlocProvider.of<OnboardingCubit>(
                                  context,
                                  listen: false,
                                );
                            await onboardingCubit.setOnboardingSeen();
                            AppNavigator.goToLogin(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
