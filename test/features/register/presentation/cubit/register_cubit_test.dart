import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:conta_em_dia/features/register/presentation/cubit/register_cubit.dart';
import 'package:conta_em_dia/features/register/domain/repositories/register_repository.dart';
import 'package:conta_em_dia/features/register/presentation/cubit/register_state.dart';

class MockRegisterRepository extends Mock implements RegisterRepository {}

void main() {
  late RegisterCubit cubit;
  late MockRegisterRepository mockRepository;

  setUp(() {
    mockRepository = MockRegisterRepository();
    cubit = RegisterCubit(mockRepository);
  });

  test('initial state is RegisterInitial', () {
    expect(cubit.state, isA<RegisterInitial>());
  });

  test('register success emits Loading then Success', () async {
    when(() => mockRepository.register(any(), any(), any()))
        .thenAnswer((_) async {});

    final expected = [isA<RegisterLoading>(), isA<RegisterSuccess>()];
    expectLater(cubit.stream, emitsInOrder(expected));

    await cubit.register('n', 'e', 'p');
  });

  test('register failure emits Loading then Failure', () async {
    when(() => mockRepository.register(any(), any(), any()))
        .thenThrow(Exception('oops'));

    final expected = [isA<RegisterLoading>(), isA<RegisterFailure>()];
    expectLater(cubit.stream, emitsInOrder(expected));

    await cubit.register('n', 'e', 'p');
  });
}
