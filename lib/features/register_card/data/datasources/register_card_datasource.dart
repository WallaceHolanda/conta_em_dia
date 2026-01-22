import '../../../common/models/card/card.dart';

abstract class RegisterCardDataSource {
  Future<List<CardTypeModel>> getCardTypes();

  Future<List<CardBankModel>> getBanks();

  Future<List<CardNetworkModel>> getNetworks();

  Future<void> registerCard(String typeId, String bankId, String networkId);
}
