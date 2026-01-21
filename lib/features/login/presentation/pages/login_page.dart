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
        listener: (context, state) {
          if (state is LoginSuccess) {
            // TODO: Adicionar navegação para home
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<LoginCubit>().login(
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
