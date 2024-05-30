import 'package:FantasyE/application/avatar/avatar_manager/avatar_manager_provider.dart';
import 'package:FantasyE/application/avatar/avatar_watcher/avatar_watcher_provider.dart';
import 'package:FantasyE/presentation/widgets/appbar.dart';
import 'package:FantasyE/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AvatarDetailsScreen extends StatelessWidget {
  const AvatarDetailsScreen();

  @override
  Widget build(BuildContext context) {
    return AvatarDetails();
  }
}

class AvatarDetails extends ConsumerWidget {
  const AvatarDetails();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarManager = ref.read(avatarManagerNotifierProvider.notifier);
    final state = ref.watch(avatarManagerNotifierProvider);

    final avatarName = state.avatarName.getOrCrash();
    final avatarClub = state.avatarClub.getOrCrash();
    final avatarScore = state.avatarScore.getOrCrash().toString();

    print(avatarName);
    print(avatarClub);
    print(avatarScore);

    final firstLetter = avatarName[0];
    return Scaffold(
      appBar: const CustomAppbar(title: "Avatar Details", icon: Icons.menu),
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
                    'Avatar Name',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    avatarName,
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
                    'Avatar Club',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    avatarClub,
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
                    'Avatar Score',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    avatarScore,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                      onPressed: () {
                        avatarManager.avatarSelected(
                          avatarName: state.avatarName,
                          uniqueId: state.uniqueId,
                          avatarScore: state.avatarScore,
                          avatarClub: state.avatarClub,
                        );
                        // context.read<AvatarManagerBloc>().add(
                        // AVatarManagerEvent.avatarSelected(state.avatarName,
                        // state.uniqueId, state.members));
                        context.go('/update_avatar');
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
                      // context.read<AvatarManagerBloc>().add(
                      // const AvatarManagerEvent.deleteAvatarTriggered());
                      avatarManager.deleteAvatarTriggered();
                      // avatarWatcher.getAllAvatars();
                      context.go('/manage_avatars');
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
