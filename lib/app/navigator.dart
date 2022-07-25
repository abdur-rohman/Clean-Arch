import 'package:clean_arch/app/presentation/pages/user_detail/user_detail_page.dart';
import 'package:clean_arch/domain/entities/user.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case UserDetailPage.route:
        final arguments = settings.arguments as User;
        return MaterialPageRoute(
          builder: (BuildContext _) => UserDetailPage(arguments),
        );
      default:
        return null;
    }
  }
}
