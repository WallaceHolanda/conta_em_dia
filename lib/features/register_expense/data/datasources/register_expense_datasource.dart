import '../../../common/models/card/card_account_model.dart';
import '../../../common/models/expense/expense_category_model.dart';

abstract class RegisterExpenseDataSource {
  Future<List<CardAccountModel>> getCards();

  Future<List<ExpenseCategoryModel>> getCategories();

  Future<void> registerExpense(
    double amount,
    String description,
    String categoryId,
    DateTime date,
    String cardId,
  );
}
