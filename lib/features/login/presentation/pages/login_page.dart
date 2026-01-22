import 'package:conta_em_dia/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/assets/ds_images_enum.dart';
import '../../../../core/design_system/design_system.dart';
import '../../../../core/navigation/app_navigator.dart';
import '../cubit/login_cubit.dart';
import '../cubit/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if (state is LoginSuccess) {
            AppSnackBar.show(
              context,
              message: 'Usuário logado com sucesso.',
              type: AppSnackBarType.success,
            );
            AppNavigator.goToHome(context);
          } else if (state is LoginFailure) {
            AppSnackBar.show(
              context,
              message: 'Ocorreu um erro ao realizar o login.',
              type: AppSnackBarType.error,
            );
          }
        },
        child: Padding(
          padding: const .symmetric(horizontal: 24, vertical: 48),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DsImage(
                  height: 25,
                  width: 150,
                  path: DsImagesEnum.logo.path,
                ),
                SizedBox(height: 48),
                DsText(
                  DsStrings.loginText,
                  variant: DsTextVariant.h3,
                  textAlign: TextAlign.left,
                  color: DsColors.neutral60,
                ),
                SizedBox(height: 8),
                DsText(
                  DsStrings.loginSubText,
                  variant: DsTextVariant.body2,
                  textAlign: TextAlign.left,
                  color: DsColors.neutral60,
                ),
                SizedBox(height: 24),
                DsTextFormField(
                  labelText: 'E-mail',
                  validator: Validators.email,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 24),
                DsTextFormField(
                  obscureText: true,
                  labelText: 'Senha',
                  validator: Validators.password,
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 48),
                DsPrimaryButton(
                  text: DsStrings.enter,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await context.read<LoginCubit>().login(
                        _emailController.text,
                        _passwordController.text,
                      );
                    }
                  },
                ),
                Spacer(),
                Center(
                  child: DsText(
                    DsStrings.noAccount,
                    variant: DsTextVariant.body1,
                    textAlign: TextAlign.center,
                    color: DsColors.neutral60,
                  ),
                ),
                SizedBox(height: 24),
                DsSecondaryButton(
                  text: DsStrings.createAccount,
                  onPressed: () => AppNavigator.goToRegister(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
