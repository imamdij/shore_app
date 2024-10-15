import 'package:flutter/material.dart';
import 'package:skl_first/features/profile/profile.dart';
import 'package:skl_first/features/wishlist/wishlist.dart';
import 'package:skl_first/preference/colors.dart';

import 'features/home/index/home.dart';
import 'features/message/message.dart';
import 'pages/welcome/splash_screen.dart';
import 'preference/icons.dart';
import 'preference/images.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shore',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int selectedIndex = 0;

  IconButton buildItemNav(IconData icon, int index) {
    return IconButton(
      onPressed: () {
        setState(() {
          selectedIndex = index;
        });
      },
      icon: Icon(
        icon,
        color: selectedIndex == index ? AppColors.primary : const Color(0xff585858),
      ),
    );
  }

  List<Widget> pages = [
    const HomePage(),
    const MessagePage(),
    const WishlistPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: pages[selectedIndex],
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {},
        backgroundColor: const Color(0xffED7549),
        shape: const CircleBorder(),
        child: Image.asset(AppImage.cart, width: 25,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          height: 80,
          color: const Color(0xff282828),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildItemNav(CustomIcon.homeIcon, 0),
              buildItemNav(CustomIcon.chatIcon, 1),
              const SizedBox(
                width: 50,
              ),
              buildItemNav(CustomIcon.likeIcon, 2),
              buildItemNav(CustomIcon.profileIcon, 3),
            ],
          ),
        ),
      ),
    );
  }
}


