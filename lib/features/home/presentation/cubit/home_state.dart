import '../../domain/entities/home_data.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final HomeData data;

  HomeSuccess(this.data);
}

class HomeFailure extends HomeState {}
