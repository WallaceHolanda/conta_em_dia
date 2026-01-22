import 'package:conta_em_dia/core/assets/ds_images_enum.dart';

class CardNetworkEntity {
  final String id;
  final String name;
  final DsImagesEnum? asset;

  CardNetworkEntity({
    required this.id,
    required this.name,
    required this.asset,
  });
}
