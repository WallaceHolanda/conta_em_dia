import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import '../../domain/repositories/home_repository.dart';
import 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository;

  HomeCubit(this.repository) : super(HomeInitial());

  Future<void> load() async {
    emit(HomeLoading());
    try {
      final data = await repository.getHomeItems();
      emit(HomeSuccess(data));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
