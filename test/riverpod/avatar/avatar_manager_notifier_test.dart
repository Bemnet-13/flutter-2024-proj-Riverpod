import 'package:FantasyE/domain/avatar/avatar.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:FantasyE/domain/avatar/avatar_failure.dart';
import 'package:FantasyE/domain/avatar/i_avatar_repository.dart';
import 'package:FantasyE/domain/avatar/value_objects.dart';
import 'package:FantasyE/domain/core/value_objects.dart';
import 'package:FantasyE/application/avatar/avatar_manager/avatar_manager_notifier.dart';

class MockAvatarRepository extends Mock implements IAvatarRepository {}

class FakeAvatar extends Fake implements Avatar {}

void main() {
  late AvatarManagerNotifier avatarManagerNotifier;
  late MockAvatarRepository mockAvatarRepository;

  setUp(() {
    mockAvatarRepository = MockAvatarRepository();
    avatarManagerNotifier = AvatarManagerNotifier(mockAvatarRepository);
  });
  setUpAll(() {
    registerFallbackValue(FakeAvatar());
  });
  test('initial state should be AvatarManagerState.initial()', () {
    expect(avatarManagerNotifier.state, AvatarManagerState.initial());
  });

  group('createAvatarPressed', () {
    final uniqueId = UniqueId();
    final avatarName = AvatarName('Test Avatar');
    final avatarClub = AvatarClub('Test Club');
    final avatarScore = AvatarScore('10');

    setUp(() {
      avatarManagerNotifier.idSet(uniqueId);
      avatarManagerNotifier.nameChanged(avatarName.getOrCrash());
      avatarManagerNotifier.clubChanged(avatarClub.getOrCrash());
      avatarManagerNotifier.scoreChanged(avatarScore.getOrCrash().toString());
    });

    test('should call create on the repository', () async {
      when(() => mockAvatarRepository.create(any()))
          .thenAnswer((_) async => right(unit));

      await avatarManagerNotifier.createAvatarPressed();

      verify(() => mockAvatarRepository.create(any())).called(1);
    });

    test('should update state to loadSuccess when creation is successful',
        () async {
      when(() => mockAvatarRepository.create(any()))
          .thenAnswer((_) async => right(unit));

      await avatarManagerNotifier.createAvatarPressed();

      expect(
        avatarManagerNotifier.state.operationFailureOrSuccess,
        optionOf(right(unit)),
      );
    });

    test('should update state to loadFailure when creation fails', () async {
      final failure = AvatarFailure.unexpected();
      when(() => mockAvatarRepository.create(any()))
          .thenAnswer((_) async => left(failure));

      await avatarManagerNotifier.createAvatarPressed();

      expect(
        avatarManagerNotifier.state.operationFailureOrSuccess,
        optionOf(left(failure)),
      );
    });
  });

  // Similar tests can be written for updateAvatarPressed and deleteAvatarTriggered.
}
