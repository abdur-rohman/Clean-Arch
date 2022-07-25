import 'package:clean_arch/domain/entities/user.dart';
import 'package:clean_arch/use_case/cases/get_users_use_case.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePresenter extends Presenter {
  late Function(List<User>) onSuccessGetUsers;
  late Function(dynamic error) onErrorGetUsers;
  late Function() onFinishGetUsers;

  final GetUsers getUsersUseCase;

  HomePresenter({required this.getUsersUseCase});

  void getUsers() {
    getUsersUseCase.execute(_GetUsersObserver(this));
  }

  @override
  void dispose() {
    getUsersUseCase.dispose();
  }
}

class _GetUsersObserver extends Observer<List<User>> {
  final HomePresenter presenter;

  _GetUsersObserver(this.presenter);

  @override
  void onComplete() => presenter.onFinishGetUsers();

  @override
  void onError(e) => presenter.onErrorGetUsers(e);

  @override
  void onNext(List<User>? response) {
    final users = response ?? [];
    presenter.onSuccessGetUsers(users);
  }
}
