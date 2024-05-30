import 'package:FantasyE/application/avatar/avatar_manager/avatar_manager_notifier.dart';
import 'package:FantasyE/application/avatar/avatar_manager/avatar_manager_provider.dart';
import 'package:FantasyE/application/avatar/avatar_watcher/avatar_watcher_notifier.dart';
import 'package:FantasyE/application/avatar/avatar_watcher/avatar_watcher_provider.dart';
import 'package:FantasyE/domain/avatar/avatar.dart';
import 'package:FantasyE/presentation/widgets/appbar.dart';
import 'package:FantasyE/presentation/widgets/drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:FantasyE/domain/avatar/avatar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../../injection.dart';
import 'package:flutter/material.dart';

class ManageAvatarScreen extends StatelessWidget {
  const ManageAvatarScreen({super.key});

  Widget build(BuildContext context) {
    return const AvatarList();
  }
}

class AvatarList extends ConsumerWidget {
  const AvatarList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatars = ref.read(avatarWatcherNotifierProvider.notifier);
    avatars.getAllAvatars();
    final avatarsState = ref.watch(avatarWatcherNotifierProvider);
    return avatarsState.maybeMap(
      initial: (_) => const Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.hourglass_empty_rounded,
              size: 50,
            ),
            Text(
              "No Avatars Yet",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      loadFailure: (_) => const Scaffold(
        body: Column(
          children: [
            Icon(Icons.cloud_off, size: 50),
            Text(
              "Load Failure",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      loadSuccess: (state) {
        return Scaffold(
          appBar: const CustomAppbar(
            title: "Manage Avatars",
            icon: Icons.menu,
          ),
          drawer: DrawerMenu(),
          body: ListView.separated(
              itemBuilder: ((context, index) {
                final avatar = state.avatars[index];
                return AvatarTile(avatar: avatar);
              }),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: state.avatars.length),
          floatingActionButton: FloatingActionButton.large(
              child: const Icon(Icons.add),
              onPressed: () {
                context.go('/create_avatar');
              }),
        );
      },
      orElse: () => const Placeholder(),
    );
  }
}

class AvatarTile extends ConsumerWidget {
  final Avatar avatar;
  const AvatarTile({required this.avatar});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarManager = ref.read(avatarManagerNotifierProvider.notifier);
    return ListTile(
      onTap: () {
        avatarManager.avatarSelected(
            uniqueId: avatar.id,
            avatarScore: avatar.avatarScore,
            avatarName: avatar.avatarName,
            avatarClub: avatar.avatarClub);
        context.go('/avatar_details');
      },
      leading: const Icon(
        Icons.table_chart_outlined,
        size: 50,
      ),
      title: Text(
        avatar.avatarName.getOrCrash(),
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
