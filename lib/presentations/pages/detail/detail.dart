import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../../constant/custom_button.dart';
import '../../constant/custom_text.dart';
import '../order/order.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isLiked = false;
  int selectedSize = 2;

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
                        child: Image.asset(
                          'assets/images/detail-cap-coco.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                title: 'Cappucino',
                                color: Color(0xFF2F2D2C),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              CustomText(
                                title: 'with Chocolate',
                                fontSize: 12,
                                color: Color(0xFF9B9B9B),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star_rate_rounded,
                                    color: Color(0xFFFBBE21),
                                    opticalSize: 20,
                                  ),
                                  CustomText(
                                    title: '4.8',
                                    fontSize: 16,
                                    color: Color(0xFF2F2D2C),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  CustomText(
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
                      ReadMoreText(
                          'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85 ml of fresh milk. The foamed milk is poured into the espresso, resulting in a creamy and frothy texture on top. Traditionally, cappuccinos are served in small ceramic cups and are often enjoyed as a breakfast drink or as a mid-morning pick-me-up. The balance of rich espresso, velvety milk, and airy foam makes cappuccino a beloved choice among coffee enthusiasts worldwide.',
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
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedSize = 1;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 43,
                              width: 96,
                              decoration: BoxDecoration(
                                  color: selectedSize == 1
                                      ? const Color(0xFFFFF5EE)
                                      : Colors.white,
                                  border: Border.all(
                                      color: selectedSize == 1
                                          ? const Color(0xFFC67C4E)
                                          : const Color(0xFFDEDEDE)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              child: CustomText(
                                title: 'S',
                                color: selectedSize == 1
                                    ? const Color(0xFFC67C4E)
                                    : const Color(0xFF2F2D2C),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedSize = 2;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 43,
                              width: 96,
                              decoration: BoxDecoration(
                                  color: selectedSize == 2
                                      ? const Color(0xFFFFF5EE)
                                      : Colors.white,
                                  border: Border.all(
                                      color: selectedSize == 2
                                          ? const Color(0xFFC67C4E)
                                          : const Color(0xFFDEDEDE)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              child: CustomText(
                                title: 'M',
                                color: selectedSize == 2
                                    ? const Color(0xFFC67C4E)
                                    : const Color(0xFF2F2D2C),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                selectedSize = 3;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 43,
                              width: 96,
                              decoration: BoxDecoration(
                                  color: selectedSize == 3
                                      ? const Color(0xFFFFF5EE)
                                      : Colors.white,
                                  border: Border.all(
                                      color: selectedSize == 3
                                          ? const Color(0xFFC67C4E)
                                          : const Color(0xFFDEDEDE)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              child: CustomText(
                                title: 'L',
                                color: selectedSize == 3
                                    ? const Color(0xFFC67C4E)
                                    : const Color(0xFF2F2D2C),
                              ),
                            ),
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
                    const Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          title: 'Price',
                          color: Color(0xFF9B9B9B),
                        ),
                        CustomText(
                          title: '\$ 4.53',
                          color: Color(0xFFC67C4E),
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
