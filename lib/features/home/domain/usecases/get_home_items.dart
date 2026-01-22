import '../entities/home_data.dart';
import '../repositories/home_repository.dart';

class GetHomeItems {
  final HomeRepository repository;

  GetHomeItems(this.repository);

  Future<HomeData> call() async {
    return repository.getHomeItems();
  }
}
