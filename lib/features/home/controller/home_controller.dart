import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeControllerProvider = StateNotifierProvider<HomeNotifier, HomeState>(
  (ref) => HomeNotifier(),
);

class HomeState {
  const HomeState();
}

class HomeNotifier extends StateNotifier<HomeState> {
  HomeNotifier() : super(const HomeState());
}
