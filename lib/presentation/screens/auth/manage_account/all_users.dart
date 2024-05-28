import 'package:FantasyE/application/auth/auth_users/auth_users_provider.dart';
import 'package:FantasyE/application/auth/manage_account/manage_account_provider.dart';
import 'package:FantasyE/domain/auth/user.dart';
import 'package:FantasyE/presentation/widgets/appbar.dart';
import 'package:FantasyE/presentation/widgets/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class UserAccountsScreen extends StatelessWidget {
  const UserAccountsScreen({super.key});

  Widget build(BuildContext context) {
    return const LeaguesList();
  }
}

class LeaguesList extends ConsumerWidget {
  const LeaguesList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersManager = ref.read(authUsersNotifierProvider.notifier);
    usersManager.getAllUsers();
    final state = ref.watch(authUsersNotifierProvider);
    return state.maybeMap(
        initial: (_) => const Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.hourglass_empty_rounded,
                      size: 50,
                    ),
                    Text(
                      "No Leagues Yet",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
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
        loadSuccess: (usersList) {
          return Scaffold(
            appBar: const CustomAppbar(
              title: "User Accounts",
              icon: Icons.menu,
            ),
            drawer: DrawerMenu(),
            body: ListView.separated(
                itemBuilder: ((context, index) {
                  final userDetails = usersList.users[index];
                  return UserTile(userDetails: userDetails);
                }),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: usersList.users.length),
          );
        },
        orElse: () => const Placeholder());
  }
}

class UserTile extends ConsumerWidget {
  final UserDetails userDetails;
  const UserTile({required this.userDetails});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountManager = ref.read(manageAccountNotifierProvider.notifier);
    return ListTile(
      onTap: () {
        accountManager.userAccountSelected(
            id: userDetails.id,
            emailAddress: userDetails.emailAddress,
            role: userDetails.role,
            name: userDetails.name,
            suspensionState: userDetails.isSuspended);
        context.go('/user_details');
      },
      leading: const Icon(
        Icons.person_2_rounded,
        size: 50,
      ),
      title: Text(
        userDetails.name.getOrCrash(),
        style: const TextStyle(fontSize: 24),
      ),
      subtitle: Text('Members : ${userDetails.role.getOrCrash()}'),
    );
  }
}
