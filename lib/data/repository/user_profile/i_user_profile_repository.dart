 import 'package:multiple_result/multiple_result.dart';

import '../../model/user_profile_response_model.dart';

abstract class IUserProfileRepository {
Future<Result<UserProfileResponseModel,Exception>> getUserProfile({required int userId});
}
