import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/menu.dart';
import '../../../provider/menu_provider.dart';
import '../../constant/custom_text.dart';
import '../detail/detail.dart';
import '../order/order.dart';

class Product extends ConsumerWidget {
  const Product({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MenuState state = ref.watch(menuNotifierProvider);
    if (state.status == '') {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }
    if (state.status == 'loading') {
      return const SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator()));
    }
    if (state.status == 'failed') {
      return SliverToBoxAdapter(child: Center(child: Text(state.message)));
    }
    List<Menu> menus = state.data;
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 12,
        childAspectRatio: 2 / 3.2,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final menu = menus[index];
          final imageData = state.imageData[menu.imageId];
          if (imageData != null) {
            print('Displaying image for ${menu.imageId}');
          } else {
            print('No image data to display for ${menu.imageId}');
          }
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Detail(
                            menu: menu,
                            imageData: state.imageData[menu.imageId],
                          )));
            },
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: imageData != null
                              ? Image.memory(
                                  imageData,
                                  fit: BoxFit.cover,
                                )
                              : const CircularProgressIndicator(),
                        ),
                        Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              alignment: Alignment.center,
                              height: 25,
                              width: 51,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(16),
                                      topLeft: Radius.circular(16)),
                                  color: Colors.black.withOpacity(0.2)),
                              padding: const EdgeInsets.only(left: 8),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    color: Color(0xFFFBBE21),
                                    size: 12,
                                  ),
                                  CustomText(
                                    title: menu.rate.toString(),
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: menu.title,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          CustomText(
                            title: menu.subtitle,
                            fontSize: 12,
                            color: const Color(0xFF9B9B9B),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                title: '\$${menu.price}',
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF2F4B4E),
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const Order()));
                                },
                                icon: Container(
                                    width: 28,
                                    height: 28,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFC67C4E),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        childCount: menus.length,
      ),
    );
  }
}
