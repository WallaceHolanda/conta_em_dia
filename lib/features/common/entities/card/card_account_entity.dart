import 'package:conta_em_dia/features/common/entities/card/card.dart';

class CardAccountEntity {
  final String id;
  final CardTypeEntity type;
  final CardBankEntity bank;
  final CardNetworkEntity cardNetwork;

  CardAccountEntity({
    required this.id,
    required this.type,
    required this.bank,
    required this.cardNetwork,
  });
}
