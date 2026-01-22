import '../../../common/entities/card/card_account_entity.dart';
import '../../../common/entities/expense/expense_entity.dart';

class HomeDataEntity {
  final String userName;
  final double totalExpenses;
  final String month;
  final List<CardAccountEntity> cards;
  final List<ExpenseEntity> expenses;

  HomeDataEntity({
    required this.userName,
    required this.totalExpenses,
    required this.month,
    required this.cards,
    required this.expenses,
  });
}
