import 'package:conta_em_dia/core/assets/ds_images_enum.dart';

import '../../entities/card/card_network_entity.dart';

class CardNetworkModel {
  final String id;
  final String name;
  final String asset;

  CardNetworkModel({
    required this.id,
    required this.name,
    required this.asset,
  });

  factory CardNetworkModel.fromJson(Map<String, dynamic> json) {
    return CardNetworkModel(
      id: json['id'],
      name: json['name'],
      asset: json['asset'],
    );
  }

  DsImagesEnum? getNetworkImagePath(String bankName) {
    switch (bankName.toLowerCase()) {
      case 'elo':
        return DsImagesEnum.elo;
      case 'hipercard':
        return DsImagesEnum.hipercard;
      case 'mastercard':
        return DsImagesEnum.mastercard;
      case 'visa':
        return DsImagesEnum.visa;
      default:
        return null;
    }
  }

  CardNetworkEntity toEntity() {
    return CardNetworkEntity(
      id: id,
      name: name,
      asset: getNetworkImagePath(asset),
    );
  }
}
