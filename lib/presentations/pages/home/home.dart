import 'package:coffee_shop/provider/menu_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'categories.dart';
import 'heading_home.dart';
import 'product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  final List<String> categories = [
    'All',
    'Cappuccino',
    'Machiato',
    'Latte',
    'Americano'
  ];

  final List<String> menuItems = [
    'assets/icons/Home.svg',
    'assets/icons/Heart.svg',
    'assets/icons/Bag 2.svg',
    'assets/icons/Notification.svg',
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(menuNotifierProvider.notifier).fetchMenu();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
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
          const SliverPadding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 16),
            sliver: Product(),
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
