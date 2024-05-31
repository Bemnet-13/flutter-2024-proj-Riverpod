import 'package:FantasyE/domain/avatar/value_objects.dart';
import 'package:FantasyE/domain/core/value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:FantasyE/domain/avatar/i_avatar_repository.dart';
import 'package:FantasyE/domain/avatar/avatar.dart';
import 'package:FantasyE/application/avatar/avatar_watcher/avatar_watcher_notifier.dart';

// Mock implementation of IAvatarRepository
class MockAvatarRepository extends Mock implements IAvatarRepository {}

void main() {
  late AvatarWatcherNotifier avatarWatcherNotifier;
  late MockAvatarRepository mockAvatarRepository;

  setUp(() {
    mockAvatarRepository = MockAvatarRepository();
    avatarWatcherNotifier = AvatarWatcherNotifier(mockAvatarRepository);
  });

  test('initial state should be AvatarWatcherState.initial()', () {
    expect(avatarWatcherNotifier.state, AvatarWatcherState.initial());
  });

  group('getAllAvatars', () {
    final testAvatars = [
      Avatar(
          id: UniqueId(),
          avatarName: AvatarName('Avatar 1'),
          avatarClub: AvatarClub('Club A'),
          avatarScore: AvatarScore('10')),
      Avatar(
          id: UniqueId(),
          avatarName: AvatarName('Avatar 2'),
          avatarClub: AvatarClub('Club B'),
          avatarScore: AvatarScore('15')),
    ];
  });
}
