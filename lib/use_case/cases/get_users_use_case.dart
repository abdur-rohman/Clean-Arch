import 'dart:async';

import 'package:clean_arch/data/repos/user_repo.dart';
import 'package:clean_arch/domain/entities/user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetUsers extends UseCase<List<User>, dynamic> {
  final UserRepository repository;

  GetUsers(this.repository);

  @override
  Future<Stream<List<User>?>> buildUseCaseStream(params) async {
    final streamController = StreamController<List<User>>();

    try {
      final users = await repository.users();
      streamController.add(users);
      streamController.close();
    } catch (e, stackTrace) {
      logger.severe('StackTrace: $stackTrace');
      streamController.addError(e, stackTrace);
    }

    return streamController.stream;
  }
}
