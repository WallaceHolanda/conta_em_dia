import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection.dart';
import '../../presentation/pages/register_card_page.dart';
import '../cubit/register_card_cubit.dart';

class RegisterCardRoute extends StatelessWidget {
  const RegisterCardRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCardCubit>(
      create: (_) => getIt<RegisterCardCubit>(),
      child: const RegisterCardPage(),
    );
  }
}
