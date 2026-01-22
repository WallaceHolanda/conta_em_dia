import 'package:injectable/injectable.dart';
import '../../../common/models/card/card.dart';
import '../../../common/models/expense/expense_category_model.dart';
import 'register_expense_datasource.dart';

@LazySingleton(as: RegisterExpenseDataSource, env: ['mock'])
class RegisterExpenseMockDataSource implements RegisterExpenseDataSource {
  @override
  Future<List<CardAccountModel>> getCards() async {
    return [
      CardAccountModel(
        id: 'c1',
        bank: CardBankModel(
          id: 'b1',
          name: 'Caju',
          asset: 'caju',
        ),
        type: CardTypeModel(
          id: 't3',
          name: 'VR/VA',
        ),
        cardNetwork: CardNetworkModel(
          id: 'cn1',
          name: 'Visa',
          asset: 'visa',
        ),
      ),
      CardAccountModel(
        id: 'c2',
        bank: CardBankModel(
          id: 'b1',
          name: 'NuBank',
          asset: 'nubank',
        ),
        type: CardTypeModel(
          id: 't1',
          name: 'Crédito',
        ),
        cardNetwork: CardNetworkModel(
          id: 'cn1',
          name: 'Visa',
          asset: 'visa',
        ),
      ),
    ];
  }

  @override
  Future<List<ExpenseCategoryModel>> getCategories() async {
    return [
      ExpenseCategoryModel(
        id: "cat_1",
        name: "Alimentação",
      ),
      ExpenseCategoryModel(
        id: "cat_2",
        name: "Refeição",
      ),
      ExpenseCategoryModel(
        id: "cat_3",
        name: "Saúde",
      ),
      ExpenseCategoryModel(
        id: "cat_4",
        name: "Transporte",
      ),
      ExpenseCategoryModel(
        id: "cat_5",
        name: "Outros",
      ),
    ];
  }

  @override
  Future<void> registerExpense(
    double amount,
    String description,
    String categoryId,
    DateTime date,
    String cardId,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    return;
  }
}
