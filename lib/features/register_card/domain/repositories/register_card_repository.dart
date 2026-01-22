import 'package:conta_em_dia/features/common/entities/card/card_bank_entity.dart';
import 'package:conta_em_dia/features/common/entities/card/card_network_entity.dart';
import 'package:conta_em_dia/features/common/entities/card/card_type_entity.dart';

abstract class RegisterCardRepository {
  Future<List<CardTypeEntity>> getCardTypes();

  Future<List<CardBankEntity>> getBanks();

  Future<List<CardNetworkEntity>> getNetworks();

  Future<void> registerCard(String typeId, String bankId, String networkId);
}
