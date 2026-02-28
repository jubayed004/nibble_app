import 'package:flutter_riverpod/flutter_riverpod.dart';

final commonProvider = StateNotifierProvider<CommonNotifier, bool>(
  (ref) => CommonNotifier(),
);

class CommonNotifier extends StateNotifier<bool> {
  CommonNotifier() : super(false); // false = isUser (Customer)
  void setIsUser(bool value) => state = value;
}
