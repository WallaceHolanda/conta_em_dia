import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../injection.dart';
import '../../presentation/pages/register_expense_page.dart';
import '../cubit/register_expense_cubit.dart';

class RegisterExpenseRoute extends StatelessWidget {
  const RegisterExpenseRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterExpenseCubit>(
      create: (_) => getIt<RegisterExpenseCubit>(),
      child: const RegisterExpensePage(),
    );
  }
}
