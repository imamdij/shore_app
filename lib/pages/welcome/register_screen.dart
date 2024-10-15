import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skl_first/features/home/index/home.dart';
import 'package:skl_first/main.dart';
import 'package:skl_first/preference/colors.dart';
import 'package:skl_first/preference/icons.dart';

import 'login_screen.dart';

part '../../widget/input_custom.dart';

part '../../widget/button_custom.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                height: 150,
                child: Image.network(
                  'https://i.pinimg.com/564x/54/a5/b2/54a5b213c3887a3459fe22b83a474e8c.jpg',
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
                    'REGISTER',
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
                  'START THE JOURNEY NOW',
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
                    'Join the streetwear community today and be a \npart of the latest fashion trends.',
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
                const SizedBox(height: 16),
                const Text(
                  "Confirm Password",
                  style: TextStyle(
                    fontFamily: 'SequelSans',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 12),
                TextFieldWidget(
                  obscureText: isObscure1,
                  hint: '••••••••',
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure1 = !isObscure1;
                      });
                    },
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        isObscure1 ? Icons.visibility_off : Icons.visibility,
                        size: 18,
                        color: isObscure1 ? Colors.grey[800] : Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Login',
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
                  title: 'Register',
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
