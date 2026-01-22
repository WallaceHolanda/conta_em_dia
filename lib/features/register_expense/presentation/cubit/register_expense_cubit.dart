import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import '../../domain/repositories/register_expense_repository.dart';
import 'register_expense_state.dart';

@injectable
class RegisterExpenseCubit extends Cubit<RegisterExpenseState> {
  final RegisterExpenseRepository repository;

  RegisterExpenseCubit(this.repository) : super(RegisterExpenseState.initial());

  Future<void> load() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));

    try {
      final cards = await repository.getCards();
      final categories = await repository.getCategories();

      debugPrint('Cards : ${cards.toString()}');

      emit(
        state.copyWith(
          loadStatus: LoadStatus.success,
          cards: cards,
          categories: categories,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          loadStatus: LoadStatus.failure,
          errorMessage: 'Erro ao carregar dados',
        ),
      );
    }
  }

  Future<void> registerExpense(
    double amount,
    String description,
    String categoryId,
    DateTime date,
    String cardId,
  ) async {
    emit(state.copyWith(submitStatus: SubmitStatus.loading));

    try {
      await repository.registerExpense(
        amount,
        description,
        categoryId,
        date,
        cardId,
      );

      emit(state.copyWith(submitStatus: SubmitStatus.success));
    } catch (_) {
      emit(
        state.copyWith(
          submitStatus: SubmitStatus.failure,
          errorMessage: 'Erro ao cadastrar despesa',
        ),
      );
    }
  }

  void resetSubmitStatus() {
    emit(state.copyWith(submitStatus: SubmitStatus.idle));
  }
}
