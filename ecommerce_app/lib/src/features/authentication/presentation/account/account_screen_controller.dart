import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountScreenController extends StateNotifier<AsyncValue<void>> {
  final FakeAuthRepository authRepository;

  AccountScreenController({
    required this.authRepository,
  }) : super(const AsyncValue<void>.data(null));

  Future<void> signOut() async {
    try {
      state = const AsyncValue<void>.loading();
      authRepository.signOut();
      state = const AsyncValue<void>.data(null);
    } catch (e, st) {
      state = AsyncValue<void>.error(e, st);
    }
  }
}

final accountScreenControllerProvider = StateNotifierProvider.autoDispose<
    AccountScreenController, AsyncValue<void>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AccountScreenController(authRepository: authRepository);
});
