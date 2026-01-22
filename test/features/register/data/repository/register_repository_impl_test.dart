import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:conta_em_dia/features/register/data/repositories/register_repository_impl.dart';
import 'package:conta_em_dia/features/register/data/datasources/register_datasource.dart';

class MockRegisterDataSource extends Mock implements RegisterDataSource {}

void main() {
  late RegisterRepositoryImpl repository;
  late MockRegisterDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockRegisterDataSource();
    repository = RegisterRepositoryImpl(mockDataSource);
  });

  test('register delegates to datasource on success', () async {
    when(
      () => mockDataSource.register(any(), any(), any()),
    ).thenAnswer((_) async => Future.value());

    await repository.register('name', 'email', 'pass');

    verify(() => mockDataSource.register('name', 'email', 'pass')).called(1);
  });

  test('register throws when datasource throws', () async {
    when(
      () => mockDataSource.register(any(), any(), any()),
    ).thenThrow(Exception('failed'));

    expect(() => repository.register('n', 'e', 'p'), throwsA(isA<Exception>()));
  });
}
