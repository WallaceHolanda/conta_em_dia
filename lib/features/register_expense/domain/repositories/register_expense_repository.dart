import 'package:conta_em_dia/features/common/entities/card/card_account_entity.dart';
import 'package:conta_em_dia/features/common/entities/expense/expense_category_entity.dart';

abstract class RegisterExpenseRepository {
  Future<List<CardAccountEntity>> getCards();

  Future<List<ExpenseCategoryEntity>> getCategories();

  Future<void> registerExpense(
    double amount,
    String description,
    String categoryId,
    DateTime date,
    String cardId,
  );
}
