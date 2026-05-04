import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/features/dashboard/profile_screen.dart';

import '../../services/user_provider.dart';
import 'home.dart';

class DashboardScreenUI extends ConsumerStatefulWidget {
  const DashboardScreenUI({super.key});



  @override
  ConsumerState<DashboardScreenUI> createState() => _DashboardScreenUIState();
}

class _DashboardScreenUIState extends ConsumerState<DashboardScreenUI> {
  int _currentIndex = 0;

  late final List<Widget> _pages =  [
    HomeSection(),
    CartSection(),
    ProfileSection(),
  ];

  @override
  void initState() {
    super.initState();

    Future.microtask((){
      ref.read(userProvider.notifier).fetchUser();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF001233),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}



class CartSection extends StatelessWidget {
  const CartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Your Cart is Empty 🛒",
        style: TextStyle(fontSize: 16.sp),
      ),
    );
  }
}