import '../../../../core/assets/ds_images_enum.dart';
import '../../entities/card/card_bank_entity.dart';

class CardBankModel {
  final String id;
  final String name;
  final String asset;

  CardBankModel({
    required this.id,
    required this.name,
    required this.asset,
  });

  factory CardBankModel.fromJson(Map<String, dynamic> json) {
    return CardBankModel(
      id: json['id'],
      name: json['name'],
      asset: json['asset'],
    );
  }

  DsImagesEnum? getCardImagePath(String cardName) {
    switch (cardName.toLowerCase()) {
      case 'caju':
        return DsImagesEnum.caju;
      case 'alelo':
        return DsImagesEnum.alelo;
      case 'nubank':
        return DsImagesEnum.nubank;
      case 'bradesco':
        return DsImagesEnum.bradesco;
      case 'caixa':
        return DsImagesEnum.caixa;
      case 'santander':
        return DsImagesEnum.santander;
      default:
        return null;
    }
  }

  CardBankEntity toEntity() {
    return CardBankEntity(
      id: id,
      name: name,
      asset: getCardImagePath(asset),
    );
  }
}
