import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skl_first/features/home/index/home.dart';
import 'package:skl_first/main.dart';
import 'package:skl_first/preference/colors.dart';
import 'package:skl_first/preference/icons.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<LoginScreen> {
  bool isObscure = true;
  bool isObscure1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: double.infinity,
                height: 240,
                child: Image.network(
                  'https://i.pinimg.com/564x/eb/96/bd/eb96bdd8d221965516c8b22bced922b9.jpg',
                  // URL gambar
                  fit: BoxFit
                      .cover, // Mengisi lebar penuh dengan memotong jika perlu
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SvgPicture.string(
            crown,
            height: 24,
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'LOGIN',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'MonumentExtend',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primary),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'RECLAIM \nYOUR STYLE',
                  style: TextStyle(
                      fontFamily: 'MonumentExtend',
                      fontSize: 34,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Get back into the trend and stay ahead with the \nlatest streetwear.',
                    style: TextStyle(
                        fontFamily: 'SequelSans',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: AppColors.desc),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Email",
                  style: TextStyle(
                    fontFamily: 'SequelSans',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 12),
                TextFieldWidget(
                  hint: 'example@gmail.com',
                ),
                const SizedBox(height: 16),
                const Text(
                  "Password",
                  style: TextStyle(
                    fontFamily: 'SequelSans',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 12),
                TextFieldWidget(
                  obscureText: isObscure,
                  hint: '••••••••',
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        isObscure ? Icons.visibility_off : Icons.visibility,
                        size: 18,
                        color: isObscure ? Colors.grey[800] : Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'New here? ',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 14,
                          fontFamily: 'SequelSans'),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Create your account now',
                        style: TextStyle(
                          fontFamily: 'SequelSans',
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16), // Jarak antara teks dan tombol
                // Button Register
                ButtonWidget(
                  title: 'Login',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
