import 'package:FantasyE/application/league/league_manager/league_manager_provider.dart';
import 'package:FantasyE/application/league/league_watcher/league_watcher_provider.dart';
import 'package:FantasyE/presentation/widgets/appbar.dart';
import 'package:FantasyE/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LeagueDetailsScreen extends StatelessWidget {
  const LeagueDetailsScreen();

  @override
  Widget build(BuildContext context) {
    return LeagueDetails();
  }
}

class LeagueDetails extends ConsumerWidget {
  const LeagueDetails();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(leagueManagerNotifierProvider);
    final leagueManager = ref.read(leagueManagerNotifierProvider.notifier);
    final leagueWatcher = ref.read(leagueWatcherNotifierProvider.notifier);

    final leagueName = state.leagueName.getOrCrash();
    final numberOfMembers = state.members.length;
    final firstLetter = leagueName[0];
    return Scaffold(
      appBar: const CustomAppbar(title: "League Details", icon: Icons.menu),
      drawer: const DrawerMenu(),
      body: Card.outlined(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                child: Text(
                  firstLetter,
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'LEAGUE NAME',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    leagueName,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'MEMBERS',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    '$numberOfMembers',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                      onPressed: () {
                        leagueManager.leagueSelected(
                            name: state.leagueName,
                            id: state.uniqueId,
                            members: state.members);
                        // context.read<LeagueManagerBloc>().add(
                        // LeagueManagerEvent.leagueSelected(state.leagueName,
                        // state.uniqueId, state.members));
                        context.go('/update_league');
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 30,
                      ),
                      label: const Text(
                        'UPDATE',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      )),
                  TextButton.icon(
                    onPressed: () {
                      // context.read<LeagueManagerBloc>().add(
                      // const LeagueManagerEvent.deleteLeagueTriggered());
                      leagueManager.deleteLeagueTriggered();
                      leagueWatcher.getAllLeagues();
                      context.go('/manage_leagues');
                    },
                    icon: const Icon(
                      Icons.delete_forever,
                      size: 30,
                      color: Colors.red,
                    ),
                    label: const Text("DELETE",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: Colors.red)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
