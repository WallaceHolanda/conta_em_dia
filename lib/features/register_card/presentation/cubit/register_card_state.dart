import 'package:conta_em_dia/features/common/entities/card/card_bank_entity.dart';
import 'package:conta_em_dia/features/common/entities/card/card_network_entity.dart';
import 'package:conta_em_dia/features/common/entities/card/card_type_entity.dart';

enum LoadStatus { initial, loading, success, failure }

enum SubmitStatus { idle, loading, success, failure }

class RegisterCardState {
  final LoadStatus loadStatus;
  final SubmitStatus submitStatus;

  final List<CardTypeEntity> types;
  final List<CardBankEntity> banks;
  final List<CardNetworkEntity> networks;

  final String? errorMessage;

  const RegisterCardState({
    required this.loadStatus,
    required this.submitStatus,
    required this.types,
    required this.banks,
    required this.networks,
    this.errorMessage,
  });

  factory RegisterCardState.initial() {
    return const RegisterCardState(
      loadStatus: LoadStatus.initial,
      submitStatus: SubmitStatus.idle,
      types: [],
      banks: [],
      networks: [],
    );
  }

  RegisterCardState copyWith({
    LoadStatus? loadStatus,
    SubmitStatus? submitStatus,
    List<CardTypeEntity>? types,
    List<CardBankEntity>? banks,
    List<CardNetworkEntity>? networks,
    String? errorMessage,
  }) {
    return RegisterCardState(
      loadStatus: loadStatus ?? this.loadStatus,
      submitStatus: submitStatus ?? this.submitStatus,
      types: types ?? this.types,
      banks: banks ?? this.banks,
      networks: networks ?? this.networks,
      errorMessage: errorMessage,
    );
  }
}
