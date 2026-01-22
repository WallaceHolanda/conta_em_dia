import '../../entities/card/card_type_entity.dart';

class CardTypeModel extends CardTypeEntity {
  CardTypeModel({
    required super.id,
    required super.name,
  });

  factory CardTypeModel.fromJson(Map<String, dynamic> json) {
    return CardTypeModel(
      id: json['id'],
      name: json['name'],
    );
  }

  CardTypeEntity toEntity() => CardTypeEntity(id: id, name: name);
}
