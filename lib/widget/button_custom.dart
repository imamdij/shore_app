part of '../pages/welcome/register_screen.dart';

class ButtonWidget extends StatelessWidget {

  String title;
  VoidCallback? onPressed;

  ButtonWidget({

    super.key,
    required this.title,
    this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.hintText.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Material(
          color: AppColors.borderField,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: onPressed ,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(
                  vertical: 16, horizontal: 150),
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Sequel Sans',
                  color: AppColors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
