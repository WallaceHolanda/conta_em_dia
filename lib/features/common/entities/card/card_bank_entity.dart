import '../../../../core/assets/ds_images_enum.dart';

class CardBankEntity {
  final String id;
  final String name;
  final DsImagesEnum? asset;

  CardBankEntity({
    required this.id,
    required this.name,
    required this.asset,
  });
}
