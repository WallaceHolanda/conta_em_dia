import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:conta_em_dia/features/login/data/repositories/auth_repository_impl.dart';
import 'package:conta_em_dia/features/login/data/datasources/auth_datasource.dart';
import 'package:conta_em_dia/core/storage/secure_storage_service.dart';
import 'package:conta_em_dia/features/login/data/models/login_response_model.dart';
import 'package:conta_em_dia/core/storage/keys/secure_storage_key.dart';

class MockAuthDataSource extends Mock implements AuthDataSource {}

class MockSecureStorageService extends Mock implements SecureStorageService {}

void main() {
  setUpAll(() {
    registerFallbackValue(SecureStorageKey.accessToken);
  });
  late AuthRepositoryImpl repository;
  late MockAuthDataSource mockDataSource;
  late MockSecureStorageService mockStorage;

  setUp(() {
    mockDataSource = MockAuthDataSource();
    mockStorage = MockSecureStorageService();
    repository = AuthRepositoryImpl(mockDataSource, mockStorage);
  });

  test('login saves tokens on success', () async {
    final model = LoginResponseModel(
      accessToken: 'a_token',
      refreshToken: 'r_token',
      tokenType: 'bearer',
    );

    when(
      () => mockDataSource.login(any(), any()),
    ).thenAnswer((_) async => model);
    when(
      () => mockStorage.write(any<SecureStorageKey>(), any()),
    ).thenAnswer((_) async {});

    const email = 'test@example.com';
    const password = 'P@ssw0rd!';

    await repository.login(email, password);

    verify(
      () => mockStorage.write(SecureStorageKey.accessToken, 'a_token'),
    ).called(1);
    verify(
      () => mockStorage.write(SecureStorageKey.refreshToken, 'r_token'),
    ).called(1);
  });

  test('login throws when datasource throws', () async {
    when(
      () => mockDataSource.login(any(), any()),
    ).thenThrow(Exception('failed'));

    const email = 'test@example.com';
    const password = 'P@ssw0rd!';

    expect(() => repository.login(email, password), throwsA(isA<Exception>()));
  });
}
