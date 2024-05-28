import 'package:FantasyE/application/league/league_manager/league_manager_provider.dart';
import 'package:FantasyE/presentation/widgets/appbar.dart';
import 'package:FantasyE/presentation/widgets/buttons.dart';
import 'package:FantasyE/presentation/widgets/drawer.dart';
import 'package:FantasyE/presentation/widgets/text_fields.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../injection.dart';
import '../../widgets/colors.dart';
import '../../widgets/custom_field.dart';
import 'package:flutter/material.dart';

class CreateLeagueScreen extends StatelessWidget {
  const CreateLeagueScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CreateLeague();
  }
}

class CreateLeague extends ConsumerWidget {
  const CreateLeague({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leagueState = ref.watch(leagueManagerNotifierProvider);
    final leagueManager = ref.read(leagueManagerNotifierProvider.notifier);
    ref.listen(leagueManagerNotifierProvider, (previous, next) {
      next.operationFailureOrSuccess.fold(
        () {},
        (either) => either.fold(
          (failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: failure.maybeMap(
                  unexpected: (_) => const Text("Unexpected. Try again"),
                  shortLeagueName: (_) =>
                      const Text("Short league name. Try longer one."),
                  insufficientPermissions: (_) =>
                      const Text("Insuffiecient Permissions"),
                  orElse: () => const Text("Please Try again"),
                ),
              ),
            );
          },
          (_) {
            context.go('/leagues');
          },
        ),
      );
    });
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Create League',
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
                'CREATE A NEW LEAGUE',
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
                            leagueManager.nameChanged(value)),
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
                      buttonText: 'Create League',
                      buttonColor: CustomColors.accent,
                      onPressedAction: () {
                        leagueManager.createLeaguePressed();
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
