import 'package:flutter_riverpod/flutter_riverpod.dart';

// For hover
final intrestHoverSelectionPod = StateProvider.family<bool, String>((ref, name) => false);

// For selected interests (global list)
final selectedInterestsProvider = StateProvider<List<String>>((ref) => []);
