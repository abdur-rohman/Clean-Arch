import 'package:clean_arch/data/misc/endpoints.dart';
import 'package:clean_arch/domain/entities/user.dart';
import 'package:dio/dio.dart';

abstract class UserRepository {
  Future<List<User>> users();
}

class UserRepositoryImpl implements UserRepository {
  final Endpoints endpoints;
  final Dio dio;

  UserRepositoryImpl({required this.endpoints, required this.dio});

  @override
  Future<List<User>> users() async {
    try {
      final response = await dio.get(endpoints.users);
      final usersResponse = response.data['data'] as List<dynamic>;
      final users = usersResponse
          .map(
            (dynamic response) => User.fromResponse(response),
          )
          .toList();
      return users;
    } catch (e) {
      rethrow;
    }
  }
}
