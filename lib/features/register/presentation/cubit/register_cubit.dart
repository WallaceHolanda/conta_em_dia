import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import '../../domain/repositories/register_repository.dart';
import 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepository registerRepository;

  RegisterCubit(this.registerRepository) : super(RegisterInitial());

  Future<void> register(String name, String email, String password) async {
    emit(RegisterLoading());
    try {
      final user = await registerRepository.register(name, email, password);
      emit(RegisterSuccess(user));
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }
}
