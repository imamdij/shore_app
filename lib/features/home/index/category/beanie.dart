part of '../home.dart';

List<BeanieCategories> beanie = [
  const BeanieCategories(
    title: 'Lambswool Mini Fisherman',
    price: '\$12.20',
    imageUrl:
    'https://i.pinimg.com/enabled_lo/564x/75/1a/cd/751acd7135816858aebe20c29e208cc1.jpg',
  ),
  const BeanieCategories(
    title: 'TNF Logo Cuffed',
    price: '\$20.55',
    imageUrl:
    'https://i.pinimg.com/564x/ed/4d/99/ed4d99c73673eb78e1bc6a1a1c209563.jpg',
  ),
  const BeanieCategories(
    title: 'Gorro Azul de Estilo',
    price: '\$15.02',
    imageUrl:
    'https://i.pinimg.com/736x/a2/3d/b5/a23db540974f4535e293ed586159622f.jpg',
  ),
  const BeanieCategories(
    title: 'Rhythm Standard',
    price: '\$8.99',
    imageUrl:
    'https://i.pinimg.com/736x/54/e9/4e/54e94eb7a1b0015f5f6ca8d1c851113e.jpg',
  ),
];

class Beanie extends StatelessWidget {
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
            itemCount: beanie.length,
            itemBuilder: (context, index) {
              final product = beanie[index];
              return BeanieCategories(
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

class BeanieCategories extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const BeanieCategories(
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
