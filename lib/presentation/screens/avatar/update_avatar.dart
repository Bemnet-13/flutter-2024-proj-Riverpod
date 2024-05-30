import 'package:FantasyE/application/avatar/avatar_manager/avatar_manager_provider.dart';
import 'package:FantasyE/application/avatar/avatar_watcher/avatar_watcher_provider.dart';
import 'package:FantasyE/presentation/widgets/appbar.dart';
import 'package:FantasyE/presentation/widgets/buttons.dart';
import 'package:FantasyE/presentation/widgets/colors.dart';
import 'package:FantasyE/presentation/widgets/drawer.dart';
import 'package:FantasyE/presentation/widgets/text_fields.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class UpdateAvatarScreen extends StatelessWidget {
  const UpdateAvatarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return UpdateAvatar();
  }
}

class UpdateAvatar extends ConsumerWidget {
  const UpdateAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarWatcher = ref.read(avatarWatcherNotifierProvider.notifier);
    final avatarState = ref.watch(avatarManagerNotifierProvider);
    final avatarManager = ref.read(avatarManagerNotifierProvider.notifier);
    ref.listen(
      avatarManagerNotifierProvider,
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
              avatarWatcher.getAllAvatars();
            },
          ),
        );
      },
    );
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Update Avatar',
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
                'UPDATE Avatar',
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
                autovalidateMode: avatarState.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                child: Column(
                  children: [
                    FieldEntry(
                        text: "Avatar Name",
                        icon: Icons.format_list_numbered_rtl_sharp,
                        isObscured: false,
                        validatorCallback: (_) =>
                            avatarState.avatarName.value.fold(
                              (f) => f.maybeMap(
                                orElse: () => 'Please fill out the Name field',
                              ),
                              (_) => 'Please fill out the name field',
                            ),
                        onchangedCallback: (value) =>
                            avatarManager.nameChanged(value)),

                      FieldEntry(
                      text: "Avatar Score",
                      icon: Icons.format_list_numbered_rtl_sharp,
                      isObscured: false,
                      validatorCallback: (_) => 
                          avatarState.avatarScore.value.fold(
                            (f) => f.maybeMap(
                              invalidScore: (_) => 'Invalid avatar score',
                              orElse: () => 'Please fill out the Name field',
                            ),
                            (_) => 'Please fill out the avatar score field',
                          ),
                      onchangedCallback: (value) => 
                          avatarManager.scoreChanged(value)),
                    
                    FieldEntry(
                      text: "Avatar Club",
                      icon: Icons.format_list_numbered_rtl_sharp,
                      isObscured: false,
                      validatorCallback: (_) =>    avatarState.avatarClub.value.fold(
                            (f) => f.maybeMap(
                              invalidClub: (_) => 'Invalid avatar club',
                              orElse: () => 'Please fill out the club field',
                            ),
                            (_) => 'Please fill out the avatar club field',
                          ),
                      onchangedCallback: (value) => 
                          avatarManager.clubChanged(value)),
                    

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
                      buttonText: 'Update Avatar',
                      buttonColor: CustomColors.accent,
                      onPressedAction: () {
                        avatarManager.updateAvatarPressed();
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
