import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/domain/models/avatar.dart';
import '/domain/repositories/avatar_repository.dart';
import '../../infrastructure/data_sources/avatar_data_soruce.dart';
import '../../infrastructure/repositories/avatar_repository_impl.dart';

final avatarDataSourceProvider = Provider<AvatarDataSource>((ref) {
  return AvatarDataSource(); // Replace with actual data source initialization
});

final avatarRepositoryProvider = Provider<AvatarRepository>((ref) {
  final dataSource = ref.watch(avatarDataSourceProvider);
  return AvatarRepositoryImpl(dataSource);
});

final avatarProvider =
    StateNotifierProvider<AvatarNotifier, List<Avatar>>((ref) {
  final repository = ref.watch(avatarRepositoryProvider);
  return AvatarNotifier(repository);
});

class AvatarNotifier extends StateNotifier<List<Avatar>> {
  final AvatarRepository repository;

  AvatarNotifier(this.repository) : super([]);

  Future<void> loadAvatars() async {
    state = await repository.getAvatars();
  }

  Future<void> addAvatar(Avatar avatar) async {
    await repository.addAvatar(avatar);
    state = [...state, avatar];
  }
}
