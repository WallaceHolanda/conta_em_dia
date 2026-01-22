import '../entities/home_data_entity.dart';
import '../repositories/home_repository.dart';

class GetHomeItems {
  final HomeRepository repository;

  GetHomeItems(this.repository);

  Future<HomeDataEntity> call() async {
    return repository.getHomeItems();
  }
}
