import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:conta_em_dia/features/login/presentation/cubit/login_cubit.dart';
import 'package:conta_em_dia/features/login/domain/repositories/auth_repository.dart';
import 'package:conta_em_dia/features/login/presentation/cubit/login_state.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LoginCubit cubit;
  late MockAuthRepository mockRepository;

  setUp(() {
    mockRepository = MockAuthRepository();
    cubit = LoginCubit(mockRepository);
  });

  test('initial state is LoginInitial', () {
    expect(cubit.state, isA<LoginInitial>());
  });

  test('login success emits Loading then Success', () async {
    const email = 'test@example.com';
    const password = 'P@ssw0rd!';

    when(() => mockRepository.login(any(), any())).thenAnswer((_) async {});

    final expected = [isA<LoginLoading>(), isA<LoginSuccess>()];
    expectLater(cubit.stream, emitsInOrder(expected));

    await cubit.login(email, password);
  });

  test('login failure emits Loading then Failure', () async {
    const email = 'invalid@example.com';
    const password = 'wrong-pass';

    when(() => mockRepository.login(any(), any())).thenThrow(Exception('oops'));

    final expected = [isA<LoginLoading>(), isA<LoginFailure>()];
    expectLater(cubit.stream, emitsInOrder(expected));

    await cubit.login(email, password);
  });
}
