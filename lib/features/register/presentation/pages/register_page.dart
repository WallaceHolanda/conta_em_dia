import 'package:conta_em_dia/core/navigation/app_navigator.dart';
import 'package:conta_em_dia/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/design_system/design_system.dart';
import '../cubit/register_cubit.dart';
import '../cubit/register_state.dart';

import '../widgets/register_footer_widget.dart';
import '../widgets/register_header_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterCubit, RegisterState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if (state is RegisterSuccess) {
            AppSnackBar.show(
              context,
              message: 'Usuário cadastrado com sucesso!',
              type: AppSnackBarType.success,
            );
            AppNavigator.goToLogin(context);
          } else if (state is RegisterFailure) {
            AppSnackBar.show(
              context,
              message: 'Ocorreu um erro ao realizar o cadastro.',
              type: AppSnackBarType.error,
            );
          }
        },
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 48,
              ),
              sliver: SliverFillRemaining(
                hasScrollBody: false,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RegisterHeaderWidget(),
                      const SizedBox(height: 24),
                      DsTextFormField(
                        labelText: 'Nome completo',
                        validator: Validators.name,
                        controller: _nameController,
                        keyboardType: TextInputType.name,
                      ),
                      const SizedBox(height: 24),
                      DsTextFormField(
                        labelText: 'E-mail',
                        validator: Validators.email,
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 24),
                      DsTextFormField(
                        obscureText: true,
                        labelText: 'Senha',
                        validator: Validators.password,
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 24),
                      DsTextFormField(
                        obscureText: true,
                        labelText: 'Confirmar senha',
                        keyboardType: TextInputType.visiblePassword,
                        validator: (v) => Validators.confirmPassword(
                          v,
                          _passwordController.text,
                        ),
                        controller: _confirmController,
                      ),
                      const SizedBox(height: 48),
                      DsPrimaryButton(
                        text: 'Cadastrar',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<RegisterCubit>().register(
                              _nameController.text,
                              _emailController.text,
                              _passwordController.text,
                            );
                          }
                        },
                      ),
                      const Spacer(),
                      RegisterFooterWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
