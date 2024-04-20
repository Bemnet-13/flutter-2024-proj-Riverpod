import 'package:flutter/material.dart';

class RoleChoiceChip extends StatelessWidget {
  final String role1;
  final String role2;
  late final List<String> roles;

  RoleChoiceChip(this.role1, this.role2) {
    roles = [role1, role2];
  }

  @override
  Widget build(BuildContext context) {
    // Return the ActionChoiceExample widget directly
    return ActionChoiceExample(roles: roles);
  }
}
class ActionChoiceExample extends StatefulWidget {
  final List<String> roles;
  const ActionChoiceExample({Key? key, required this.roles}) : super(key: key);

  @override
  State<ActionChoiceExample> createState() => _ActionChoiceExampleState();
}

class _ActionChoiceExampleState extends State<ActionChoiceExample> {
  int? _value = 0;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: 155,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('As', style: textTheme.headlineMedium),
              Wrap(
                spacing: 10.0,
                children: List<Widget>.generate(
                  widget.roles.length,
                      (int index) {
                    return ChoiceChip(
                      label: Text(widget.roles[index]),
                      selected: _value == index,
                      onSelected: (bool selected) {
                        setState(() {
                          _value = selected ? index : null;
                        });
                      },
                    );
                  },
                ).toList(),
              ),
            ],
          ),
    );
  }
}



