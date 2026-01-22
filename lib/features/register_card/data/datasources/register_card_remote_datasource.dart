import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'register_card_datasource.dart';
import '../../../../core/network/network_client.dart';
import '../../../../core/network/network_exceptions.dart';
import '../../../common/models/card/card.dart';

@LazySingleton(as: RegisterCardDataSource, env: ['dev'])
class RegisterCardRemoteDataSource implements RegisterCardDataSource {
  final NetworkClient networkClient;

  RegisterCardRemoteDataSource(this.networkClient);

  @override
  Future<List<CardTypeModel>> getCardTypes() async {
    return [
      CardTypeModel(
        id: "type_1",
        name: "Crédito",
      ),
      CardTypeModel(
        id: "type_2",
        name: "Débito",
      ),
      CardTypeModel(
        id: "type_3",
        name: "VR/VA",
      ),
    ];
  }

  @override
  Future<List<CardBankModel>> getBanks() async {
    return [
      CardBankModel(
        id: "bank_1",
        name: "Bradesco",
        asset: "Bradesco",
      ),
      CardBankModel(
        id: "bank_2",
        name: "Santander",
        asset: "Santander",
      ),
      CardBankModel(
        id: "bank_3",
        name: "Caixa",
        asset: "caixa",
      ),
      CardBankModel(
        id: "bank_4",
        name: "Nubank",
        asset: "nubank",
      ),
      CardBankModel(
        id: "bank_5",
        name: "Caju",
        asset: "caju",
      ),
      CardBankModel(
        id: "bank_6",
        name: "Alelo",
        asset: "alelo",
      ),
    ];
  }

  @override
  Future<List<CardNetworkModel>> getNetworks() async {
    return [
      CardNetworkModel(
        id: "network_1",
        name: "Elo",
        asset: "elo",
      ),
      CardNetworkModel(
        id: "network_2",
        name: "Mastercard",
        asset: "mastercard",
      ),
      CardNetworkModel(
        id: "network_3",
        name: "Hipercard",
        asset: "hipercard",
      ),
      CardNetworkModel(
        id: "network_4",
        name: "Visa",
        asset: "visa",
      ),
    ];
  }

  @override
  Future<void> registerCard(
    String typeId,
    String bankId,
    String networkId,
  ) async {
    try {
      final response = await networkClient.post(
        '/cards',
        data: {
          'bank_id': bankId,
          'type_id': typeId,
          'network_id': networkId,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) return;
      throw NetworkException(
        'Register card failed with status: ${response.statusCode}',
      );
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      throw NetworkException('Unexpected error: $e');
    }
  }
}
