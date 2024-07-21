import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarNotifier extends StateNotifier<int> {
  NavBarNotifier() : super(0);

  void setPage(int x) {
    state = x;
  }
}

final navBarProvider = StateNotifierProvider<NavBarNotifier, int>(
  (_) {
    return NavBarNotifier();
  },
);
