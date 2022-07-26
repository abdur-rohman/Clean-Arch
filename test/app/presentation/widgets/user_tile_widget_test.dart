import 'package:clean_arch/app/presentation/widgets/user_tile_widget.dart';
import 'package:clean_arch/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../stub/domain/user_domain.dart';

class _DebugUserTile extends StatelessWidget {
  final User user;
  final Function(User) onUserClicked;

  const _DebugUserTile({
    required this.user,
    required this.onUserClicked,
  });

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: UserTile(
            user: user,
            onUserClicked: onUserClicked,
          ),
        ),
      );
}

void main() {
  testWidgets(
    'UserTile widget has text with "Ahmad Dazzle" value',
    (WidgetTester tester) async {
      final user = userDomain;
      final onUserClicked = (User user) {};
      await tester.pumpWidget(
        _DebugUserTile(user: user, onUserClicked: onUserClicked),
      );

      final userFullNameText = find.text(user.fullName);
      final userEmailText = find.text(user.email);
      expect(userFullNameText, findsOneWidget);
      expect(userEmailText, findsOneWidget);
    },
  );
}
