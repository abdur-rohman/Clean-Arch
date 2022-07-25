import 'package:clean_arch/use_case/cases/get_users_use_case.dart';
import 'package:injector/injector.dart';

class UseCaseModule {
  static registerClasses() {
    final injector = Injector.appInstance;
    injector.registerDependency<GetUsers>(() => GetUsers(injector.get()));
  }
}
