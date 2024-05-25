import '../models/avatar.dart';

abstract class AvatarRepository {
  Future<List<Avatar>> getAvatars();
  Future<void> addAvatar(Avatar avatar);
}
