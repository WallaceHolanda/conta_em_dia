// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/login/data/datasources/auth_datasource.dart' as _i909;
import '../../features/login/data/datasources/auth_mock_datasource.dart'
    as _i912;
import '../../features/login/data/datasources/auth_remote_datasource.dart'
    as _i614;
import '../../features/login/data/repositories/auth_repository_impl.dart'
    as _i220;
import '../../features/login/domain/repositories/auth_repository.dart' as _i268;
import '../../features/login/presentation/cubit/login_cubit.dart' as _i147;
import '../network/network_client.dart' as _i30;
import 'injection.dart' as _i464;

const String _mock = 'mock';
const String _dev = 'dev';

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.singleton<_i361.Dio>(() => registerModule.dio);
  gh.singleton<_i30.NetworkClient>(() => registerModule.networkClient);
  gh.lazySingleton<_i909.AuthDataSource>(
    () => _i912.AuthMockDataSource(),
    registerFor: {_mock},
  );
  gh.lazySingleton<_i909.AuthDataSource>(
    () => _i614.AuthRemoteDataSource(gh<_i30.NetworkClient>()),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i268.AuthRepository>(
    () => _i220.AuthRepositoryImpl(
      dataSource: gh<_i909.AuthDataSource>(),
      isMock: gh<bool>(),
    ),
  );
  gh.factory<_i147.LoginCubit>(
    () => _i147.LoginCubit(gh<_i268.AuthRepository>()),
  );
  return getIt;
}

class _$RegisterModule extends _i464.RegisterModule {}
