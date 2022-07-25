import 'package:clean_arch/data/misc/endpoints.dart';
import 'package:clean_arch/data/misc/logging_interceptor.dart';
import 'package:clean_arch/data/repos/user_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injector/injector.dart';

class DataModule {
  static registerClasses() {
    final injector = Injector.appInstance;
    injector.registerSingleton<Endpoints>(() => Endpoints());
    injector.registerDependency<Dio>(() {
      final dio = Dio();
      dio.options.baseUrl = 'https://reqres.in/api/';
      dio.options.sendTimeout = 30 * 1000;
      dio.options.connectTimeout = 30 * 1000;
      dio.options.receiveTimeout = 30 * 1000;

      if (kDebugMode) dio.interceptors.add(LoggingInterceptor());

      return dio;
    });
    injector.registerDependency<UserRepository>(
      () => UserRepositoryImpl(endpoints: injector.get(), dio: injector.get()),
    );
  }
}
