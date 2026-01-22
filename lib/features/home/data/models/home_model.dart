import '../../../common/models/card/card_account_model.dart';
import '../../../common/models/expense/expense_model.dart';
import '../../domain/entities/home_data.dart';

class HomeModel extends HomeData {
  HomeModel({
    required super.totalExpenses,
    required super.month,
    required super.cards,
    required super.expenses,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      totalExpenses: json['totalExpenses'],
      month: json['month'],
      cards: (json['cards'] as List)
          .map((cardJson) => CardAccountModel.fromJson(cardJson).toEntity())
          .toList(),
      expenses: (json['expenses'] as List)
          .map((expenseJson) => ExpenseModel.fromJson(expenseJson).toEntity())
          .toList(),
    );
  }
}
