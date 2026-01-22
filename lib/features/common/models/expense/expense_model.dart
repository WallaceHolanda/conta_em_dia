import '../../entities/expense/expense_entity.dart';
import '../card/card_account_model.dart';
import 'expense_category_model.dart';

class ExpenseModel {
  final String id;
  final double amount;
  final String description;
  final ExpenseCategoryModel category;
  final DateTime date;
  final CardAccountModel card;

  ExpenseModel({
    required this.id,
    required this.amount,
    required this.description,
    required this.category,
    required this.date,
    required this.card,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      id: json['id'],
      description: json['details'],
      date: DateTime.parse(json['date']),
      amount: (json['amount'] as num).toDouble(),
      card: CardAccountModel.fromJson(json['card']),
      category: ExpenseCategoryModel.fromJson(json['category']),
    );
  }

  ExpenseEntity toEntity() {
    return ExpenseEntity(
      id: id,
      date: date,
      amount: amount,
      card: card.toEntity(),
      description: description,
      category: category.toEntity(),
    );
  }
}
