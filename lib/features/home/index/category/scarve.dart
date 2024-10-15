part of '../home.dart';

List<ScarveCategories> scarve = [
  const ScarveCategories(
    title: 'Rhea Bandana',
    price: '\$23.92',
    imageUrl:
    'https://i.pinimg.com/enabled_lo/736x/f1/49/33/f1493342a5e5c029a75730838c27d34d.jpg',
  ),
  const ScarveCategories(
    title: 'Wild Spray Coral',
    price: '\$28.35',
    imageUrl:
    'https://i.pinimg.com/736x/86/70/8f/86708f41c3a21598d71200c62d7ea89f.jpg',
  ),
  const ScarveCategories(
    title: 'Ante Cashmere',
    price: '\$19.98',
    imageUrl:
    'https://i.pinimg.com/564x/35/45/82/354582462331c5d30bebaf3166805388.jpg',
  ),
  const ScarveCategories(
    title: 'Fringed Checked Wool',
    price: '\$25.55',
    imageUrl:
    'https://i.pinimg.com/736x/9f/19/96/9f1996f7d338b2f711808876445b5a3b.jpg',
  ),
];

class Scarve extends StatelessWidget {
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
            itemCount: scarve.length,
            itemBuilder: (context, index) {
              final product = scarve[index];
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

class ScarveCategories extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ScarveCategories(
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
