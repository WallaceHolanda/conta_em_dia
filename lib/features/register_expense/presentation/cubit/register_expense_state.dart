import '../../../common/entities/card/card_account_entity.dart';
import '../../../common/entities/expense/expense_category_entity.dart';

enum LoadStatus { initial, loading, success, failure }

enum SubmitStatus { idle, loading, success, failure }

class RegisterExpenseState {
  final LoadStatus loadStatus;
  final SubmitStatus submitStatus;

  final List<CardAccountEntity> cards;
  final List<ExpenseCategoryEntity> categories;

  final String? errorMessage;

  const RegisterExpenseState({
    required this.loadStatus,
    required this.submitStatus,
    required this.cards,
    required this.categories,
    this.errorMessage,
  });

  factory RegisterExpenseState.initial() {
    return const RegisterExpenseState(
      loadStatus: LoadStatus.initial,
      submitStatus: SubmitStatus.idle,
      cards: [],
      categories: [],
    );
  }

  RegisterExpenseState copyWith({
    LoadStatus? loadStatus,
    SubmitStatus? submitStatus,
    List<CardAccountEntity>? cards,
    List<ExpenseCategoryEntity>? categories,
    String? errorMessage,
  }) {
    return RegisterExpenseState(
      loadStatus: loadStatus ?? this.loadStatus,
      submitStatus: submitStatus ?? this.submitStatus,
      cards: cards ?? this.cards,
      categories: categories ?? this.categories,
      errorMessage: errorMessage,
    );
  }
}
