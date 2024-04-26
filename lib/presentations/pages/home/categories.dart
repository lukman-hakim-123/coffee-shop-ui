import 'package:flutter/material.dart';

import '../../constant/custom_text.dart';

class Categories extends StatefulWidget {
  const Categories({
    super.key,
    required this.categories,
  });

  final List<String> categories;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          EdgeInsets itemPadding =
              const EdgeInsets.symmetric(horizontal: 4, vertical: 2);

          if (index == 0) {
            itemPadding =
                const EdgeInsets.only(left: 20, right: 4, top: 1, bottom: 1);
          } else if (index == widget.categories.length - 1) {
            itemPadding =
                const EdgeInsets.only(left: 4, right: 20, top: 1, bottom: 1);
          }

          bool isSelected = selectedIndex == index;

          return Padding(
            padding: itemPadding,
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: isSelected ? const Color(0xFFC67C4E) : Colors.white),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: CustomText(
                  title: widget.categories[index],
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        });
  }
}
