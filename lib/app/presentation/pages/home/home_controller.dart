import 'package:clean_arch/app/presentation/pages/home/home_presenter.dart';
import 'package:clean_arch/domain/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomeController extends Controller {
  final HomePresenter _presenter;

  HomeController(this._presenter);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<User> _users = [];
  List<User> get users => _users;

  @override
  void initListeners() {
    _initObserver();
    _getUsers();
  }

  void _getUsers() {
    _showLoading();
    _presenter.getUsers();
  }

  void _initObserver() {
    _presenter.onErrorGetUsers = (e) {};
    _presenter.onFinishGetUsers = () {
      _hideLoading();
    };
    _presenter.onSuccessGetUsers = (List<User> data) {
      _users = data;
    };
  }

  void _showLoading() {
    _isLoading = true;
    refreshUI();
  }

  void _hideLoading() {
    _isLoading = false;
    refreshUI();
  }

  @override
  void onDisposed() {
    super.onDisposed();
    _presenter.dispose();
  }
}
