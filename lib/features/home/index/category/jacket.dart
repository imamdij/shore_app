part of '../home.dart';

List<JacketCategories> jacket = [
  const JacketCategories(
    title: 'Buckle Biker Jacket',
    price: '\$102.78',
    imageUrl:
    'https://i.pinimg.com/enabled_lo/564x/dd/2c/d3/dd2cd3becf0b1a6daa379f2289ada911.jpg',
  ),
  const JacketCategories(
    title: 'PRADA Nappa Leather',
    price: '\$93.42',
    imageUrl:
    'https://i.pinimg.com/564x/f3/8a/82/f38a82591b3c97a6ccf55b0330713935.jpg',
  ),
  const JacketCategories(
    title: 'Trousers Setup WN2614',
    price: '\$75.04',
    imageUrl:
    'https://i.pinimg.com/564x/fb/dc/14/fbdc14e79f08456c4d8b3850e505d202.jpg',
  ),
  const JacketCategories(
    title: 'Suede textured Lapel',
    price: '\$47.32',
    imageUrl:
    'https://i.pinimg.com/736x/47/1c/19/471c193b20c6b1d0a25502471d9373d2.jpg',
  ),
];

class Jacket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'RECOMMENDED',
            style: TextStyle(
                fontFamily: 'MonumentExtend',
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: AppColors.primary),
          ),
        ),
        const SizedBox(height: 4,),
        GestureDetector(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const SplashScreen(),),);
          },
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 16, left: 8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 16,
              childAspectRatio: 0.6, // Sesuaikan rasio ini
            ),
            itemCount: jacket.length,
            itemBuilder: (context, index) {
              final product = jacket[index];
              return JacketCategories(
                title: product.title,
                price: product.price,
                imageUrl: product.imageUrl,
              );
            },
          ),
        ),
      ],
    );
  }
}

class JacketCategories extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const JacketCategories(
      {super.key,
        required this.title,
        required this.price,
        required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4),
                      BlendMode.darken, // Mode pencampuran warna
                    ),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontFamily: 'SequelSans',
                  fontWeight: FontWeight.w400),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: const TextStyle(
                  color: Color(0xff6A6A6A),
                  fontSize: 14,
                  fontFamily: 'SequelSans',
                  fontWeight: FontWeight.w400),
            ),
          ],
        );
      },
    );
  }
}
