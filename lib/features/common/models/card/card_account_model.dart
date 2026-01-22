import 'package:conta_em_dia/features/common/models/card/card_bank_model.dart';
import 'package:conta_em_dia/features/common/models/card/card_network_model.dart';
import 'package:conta_em_dia/features/common/models/card/card_type_model.dart';

import '../../entities/card/card_account_entity.dart';

class CardAccountModel {
  final String id;
  final CardBankModel bank;
  final CardTypeModel type;
  final CardNetworkModel cardNetwork;

  CardAccountModel({
    required this.id,
    required this.bank,
    required this.type,
    required this.cardNetwork,
  });

  factory CardAccountModel.fromJson(Map<String, dynamic> json) {
    return CardAccountModel(
      id: json['id'],
      bank: CardBankModel.fromJson(json['bank']),
      type: CardTypeModel.fromJson(json['type']),
      cardNetwork: CardNetworkModel.fromJson(json['cardNetwork']),
    );
  }

  CardAccountEntity toEntity() {
    return CardAccountEntity(
      id: id,
      bank: bank.toEntity(),
      type: type.toEntity(),
      cardNetwork: cardNetwork.toEntity(),
    );
  }
}
