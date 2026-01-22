import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import '../../domain/repositories/register_card_repository.dart';
import 'register_card_state.dart';

@injectable
class RegisterCardCubit extends Cubit<RegisterCardState> {
  final RegisterCardRepository repository;

  RegisterCardCubit(this.repository) : super(RegisterCardState.initial());

  Future<void> load() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));

    try {
      final types = await repository.getCardTypes();
      final banks = await repository.getBanks();
      final networks = await repository.getNetworks();

      emit(
        state.copyWith(
          loadStatus: LoadStatus.success,
          types: types,
          banks: banks,
          networks: networks,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          loadStatus: LoadStatus.failure,
          errorMessage: 'Erro ao carregar dados do cartão',
        ),
      );
    }
  }

  Future<void> registerCard(
    String typeId,
    String bankId,
    String networkId,
  ) async {
    emit(state.copyWith(submitStatus: SubmitStatus.loading));

    try {
      await repository.registerCard(typeId, bankId, networkId);

      emit(state.copyWith(submitStatus: SubmitStatus.success));
    } catch (_) {
      emit(
        state.copyWith(
          submitStatus: SubmitStatus.failure,
          errorMessage: 'Erro ao cadastrar cartão',
        ),
      );
    }
  }

  void resetSubmitStatus() {
    emit(state.copyWith(submitStatus: SubmitStatus.idle));
  }
}
