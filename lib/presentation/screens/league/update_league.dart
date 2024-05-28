import 'package:FantasyE/application/league/league_manager/league_manager_provider.dart';
import 'package:FantasyE/application/league/league_watcher/league_watcher_provider.dart';
import 'package:FantasyE/presentation/widgets/appbar.dart';
import 'package:FantasyE/presentation/widgets/buttons.dart';
import 'package:FantasyE/presentation/widgets/drawer.dart';
import 'package:FantasyE/presentation/widgets/text_fields.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/colors.dart';
import 'package:flutter/material.dart';

class UpdateLeagueScreen extends StatelessWidget {
  const UpdateLeagueScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return UpdateLeague();
  }
}

class UpdateLeague extends ConsumerWidget {
  const UpdateLeague({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leagueWatcher = ref.read(leagueWatcherNotifierProvider.notifier);
    final leagueState = ref.watch(leagueManagerNotifierProvider);
    final legaueManager = ref.read(leagueManagerNotifierProvider.notifier);
    ref.listen(
      leagueManagerNotifierProvider,
      (previous, next) {
        next.operationFailureOrSuccess.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: failure.maybeMap(
                    unexpected: (_) => const Text("Unexpected. Try again"),
                    insufficientPermissions: (_) =>
                        const Text("Insuffiecient Permissions"),
                    unableToUpdate: (_) => const Text("Unable to update"),
                    orElse: () => const Text("Please Try again"),
                  ),
                ),
              );
            },
            (_) {
              context.go('/admin_dashboard');
              leagueWatcher.getAllLeagues();
            },
          ),
        );
      },
    );
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Update League',
        icon: Icons.menu,
      ),
      drawer: DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 18),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 48,
              ),
              const Text(
                'UPDATE LEAGUE',
                style: TextStyle(
                  color: CustomColors.primaryText,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ), // will be edited with custom text widget
              const SizedBox(
                height: 25,
              ),
              Form(
                autovalidateMode: leagueState.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  children: [
                    FieldEntry(
                        text: "League Name",
                        icon: Icons.format_list_numbered_rtl_sharp,
                        isObscured: false,
                        validatorCallback: (_) =>
                            leagueState.leagueName.value.fold(
                              (f) => f.maybeMap(
                                invalidName: (_) => 'Short league name',
                                orElse: () => 'Please fill out the Name field',
                              ),
                              (_) => 'Please fill out the league name field',
                            ),
                        onchangedCallback: (value) =>
                            legaueManager.nameChanged(value)),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ActionButton(
                      buttonText: 'Update League',
                      buttonColor: CustomColors.accent,
                      onPressedAction: () {
                        legaueManager.updateLeaguePressed();
                      })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
