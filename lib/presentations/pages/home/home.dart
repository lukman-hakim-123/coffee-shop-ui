import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'categories.dart';
import 'heading_home.dart';
import 'product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> categories = [
    'All',
    'Cappuccino',
    'Machiato',
    'Latte',
    'Americano'
  ];

  final List<Map<String, dynamic>> products = [
    {
      'image': 'assets/images/cap-chocolate.png',
      'name': 'Cappucino',
      'description': 'with Chocolate',
      'star': '4.8',
      'price': '\$ 4.53',
    },
    {
      'image': 'assets/images/cap-oat-milk.png',
      'name': 'Cappucino',
      'description': 'with Oat Milk',
      'star': '4.9',
      'price': '\$ 3.90',
    },
    {
      'image': 'assets/images/cap-choco.png',
      'name': 'Cappucino',
      'description': 'with Chocolate',
      'star': '4.5',
      'price': '\$ 4.53',
    },
    {
      'image': 'assets/images/cap-milk.png',
      'name': 'Cappucino',
      'description': 'with Chocolate',
      'star': '4.0',
      'price': '\$ 3.90',
    },
  ];

  final List<String> menuItems = [
    'assets/icons/Home.svg',
    'assets/icons/Heart.svg',
    'assets/icons/Bag 2.svg',
    'assets/icons/Notification.svg',
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4EDFA),
      body: SafeArea(
          child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 343,
              child: HeaderHome(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 37,
              child: Categories(categories: categories),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
            sliver: Product(products: products),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
          ),
        ],
      )),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 32,
          type: BottomNavigationBarType.fixed,
          items: List.generate(
            menuItems.length,
            (index) {
              return BottomNavigationBarItem(
                  activeIcon: Column(
                    children: [
                      SvgPicture.asset(
                        menuItems[index],
                        colorFilter: const ColorFilter.mode(
                            Color(0xFFC67C4E), BlendMode.srcIn),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SvgPicture.asset('assets/icons/dotbottombar.svg')
                    ],
                  ),
                  icon: SvgPicture.asset(
                    menuItems[index],
                  ),
                  label: '');
            },
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
