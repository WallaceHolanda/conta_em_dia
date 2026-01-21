import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection.dart';
import '../cubit/register_cubit.dart';
import '../pages/register_page.dart';

class RegisterRoute extends StatelessWidget {
  const RegisterRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (_) => getIt<RegisterCubit>(),
      child: const RegisterPage(),
    );
  }
}
