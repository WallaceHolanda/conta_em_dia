import '../../../common/models/card/card_account_model.dart';
import '../../../common/models/expense/expense_model.dart';
import '../../domain/entities/home_data_entity.dart';

class HomeModel extends HomeDataEntity {
  HomeModel({
    required super.userName,
    required super.totalExpenses,
    required super.month,
    required super.cards,
    required super.expenses,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      userName: json['user_name'],
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
