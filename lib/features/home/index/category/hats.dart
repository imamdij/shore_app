part of '../home.dart';

List<HatsCategories> hats = [
  const HatsCategories(
    title: 'Cappellino Adidas',
    price: '\$32.47',
    imageUrl:
    'https://i.pinimg.com/736x/e5/98/d4/e598d40db9ac107ee118dd0f944dd830.jpg',
  ),
  const HatsCategories(
    title: 'Sunday Coffee Club',
    price: '\$18.82',
    imageUrl:
    'https://i.pinimg.com/enabled_lo/564x/90/54/e8/9054e8b267b66a8b6d5699db0f183aa1.jpg',
  ),
  const HatsCategories(
    title: 'Knockin Logo Baseball',
    price: '\$21.02',
    imageUrl:
    'https://i.pinimg.com/564x/f9/1c/cc/f91ccc2802786a1bce87eb805c4cb615.jpg',
  ),
  const HatsCategories(
    title: 'SG Trilby Fedora',
    price: '\$39.62',
    imageUrl:
    'https://i.pinimg.com/736x/ea/a2/33/eaa23306e636a6569629f7bca093c8af.jpg',
  ),
];

class Hats extends StatelessWidget {
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
            itemCount: hats.length,
            itemBuilder: (context, index) {
              final product = hats[index];
              return HatsCategories(
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

class HatsCategories extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const HatsCategories(
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
