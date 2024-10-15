import 'package:flutter/material.dart';
import 'package:skl_first/preference/colors.dart';

import 'register_screen.dart';

class Welcoming1Screen extends StatefulWidget {
  const Welcoming1Screen({super.key});

  @override
  State<Welcoming1Screen> createState() => _Welcoming1ScreenState();
}

class _Welcoming1ScreenState extends State<Welcoming1Screen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: _controller,
            scrollDirection: Axis.vertical, // Scroll vertikal
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              // Halaman 1
              Container(
                color: AppColors.background,
                child:
                    Center(child: Image.asset('assets/images/welcoming1.png')),
              ),
              // Halaman 2
              Container(
                color: AppColors.background,
                child:
                    Center(child: Image.asset('assets/images/welcoming2.png')),
              ),
              // Halaman 3
              GestureDetector(
                onTap: () {
                  // Pindah ke halaman login dengan animasi transisi
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500), // Durasi transisi
                      pageBuilder: (context, animation, secondaryAnimation) => const RegisterScreen(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        var begin = const Offset(0.0, 1.0); // Mulai dari bawah
                        var end = Offset.zero; // Akhir di posisi 0
                        var curve = Curves.easeInOut;

                        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  color: Colors.black,
                  child: Center(
                      child: Image.asset('assets/images/welcoming3.png')),
                ),
              ),
            ],
          ),
          // Indikator halaman di sebelah kiri
          Positioned(
            left: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  width: _currentPage == index ? 10 : 6,
                  height: _currentPage == index ? 10 : 6,
                  decoration: BoxDecoration(
                      color: _currentPage == index
                          ? AppColors.primary
                          : Colors.grey,
                      shape: _currentPage == index
                          ? BoxShape.rectangle
                          : BoxShape.circle // Bentuk lingkaran
                      ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
