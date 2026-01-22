import 'package:injectable/injectable.dart';
import 'register_expense_datasource.dart';
import 'package:dio/dio.dart';
import '../../../../core/network/network_client.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../../common/models/card/card.dart';
import '../../../common/models/expense/expense_category_model.dart';

@LazySingleton(as: RegisterExpenseDataSource, env: ['dev'])
class RegisterExpenseRemoteDataSource implements RegisterExpenseDataSource {
  final NetworkClient networkClient;

  RegisterExpenseRemoteDataSource(this.networkClient);

  @override
  Future<List<CardAccountModel>> getCards() async {
    try {
      final response = await networkClient.get('/cards');

      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        return data
            .map(
              (e) => CardAccountModel.fromJson(
                e as Map<String, dynamic>,
              ),
            )
            .toList();
      } else {
        throw NetworkException(
          'Get cards failed with status: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      throw NetworkException('Unexpected error: $e');
    }
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
    try {
      final response = await networkClient.post(
        '/expenses',
        data: {
          'amount': amount,
          'details': description,
          'category_id': categoryId,
          'date': date.toIso8601String(),
          'card_id': cardId,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
      } else {
        throw NetworkException(
          'Register expense failed with status: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      throw NetworkException('Unexpected error: $e');
    }
  }
}
