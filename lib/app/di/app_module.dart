import 'package:clean_arch/app/presentation/pages/home/home_controller.dart';
import 'package:clean_arch/app/presentation/pages/home/home_presenter.dart';
import 'package:clean_arch/data/di/data_module.dart';
import 'package:clean_arch/use_case/di/use_case_module.dart';
import 'package:injector/injector.dart';

class AppModule {
  static registerClasses() {
    final injector = Injector.appInstance;
    injector.registerDependency(
      () => HomePresenter(getUsersUseCase: injector.get()),
    );
    injector.registerDependency(() => HomeController(injector.get()));
  }

  static init() {
    DataModule.registerClasses();
    UseCaseModule.registerClasses();
    registerClasses();
  }
}
