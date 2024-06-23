import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../../../models/menu.dart';
import '../../constant/custom_button.dart';
import '../../constant/custom_text.dart';
import '../order/order.dart';

class Detail extends ConsumerStatefulWidget {
  final Menu menu;
  final Uint8List? imageData;
  const Detail({super.key, required this.menu, this.imageData});

  @override
  ConsumerState<Detail> createState() => _DetailState();
}

class _DetailState extends ConsumerState<Detail> {
  bool isLiked = false;
  int selectedSize = 2;
  double price = 0;

  @override
  void initState() {
    price = widget.menu.sizeM;
    super.initState();
  }

  void _updatePrice(int size) {
    setState(() {
      selectedSize = size;
      switch (size) {
        case 1:
          price = widget.menu.sizeS;
          break;
        case 2:
          price = widget.menu.sizeM;
          break;
        case 3:
          price = widget.menu.sizeL;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            icon: SvgPicture.asset('assets/icons/ArrowLeft.svg')),
        title: const Center(
          child: CustomText(
            title: "Detail",
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
              icon: SvgPicture.asset(
                isLiked
                    ? 'assets/icons/Red-Heart.svg'
                    : 'assets/icons/Heart2.svg',
              )),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: widget.imageData != null
                            ? Image.memory(
                                widget.imageData!,
                                fit: BoxFit.fill,
                                height: 250,
                                width: double.infinity,
                              )
                            : const Icon(Icons.image_not_supported),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                title: widget.menu.title,
                                color: const Color(0xFF2F2D2C),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              CustomText(
                                title: widget.menu.subtitle,
                                fontSize: 12,
                                color: const Color(0xFF9B9B9B),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_rate_rounded,
                                    color: Color(0xFFFBBE21),
                                    opticalSize: 20,
                                  ),
                                  CustomText(
                                    title: widget.menu.rate.toString(),
                                    fontSize: 16,
                                    color: const Color(0xFF2F2D2C),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  const CustomText(
                                    title: '(230)',
                                    fontSize: 12,
                                    color: Color(0xFF808080),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            verticalDirection: VerticalDirection.down,
                            children: [
                              const SizedBox(
                                height: 35,
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    height: 44,
                                    width: 44,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFF9F9F9),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14))),
                                    child:
                                        Image.asset('assets/images/bean.png'),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    height: 44,
                                    width: 44,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFF9F9F9),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14))),
                                    child:
                                        Image.asset('assets/images/milk.png'),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      const Divider(
                        height: 40,
                        thickness: 1,
                        color: Color(0xFFEAEAEA),
                      ),
                      const CustomText(
                        title: 'Description',
                        fontSize: 16,
                        color: Color(0xFF2F2D2C),
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ReadMoreText(widget.menu.description,
                          trimMode: TrimMode.Line,
                          trimLines: 3,
                          colorClickableText: const Color(0xFFC67C4E),
                          trimCollapsedText: 'Read more',
                          trimExpandedText: ' Read less',
                          moreStyle: GoogleFonts.sora(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFC67C4E))),
                          lessStyle: GoogleFonts.sora(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFC67C4E))),
                          style: GoogleFonts.sora(
                            textStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF9B9B9B)),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomText(
                        title: 'Size',
                        fontSize: 16,
                        color: Color(0xFF2F2D2C),
                        fontWeight: FontWeight.w700,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizeButton(
                            title: 'S',
                            isSelected: selectedSize == 1,
                            onTap: () => _updatePrice(1),
                          ),
                          SizedBox(width: 8),
                          SizeButton(
                            title: 'M',
                            isSelected: selectedSize == 2,
                            onTap: () => _updatePrice(2),
                          ),
                          SizedBox(width: 8),
                          SizeButton(
                            title: 'L',
                            isSelected: selectedSize == 3,
                            onTap: () => _updatePrice(3),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFF1F1F1)),
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const CustomText(
                          title: 'Price',
                          color: Color(0xFF9B9B9B),
                        ),
                        CustomText(
                          title: '\$ $price',
                          color: const Color(0xFFC67C4E),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )
                      ],
                    ),
                    CustomButton(
                      title: 'Buy Now',
                      width: 220,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const Order()));
                      },
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class SizeButton extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SizeButton({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 43,
        width: 96,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF5EE) : Colors.white,
          border: Border.all(
            color:
                isSelected ? const Color(0xFFC67C4E) : const Color(0xFFDEDEDE),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Text(
          title,
          style: TextStyle(
            color:
                isSelected ? const Color(0xFFC67C4E) : const Color(0xFF2F2D2C),
          ),
        ),
      ),
    );
  }
}
