import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiran_portfolio/data/repository/user_profile/user_profile_repository.dart';

import '../../provider/user_profile_pod.dart';
import 'i_user_profile_repository.dart';


final userProfileRepositoryPod = Provider.autoDispose<IUserProfileRepository>((ref) {
  return UserProfileRepository(iUserProfileProvider: ref.watch(userProfileProviderPod));
});
