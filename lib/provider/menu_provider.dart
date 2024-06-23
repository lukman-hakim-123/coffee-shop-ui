// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/menu.dart';
import '../source/menu_source.dart';

part 'menu_provider.g.dart';

@riverpod
class MenuNotifier extends _$MenuNotifier {
  @override
  MenuState build() => const MenuState('', '', []);

  fetchMenu() async {
    state = const MenuState('loading', '', []);
    final menus = await MenuSource.getMenus();

    if (menus == []) {
      state = const MenuState('failed', 'something went wrong', []);
    } else {
      state = MenuState('success', '', menus);
    }
  }
}

class MenuState extends Equatable {
  final String status;
  final String message;
  final List<Menu> data;
  const MenuState(
    this.status,
    this.message,
    this.data,
  );

  @override
  List<Object> get props => [status, message, data];
}
