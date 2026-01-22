import '../../entities/expense/expense_category_entity.dart';

class ExpenseCategoryModel extends ExpenseCategoryEntity {
  ExpenseCategoryModel({
    required super.id,
    required super.name,
  });

  factory ExpenseCategoryModel.fromJson(Map<String, dynamic> json) {
    return ExpenseCategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }

  ExpenseCategoryEntity toEntity() => ExpenseCategoryEntity(id: id, name: name);
}
