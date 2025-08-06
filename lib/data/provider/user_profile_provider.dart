// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'i_user_profile_provider.dart';

class UserProfileProvider implements IUserProfileProvider {
  final Dio dio;
  UserProfileProvider({
    required this.dio,
  });

  @override
  Future<Response> getUserProfile({required int userId}) async {
    return await dio
        .get('http://localhost:5150/getUser', queryParameters: {'userId': 1});
    // return dio.get(AppURLs.getUserProfile, queryParameters: {
    //   'userId': userId,
    // });
  }
}
