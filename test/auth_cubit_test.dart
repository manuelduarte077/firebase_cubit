import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_cubit/cubit/auth_cubit.dart';
import 'package:firebase_cubit/main.dart';
import 'package:firebase_cubit/repository/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepo mockRepo;

  setUp(() async {
    await getIt.reset();
    mockRepo = MockAuthRepo();
    getIt.registerSingleton<AuthRepository>(mockRepo);
  });

  blocTest<AuthCubit, AuthState>(
    'Signed out state will be emitted',
    build: () {
      when(() => mockRepo.onAuthStateChanged)
          .thenAnswer((invocation) => Stream.fromIterable([null]));
      return AuthCubit();
    },
    act: (cubit) async => cubit.init(),
    expect: () => [
      AuthState.signedOut,
    ],
  );

  blocTest<AuthCubit, AuthState>(
    'Signed in state will be emitted',
    build: () {
      when(() => mockRepo.onAuthStateChanged)
          .thenAnswer((invocation) => Stream.fromIterable(['someUserID']));
      return AuthCubit();
    },
    act: (cubit) => cubit.init(),
    expect: () => [
      AuthState.signedIn,
    ],
  );

  blocTest<AuthCubit, AuthState>(
    'Signed out state will be emitted after calling signOut',
    build: () {
      when(() => mockRepo.onAuthStateChanged)
          .thenAnswer((_) => Stream.fromIterable(['someUserID']));
      when(() => mockRepo.signOut()).thenAnswer((_) async {});
      return AuthCubit();
    },
    act: (cubit) async {
      await cubit.init();
      await cubit.signOut();
    },
    expect: () => [
      AuthState.signedIn,
      AuthState.signedOut,
    ],
    verify: (cubit) {
      verify(() => mockRepo.signOut()).called(1);
    },
  );
}
