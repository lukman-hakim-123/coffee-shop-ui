import 'package:flutter/material.dart';

import '../../constant/custom_text.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Stack(
      children: [
        Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 260,
              width: double.infinity,
              // color: Colors.black,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFF131313), Color(0xFF313131)],
              )),
            )),
        Positioned(
            left: 20,
            right: 20,
            top: 35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      title: 'Location',
                      color: Color(0xFFB7B7B7),
                      fontSize: 12,
                    ),
                    Row(
                      children: [
                        const CustomText(
                          title: 'Bilzen, Tanjungbalai',
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFDDDDDD),
                        ),
                        Image.asset('assets/images/Arrow - Down 2.png')
                      ],
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    "assets/images/pp.png",
                    width: 44,
                    height: 44,
                  ),
                )
              ],
            )),
        Positioned(
          left: 20,
          right: 20,
          top: 100,
          child: TextFormField(
            controller: searchController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              fillColor: const Color(0xFF313131),
              filled: true,
              prefixIcon: Image.asset('assets/images/search.png'),
              label: const CustomText(
                title: 'Search coffee',
                color: Color(0xFF989898),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: Container(
                  width: 47,
                  height: 47,
                  decoration: BoxDecoration(
                      color: const Color(0xFFC67C4E),
                      borderRadius: BorderRadius.circular(12)),
                  child: Image.asset('assets/images/furnitur-icon.png'),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            left: 20,
            right: 20,
            top: 190,
            child: Stack(
              children: [
                Container(
                  height: 140,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/image 8.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                    left: 20,
                    top: 12,
                    child: Container(
                      width: 60,
                      height: 26,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Color(0xFFED5151),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: const CustomText(
                        title: 'Promo',
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    )),
                Positioned(
                  left: 20,
                  bottom: 53,
                  child: Container(
                    height: 27,
                    width: 200,
                    color: const Color(0xFF1C1C1C),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 12,
                  child: Container(
                    height: 23,
                    width: 200,
                    color: const Color(0xFF1C1C1C),
                  ),
                ),
                const Positioned(
                    left: 20,
                    top: 42,
                    child: CustomText(
                      title: 'Buy one get\none FREE',
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    )),
              ],
            ))
      ],
    );
  }
}
