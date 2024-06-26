import 'package:FantasyE/application/auth/manage_account/manage_account_provider.dart';
import 'package:FantasyE/presentation/widgets/appbar.dart';
import 'package:FantasyE/presentation/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen();

  @override
  Widget build(BuildContext context) {
    return const UserDetails();
  }
}

class UserDetails extends ConsumerWidget {
  const UserDetails();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(manageAccountNotifierProvider);
    final monitorAccount = ref.watch(manageAccountNotifierProvider.notifier);

    final emailAddress = state.emailAddress.getOrCrash();
    final name = state.name.getOrCrash();
    final isSuspended = state.suspensionState;
    final role = state.role.getOrCrash();
    final id = state.id;
    final firstLetter = name[0];
    return Scaffold(
      appBar: CustomAppbar(title: "User Details", icon: Icons.menu),
      drawer: DrawerMenu(),
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
                    'NAME',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    name,
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
                    'EMAIL',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    emailAddress,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'ROLE',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    role,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'SUSPENSION STATE',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    isSuspended ? 'SUSPENDED' : 'NOT SUSPENDED',
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
                        monitorAccount.suspendUserAccountPressed(state.id);
                        context.go('/all_users');
                      },
                      icon: const Icon(
                        Icons.mobile_off_rounded,
                        size: 30,
                      ),
                      label: const Text(
                        'SUSPEND',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900),
                      )),
                  TextButton.icon(
                    onPressed: () {
                      monitorAccount.deleteUserAccountPressed(state.id);
                      context.go('/all_users');
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
