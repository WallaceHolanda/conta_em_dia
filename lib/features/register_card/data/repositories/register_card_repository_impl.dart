import 'package:injectable/injectable.dart';
import '../../domain/repositories/register_card_repository.dart';
import '../datasources/register_card_datasource.dart';
import 'package:conta_em_dia/features/common/entities/card/card_bank_entity.dart';
import 'package:conta_em_dia/features/common/entities/card/card_network_entity.dart';
import 'package:conta_em_dia/features/common/entities/card/card_type_entity.dart';

@LazySingleton(as: RegisterCardRepository)
class RegisterCardRepositoryImpl implements RegisterCardRepository {
  final RegisterCardDataSource dataSource;

  RegisterCardRepositoryImpl(this.dataSource);

  @override
  Future<List<CardTypeEntity>> getCardTypes() async {
    final types = await dataSource.getCardTypes();
    return types.map((t) => t.toEntity()).toList();
  }

  @override
  Future<List<CardBankEntity>> getBanks() async {
    final banks = await dataSource.getBanks();
    return banks.map((b) => b.toEntity()).toList();
  }

  @override
  Future<List<CardNetworkEntity>> getNetworks() async {
    final network = await dataSource.getNetworks();
    return network.map((n) => n.toEntity()).toList();
  }

  @override
  Future<void> registerCard(
    String typeId,
    String bankId,
    String networkId,
  ) async {
    return await dataSource.registerCard(typeId, bankId, networkId);
  }
}
