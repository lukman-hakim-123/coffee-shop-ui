import 'package:flutter/material.dart';

import '../../constant/custom_text.dart';
import '../detail/detail.dart';

class Product extends StatelessWidget {
  const Product({
    super.key,
    required this.products,
  });

  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 12,
        childAspectRatio: 2 / 3.2,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final product = products[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Detail()));
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
                          child: Image.asset(
                            product['image'],
                            fit: BoxFit.cover,
                          ),
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
                                    title: product['star'],
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
                            title: product['name'],
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          CustomText(
                            title: product['description'],
                            fontSize: 12,
                            color: const Color(0xFF9B9B9B),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                title: product['price'],
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF2F4B4E),
                              ),
                              IconButton(
                                onPressed: () {},
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
        childCount: products.length,
      ),
    );
  }
}
