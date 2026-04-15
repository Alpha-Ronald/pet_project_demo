import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home.dart';

class DashboardScreenUI extends StatefulWidget {
  const DashboardScreenUI({super.key});

  @override
  State<DashboardScreenUI> createState() => _DashboardScreenUIState();
}

class _DashboardScreenUIState extends State<DashboardScreenUI> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeSection(),
    CartSection(),
    ProfileSection(),
  ];

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

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40.r,
              backgroundColor: Colors.grey.shade300,
              child: const Icon(Icons.person, size: 40),
            ),

            SizedBox(height: 12.h),

            Text(
              "John Doe",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 20.h),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
            ),
          ],
        ),
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