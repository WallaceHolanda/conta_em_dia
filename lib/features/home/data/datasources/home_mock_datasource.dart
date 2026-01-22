import 'package:injectable/injectable.dart';
import 'home_datasource.dart';
import '../models/home_model.dart';

@LazySingleton(as: HomeDataSource, env: ['mock'])
class HomeMockDataSource implements HomeDataSource {
  @override
  Future<HomeModel> getHomeItems() async {
    await Future.delayed(Duration(milliseconds: 500));
    return HomeModel.mock();
  }
}
