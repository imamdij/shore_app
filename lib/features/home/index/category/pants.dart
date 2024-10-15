part of '../home.dart';

List<PantsCategories> pants = [
  const PantsCategories(
    title: 'ASOS DESIGN',
    price: '\$38.40',
    imageUrl:
    'https://i.pinimg.com/564x/04/9a/c6/049ac623d63229e18f244549d651ba46.jpg',
  ),
  const PantsCategories(
    title: 'Slim Traveler',
    price: '\$50.42',
    imageUrl:
    'https://i.pinimg.com/enabled_lo/736x/24/92/be/2492beadb9f0b6cd479f0ec0baf32877.jpg',
  ),
  const PantsCategories(
    title: 'Minimal Work Tapered',
    price: '\$42.09',
    imageUrl:
    'https://i.pinimg.com/736x/4a/0d/88/4a0d8868f966ec44344082f8550ba045.jpg',
  ),
  const PantsCategories(
    title: 'Gap Slim Jeans',
    price: '\$29.99',
    imageUrl:
    'https://i.pinimg.com/736x/c2/38/be/c238be67ce385c2f185b3c20f6c90d5d.jpg',
  ),
];

class Pants extends StatelessWidget {
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
            itemCount: pants.length,
            itemBuilder: (context, index) {
              final product = pants[index];
              return PantsCategories(
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

class PantsCategories extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const PantsCategories(
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
