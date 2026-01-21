import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import '../../domain/repositories/auth_repository.dart';
import 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;

  LoginCubit(this.authRepository) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final user = await authRepository.login(email, password);
      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
