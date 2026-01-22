import '../../domain/entities/home_data_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final HomeDataEntity data;

  HomeSuccess(this.data);
}

class HomeFailure extends HomeState {}
