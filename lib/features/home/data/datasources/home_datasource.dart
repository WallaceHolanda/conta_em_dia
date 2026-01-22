import '../models/home_model.dart';

abstract class HomeDataSource {
  Future<HomeModel> getHomeItems();
}
