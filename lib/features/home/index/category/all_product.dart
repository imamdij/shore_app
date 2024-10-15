part of '../home.dart';

List<ProductCard> popular = [
  const ProductCard(
    title: 'Beo Suit Pants',
    price: '\$50.45',
    imageUrl:
    'https://i.pinimg.com/enabled_lo/736x/0c/f8/91/0cf8910191b3d4770dd9a3343a1919c0.jpg',
  ),
  const ProductCard(
    title: 'Balenciaga Knitted Blazer',
    price: '\$88.63',
    imageUrl:
    'https://i.pinimg.com/enabled_lo/564x/6b/40/5f/6b405f9d380ecd172bab1ca4d3c169b3.jpg',
  ),
  const ProductCard(
    title: 'CulturE Deconstructed',
    price: '\$25.80',
    imageUrl:
    'https://i.pinimg.com/enabled_lo/736x/4a/2a/db/4a2adb7f34b63f8f914e38c74c2f61c8.jpg',
  ),
  const ProductCard(
    title: 'Sunset Oversized Blazer',
    price: '\$47.32',
    imageUrl:
    'https://i.pinimg.com/736x/9d/9b/4c/9d9b4c8e77ed5ad474c02fce3d86a5b1.jpg',
  ),
];

class AllProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'POPULAR PRODUCTS',
            style: TextStyle(
                fontFamily: 'MonumentExtend',
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: AppColors.primary),
          ),
        ),
        const SizedBox(height: 4,),
        GestureDetector(
          onTap: (){
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
            itemCount: popular.length,
            itemBuilder: (context, index) {
              final product = popular[index];
              return ProductCard(
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

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard(
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
                  fontWeight: FontWeight.w400,
              ),
            ),
          ],
        );
      },
    );
  }
}
