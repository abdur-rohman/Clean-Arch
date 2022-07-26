import 'package:clean_arch/app/presentation/pages/home/home_controller.dart';
import 'package:clean_arch/app/presentation/widgets/user_tile_widget.dart';
import 'package:clean_arch/domain/entities/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';

class HomePage extends View {
  HomePage({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    final homeController = Injector.appInstance.get<HomeController>();
    return _HomeViewState(homeController);
  }
}

class _HomeViewState extends ViewState<HomePage, HomeController> {
  _HomeViewState(super.controller);

  @override
  Widget get view => Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: const Text('Users'),
        ),
        body: ControlledWidgetBuilder<HomeController>(
          builder: (BuildContext _, HomeController controller) =>
              controller.isLoading
                  ? const Center(child: CupertinoActivityIndicator())
                  : ListView.builder(
                      itemCount: controller.users.length,
                      itemBuilder: (BuildContext _, int index) {
                        final user = controller.users[index];
                        return UserTile(
                          user: user,
                          onUserClicked: (User user) {
                            controller.navigateToUserDetail(user);
                          },
                        );
                      },
                    ),
        ),
      );
}
