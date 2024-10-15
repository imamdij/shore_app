
part of '../pages/welcome/register_screen.dart';

class TextFieldWidget extends StatelessWidget {

  String hint;
  Widget? suffix;
  bool? obscureText;


  TextFieldWidget({
    required this.hint,
    this.suffix,
    this.obscureText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
            vertical: 18.0, horizontal: 24),
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.hintText),
        filled: true,
        suffixIcon: suffix,
        fillColor: AppColors.background,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
              color: AppColors.borderField, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
          const BorderSide(color: AppColors.desc, width: 1.5),
        ),
      ),
      style:
      const TextStyle(color: AppColors.primary, fontSize: 16),
    );
  }
}
