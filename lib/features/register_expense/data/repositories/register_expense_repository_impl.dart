import 'package:injectable/injectable.dart';
import '../../domain/repositories/register_expense_repository.dart';
import '../datasources/register_expense_datasource.dart';
import 'package:conta_em_dia/features/common/entities/card/card_account_entity.dart';
import 'package:conta_em_dia/features/common/entities/expense/expense_category_entity.dart';

@LazySingleton(as: RegisterExpenseRepository)
class RegisterExpenseRepositoryImpl implements RegisterExpenseRepository {
  final RegisterExpenseDataSource dataSource;

  RegisterExpenseRepositoryImpl(this.dataSource);

  @override
  Future<List<CardAccountEntity>> getCards() async {
    final cards = await dataSource.getCards();
    return cards.map((c) => c.toEntity()).toList();
  }

  @override
  Future<List<ExpenseCategoryEntity>> getCategories() async {
    final categories = await dataSource.getCategories();
    return categories.map((c) => c.toEntity()).toList();
  }

  @override
  Future<void> registerExpense(
    double amount,
    String description,
    String categoryId,
    DateTime date,
    String cardId,
  ) async {
    return await dataSource.registerExpense(
      amount,
      description,
      categoryId,
      date,
      cardId,
    );
  }
}
