import 'package:FantasyE/domain/core/value_objects.dart';
import 'package:FantasyE/domain/leagues/i_league_repository.dart';
import 'package:FantasyE/domain/leagues/league.dart';
import 'package:FantasyE/domain/leagues/value_objects.dart';
import 'package:FantasyE/application/league/league_manager/league_manager_notifier.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

// Generate the mock class
@GenerateMocks([ILeagueRepository])
import 'league_manager_notifier_test.mocks.dart';

void main() {
  late MockILeagueRepository mockLeagueRepository;
  late LeagueManagerNotifier notifier;

  setUp(() {
    mockLeagueRepository = MockILeagueRepository();
    notifier = LeagueManagerNotifier(mockLeagueRepository);
  });

  group('LeagueManagerNotifier Tests', () {
    test('initial state is correct', () {
      final initialState = LeagueManagerState.initial();
      expect(notifier.state, initialState);
    });

    test('nameChanged updates the state correctly', () {
      const leagueNameStr = 'New League Name';
      notifier.nameChanged(leagueNameStr);

      expect(
        notifier.state,
        notifier.state.copyWith(
          leagueName: LeagueName(leagueNameStr),
          operationFailureOrSuccess: none(),
        ),
      );
    });

    test('updateLeaguePressed calls repository and updates state', () async {
      final id = UniqueId();
      const leagueNameStr = 'Updated League';
      notifier.nameChanged(leagueNameStr);
      notifier.idSet(id);

      final updatedLeague = League(
        id: id,
        name: LeagueName(leagueNameStr),
        members: [],
      );

      when(mockLeagueRepository.updateLeague(any)).thenAnswer(
        (_) async => right(unit),
      );

      await notifier.updateLeaguePressed();

      verify(mockLeagueRepository.updateLeague(updatedLeague)).called(1);
      expect(notifier.state.operationFailureOrSuccess, optionOf(right(unit)));
    });

    test('deleteLeagueTriggered calls repository and updates state', () async {
      final id = UniqueId();
      const leagueNameStr = 'League to Delete';
      notifier.nameChanged(leagueNameStr);
      notifier.idSet(id);

      final leagueToDelete = League(
        id: id,
        name: LeagueName(leagueNameStr),
        members: [],
      );

      when(mockLeagueRepository.deleteLeague(any)).thenAnswer(
        (_) async => right(unit),
      );

      await notifier.deleteLeagueTriggered();

      verify(mockLeagueRepository.deleteLeague(leagueToDelete)).called(1);
      expect(notifier.state.operationFailureOrSuccess, optionOf(right(unit)));
    });
  });
}
