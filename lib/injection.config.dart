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

import 'core/network/network_client.dart' as _i865;
import 'core/storage/implementations/flutter_secure_storage_service.dart'
    as _i345;
import 'core/storage/implementations/shared_preferences_storage_service.dart'
    as _i972;
import 'core/storage/local_storage_service.dart' as _i190;
import 'core/storage/secure_storage_service.dart' as _i797;
import 'features/login/data/datasources/auth_datasource.dart' as _i608;
import 'features/login/data/datasources/auth_mock_datasource.dart' as _i560;
import 'features/login/data/datasources/auth_remote_datasource.dart' as _i697;
import 'features/login/data/repositories/auth_repository_impl.dart' as _i606;
import 'features/login/domain/repositories/auth_repository.dart' as _i590;
import 'features/login/presentation/cubit/login_cubit.dart' as _i774;
import 'features/onboarding/data/onboarding_repository_impl.dart' as _i801;
import 'features/onboarding/domain/onboarding_repository.dart' as _i761;
import 'features/onboarding/presentation/cubit/onboarding_cubit.dart' as _i133;
import 'features/splash/data/splash_repository_impl.dart' as _i634;
import 'features/splash/domain/splash_repository.dart' as _i43;
import 'features/splash/presentation/cubit/splash_cubit.dart' as _i402;
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
  gh.singleton<_i865.NetworkClient>(() => registerModule.networkClient);
  gh.lazySingleton<_i608.AuthDataSource>(
    () => _i560.AuthMockDataSource(),
    registerFor: {_mock},
  );
  gh.lazySingleton<_i797.SecureStorageService>(
    () => _i345.FlutterSecureStorageService(),
  );
  gh.lazySingleton<_i190.LocalStorageService>(
    () => _i972.SharedPreferencesStorageService(),
  );
  gh.lazySingleton<_i43.SplashRepository>(
    () => _i634.SplashRepositoryImpl(gh<_i190.LocalStorageService>()),
  );
  gh.lazySingleton<_i608.AuthDataSource>(
    () => _i697.AuthRemoteDataSource(gh<_i865.NetworkClient>()),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i761.OnboardingRepository>(
    () => _i801.OnboardingRepositoryImpl(gh<_i190.LocalStorageService>()),
  );
  gh.factory<_i402.SplashCubit>(
    () => _i402.SplashCubit(gh<_i43.SplashRepository>()),
  );
  gh.lazySingleton<_i590.AuthRepository>(
    () => _i606.AuthRepositoryImpl(gh<_i608.AuthDataSource>()),
  );
  gh.factory<_i133.OnboardingCubit>(
    () => _i133.OnboardingCubit(gh<_i761.OnboardingRepository>()),
  );
  gh.factory<_i774.LoginCubit>(
    () => _i774.LoginCubit(gh<_i590.AuthRepository>()),
  );
  return getIt;
}

class _$RegisterModule extends _i464.RegisterModule {}
