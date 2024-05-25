import '/domain/models/avatar.dart';
import '/domain/repositories/avatar_repository.dart';
import '../data_sources/avatar_data_soruce.dart';

class AvatarRepositoryImpl implements AvatarRepository {
  final AvatarDataSource dataSource;

  AvatarRepositoryImpl(this.dataSource);

  @override
  Future<List<Avatar>> getAvatars() async {
    return dataSource.getAvatars();
  }

  @override
  Future<void> addAvatar(Avatar avatar) async {
    await dataSource.addAvatar(avatar);
  }
}
