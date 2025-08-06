import 'package:flutter_riverpod/flutter_riverpod.dart';

final intrestHoverSelectionPod =
    StateProvider.autoDispose.family<bool, String>((ref, arg) {
  return false;
});

// bool check({required String arg}) {
//   if (arg == 'Mobile Development') {
//     return true;
//   } else {
//     return false;
//   }
// }
