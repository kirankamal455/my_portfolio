import 'package:dio/dio.dart';

abstract class IUserProfileProvider {
  Future<Response> getUserProfile({required int userId});
}
