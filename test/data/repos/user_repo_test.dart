import 'package:clean_arch/data/misc/endpoints.dart';
import 'package:clean_arch/data/repos/user_repo.dart';
import 'package:clean_arch/domain/entities/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../stub/response/user_response.dart';
import 'user_repo_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  group(
    'User Repository',
    () {
      test('Should return List of User from dio', () async {
        final Endpoints endpoints = Endpoints();
        final Dio dio = MockDio();
        final UserRepository userRepository = UserRepositoryImpl(
          endpoints: endpoints,
          dio: dio,
        );

        when(dio.get(endpoints.users)).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: ''),
            data: <String, dynamic>{
              'data': [userResponse, userResponse, userResponse, userResponse]
            },
          ),
        );

        final users = await userRepository.users();
        expect(users, isA<List<User>>());
      });

      test('Should return Empty list of user from dio', () async {
        final Endpoints endpoints = Endpoints();
        final Dio dio = MockDio();
        final UserRepository userRepository = UserRepositoryImpl(
          endpoints: endpoints,
          dio: dio,
        );

        when(dio.get(endpoints.users)).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: ''),
            data: <String, dynamic>{'data': []},
          ),
        );

        final users = await userRepository.users();
        expect(users.length, 0);
      });
    },
  );
}
