// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:multiple_result/src/result.dart';

import '../../model/user_profile_response_model.dart';
import '../../provider/i_user_profile_provider.dart';
import 'i_user_profile_repository.dart';

class UserProfileRepository implements IUserProfileRepository {
  final IUserProfileProvider iUserProfileProvider;
  UserProfileRepository({
    required this.iUserProfileProvider,
  });

  @override
  Future<Result<UserProfileResponseModel, Exception>> getUserProfile(
      {required int userId}) async {
    final result = await iUserProfileProvider.getUserProfile(userId: userId);
    // final List<Project> mockProjects = [
    //   Project(
    //     id: 1,
    //     projectName: "Smart Home Automation",
    //     description: "An IoT based project to automate home appliances.",
    //     userProfileId: 101,
    //   ),
    //   Project(
    //     id: 2,
    //     projectName: "E-commerce App",
    //     description: "A mobile app for shopping with payment integration.",
    //     userProfileId: 101,
    //   ),
    //   Project(
    //     id: 3,
    //     projectName: "Weather Forecast System",
    //     description: "Displays real-time weather data using APIs.",
    //     userProfileId: 101,
    //   ),
    // ];
    final UserProfileResponseModel mockUserProfile = UserProfileResponseModel(
      name: "Kiran Kamal",
      address: "1234 Elm Street, Springfield",
      phone: "+1 555-1234",
      email: "john.doe@example.com",
      image: "https://example.com/images/john_doe.jpg",
      projects: [],
    );
    if (result.statusCode == 200) {
      return Result.success(mockUserProfile);
      // return Result.success(UserProfileResponseModel.fromMap(result.data));
    } else {
      return Result.success(mockUserProfile);

      //Result.error(Exception(" ${result.statusMessage}"));
    }
  }
}
