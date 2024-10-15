part of '../home.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/icon_splash.png',
          width: 150,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.string(
                search,
                width: 28,
              ),
              const SizedBox(
                width: 16,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.string(
                    notification,
                    width: 28,
                  ),
                  Positioned(
                    right: -1,
                    top: -2,
                    child: Container(
                      width: 13,
                      height: 13,
                      decoration: const BoxDecoration(
                        color: Color(0xffED7549),
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '2',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'SequelSans',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
