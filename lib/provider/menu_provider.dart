// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/menu.dart';
import '../source/menu_source.dart';

part 'menu_provider.g.dart';

@riverpod
class MenuNotifier extends _$MenuNotifier {
  @override
  MenuState build() => const MenuState('', '', [], {});

  Future<void> fetchMenu() async {
    state = MenuState('loading', '', const [], state.imageData);
    final menus = await MenuSource.getMenus();

    if (menus == []) {
      state = MenuState(
          'failed', 'something went wrong', const [], state.imageData);
    } else {
      state = MenuState('success', '', menus, state.imageData);
      await _fetchImage(menus);
    }
  }

  Future<void> _fetchImage(List<Menu> menus) async {
    final Map<String, Uint8List?> imageData = {};
    for (final menu in menus) {
      if (menu.imageId.isNotEmpty) {
        final data = await MenuSource.getImage(menu.imageId);
        if (data != null) {
          print('Image data fetched for ${menu.imageId}');
        } else {
          print('No image data for ${menu.imageId}');
        }
        imageData[menu.imageId] = data;
      }
    }
    state = MenuState(state.status, state.message, state.data, imageData);
  }

  Uint8List? getImageData(String imageId) {
    return state.imageData[imageId];
  }
}

class MenuState extends Equatable {
  final String status;
  final String message;
  final List<Menu> data;
  final Map<String, Uint8List?> imageData;
  const MenuState(
    this.status,
    this.message,
    this.data,
    this.imageData,
  );

  @override
  List<Object> get props => [status, message, data, imageData];
}
