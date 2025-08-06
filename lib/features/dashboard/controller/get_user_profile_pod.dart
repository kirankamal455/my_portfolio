import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/user_profile_response_model.dart';
import '../../../data/repository/user_profile/user_profile_repo_pod.dart';


final getUserProfilePod = FutureProvider.family
    .autoDispose<UserProfileResponseModel, int>((ref, id) async {
  final result =
      await ref.watch(userProfileRepositoryPod).getUserProfile(userId: id);
  return result.when(
    (succes) {
      return succes;
    },
    (error) {
      throw error;
    },
  );
});
