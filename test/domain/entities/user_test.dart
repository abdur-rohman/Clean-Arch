import 'package:clean_arch/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../stub/response/user_response.dart';

void main() {
  group('User Entity', () {
    // When, Should, Then
    // Should
    test(
      'Should return User domain from response',
      () {
        final response = userResponse;
        final userDomain = User.fromResponse(response);

        expect(userDomain.id, response['id']);
        expect(userDomain.email, response['email']);
        expect(userDomain.image, response['avatar']);
        final userFirstName = response['first_name'];
        final userLastName = response['last_name'];
        final userFullName = '$userFirstName $userLastName';
        expect(userDomain.fullName, userFullName);
      },
    );

    test(
      'Should return User domain from empty response',
      () {
        final response = <String, dynamic>{};
        final userDomain = User.fromResponse(response);

        final userDomainId = response['id'] ?? 0;
        expect(userDomain.id, userDomainId);

        final userDomainEmail = response['email'] ?? '';
        expect(userDomain.email, userDomainEmail);

        final userDomainImage = response['avatar'] ?? '';
        expect(userDomain.image, userDomainImage);

        final userFirstName = response['first_name'] ?? '';
        final userLastName = response['last_name'] ?? '';
        final userFullName = '$userFirstName $userLastName';
        expect(userDomain.fullName, userFullName);
      },
    );
  });
}
