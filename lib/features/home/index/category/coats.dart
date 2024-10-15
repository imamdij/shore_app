part of '../home.dart';

List<CoatsCategories> coats = [
  const CoatsCategories(
    title: 'Italian Wool-Blend',
    price: '\$63.80',
    imageUrl:
    'https://i.pinimg.com/736x/81/f4/33/81f4335cff71e71b03a2119062fe223e.jpg',
  ),
  const CoatsCategories(
    title: 'Water-Resistant Trench',
    price: '\$55.99',
    imageUrl:
    'https://i.pinimg.com/enabled_lo/564x/0c/4b/be/0c4bbe04266d156bf8ee2e5f9e49e037.jpg',
  ),
  const CoatsCategories(
    title: 'Alpaca Balmacaan',
    price: '\$68.05',
    imageUrl:
    'https://i.pinimg.com/564x/81/a5/ab/81a5ab1ca08dc453787969d03fb7686f.jpg',
  ),
  const CoatsCategories(
    title: 'Khaki Trench',
    price: '\$52.73',
    imageUrl:
    'https://i.pinimg.com/564x/2f/39/5b/2f395bbdd1de0e9105cff5ea1e16159b.jpg',
  ),
];

class Coats extends StatelessWidget {
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
            itemCount: coats.length,
            itemBuilder: (context, index) {
              final product = coats[index];
              return CoatsCategories(
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

class CoatsCategories extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const CoatsCategories(
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
