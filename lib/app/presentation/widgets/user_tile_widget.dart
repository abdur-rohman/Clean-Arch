import 'package:clean_arch/domain/entities/user.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final User user;
  final Function(User) onUserClicked;

  const UserTile({
    super.key,
    required this.user,
    required this.onUserClicked,
  });

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () => onUserClicked(user),
        // leading: Image.network(user.image),
        title: Text(user.fullName),
        subtitle: Text(user.email),
      );
}
