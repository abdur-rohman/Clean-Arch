import 'package:clean_arch/app/presentation/pages/user_detail/user_detail_controller.dart';
import 'package:clean_arch/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';

class UserDetailPage extends View {
  static const route = '/user-detail';

  final User arguments;

  UserDetailPage(this.arguments, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    final userDetailController =
        Injector.appInstance.get<UserDetailController>();
    return _UserDetailViewState(userDetailController);
  }
}

class _UserDetailViewState
    extends ViewState<UserDetailPage, UserDetailController> {
  _UserDetailViewState(super.controller);

  @override
  Widget get view => Scaffold(
        appBar: AppBar(
          title: Text(widget.arguments.fullName),
        ),
        body: Column(
          children: [
            Image.network(widget.arguments.image),
            Text(widget.arguments.email)
          ],
        ),
      );
}
