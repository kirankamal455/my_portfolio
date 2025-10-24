import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kiran_portfolio/const/datas.dart';
import 'package:kiran_portfolio/data/model/profile_model.dart';

final profileProvider = Provider<Profile>((ref) {
  final profileResponse = ProfileResponse.fromJson( details);
  return profileResponse.data;
});