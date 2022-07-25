import 'package:clean_arch/app/presentation/pages/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:injector/injector.dart';

class HomePage extends View {
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
        appBar: AppBar(
          title: Text('Users'),
        ),
        body: ControlledWidgetBuilder<HomeController>(
          builder: (BuildContext _, HomeController controller) =>
              controller.isLoading
                  ? const Center(child: CupertinoActivityIndicator())
                  : ListView.builder(
                      itemCount: controller.users.length,
                      itemBuilder: (BuildContext _, int index) {
                        final user = controller.users[index];
                        return ListTile(
                          leading: Image.network(user.image),
                          title: Text(user.fullName),
                          subtitle: Text(user.email),
                        );
                      },
                    ),
        ),
      );
}
