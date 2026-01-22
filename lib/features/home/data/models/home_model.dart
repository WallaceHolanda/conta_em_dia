import '../../../common/models/expense/expense_category_model.dart';
import '../../domain/entities/home_data.dart';
import '../../../common/models/card/card.dart';
import '../../../common/models/expense/expense_model.dart';

class HomeModel extends HomeData {
  HomeModel({
    required super.totalExpenses,
    required super.month,
    required super.cards,
    required super.expenses,
  });

  factory HomeModel.mock() {
    final cards = [
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

    final expenses = [
      ExpenseModel(
        id: 'e1',
        description: 'Mercadinho',
        category: ExpenseCategoryModel(
          id: 'cat1',
          name: 'Alimentação',
        ),
        date: DateTime.now().subtract(Duration(days: 1)),
        amount: 400.0,
        card: cards[0],
      ),
      ExpenseModel(
        id: 'e1',
        description: 'Restaurante',
        category: ExpenseCategoryModel(
          id: 'cat2',
          name: 'Refeição',
        ),
        date: DateTime.now().subtract(Duration(days: 2)),
        amount: 100.0,
        card: cards[1],
      ),
      ExpenseModel(
        id: 'e1',
        description: 'Mercadinho',
        category: ExpenseCategoryModel(
          id: 'cat1',
          name: 'Alimentação',
        ),
        date: DateTime.now().subtract(Duration(days: 3)),
        amount: 200.0,
        card: cards[0],
      ),
    ];

    return HomeModel(
      totalExpenses: 1000.0,
      month: 'Janeiro',
      cards: cards.map((card) => card.toEntity()).toList(),
      expenses: expenses.map((expense) => expense.toEntity()).toList(),
    );
  }
}
