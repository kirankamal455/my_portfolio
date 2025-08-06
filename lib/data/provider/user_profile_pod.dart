import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiran_portfolio/data/provider/user_profile_provider.dart';

import '../../shared/api_client/dio/dio_client_provider.dart';
import 'i_user_profile_provider.dart';


final userProfileProviderPod = Provider.autoDispose<IUserProfileProvider>((ref) {
  return UserProfileProvider(
    dio: ref.watch(dioProvider),
    
  );
});
