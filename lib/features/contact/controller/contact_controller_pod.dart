import 'package:flutter_riverpod/flutter_riverpod.dart';

final cardSelectPod =
    StateProvider.autoDispose.family<bool, String>((ref, key) {
  return false;
});
