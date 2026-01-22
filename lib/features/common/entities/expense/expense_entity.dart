import 'package:conta_em_dia/features/common/entities/expense/expense_category_entity.dart';

import '../card/card_account_entity.dart';

class ExpenseEntity {
  final String id;
  final double amount;
  final String description;
  final ExpenseCategoryEntity category;
  final DateTime date;
  final CardAccountEntity card;

  ExpenseEntity({
    required this.id,
    required this.amount,
    required this.description,
    required this.category,
    required this.date,
    required this.card,
  });
}
