import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skl_first/pages/welcome/splash_screen.dart';
import 'package:skl_first/preference/colors.dart';
import 'package:skl_first/preference/icons.dart';

part '../models/product_model.dart';

part 'section/header.dart';

part 'section/list_view.dart';

part 'category/all_product.dart';

part 'category/jacket.dart';

part 'category/hats.dart';

part 'category/scarve.dart';

part 'category/pants.dart';

part 'category/coats.dart';

part 'category/beanie.dart';

class ProductData {
  String title;
  String imageUrl;

  ProductData({required this.title, required this.imageUrl});
}

class ProductCategory {
  final String name;
  final String iconPath;

  ProductCategory({required this.name, required this.iconPath});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _activeIndex = 0;
  Widget _activeWidget = Container(); // Widget aktif untuk kategori

  // Daftar widget yang berbeda untuk setiap kategori
  final List<Widget> categoryWidgets = [
    AllProduct(), // Ganti dengan widget kategori All Product
    Jacket(), // Ganti dengan widget kategori Jacket
    Hats(), // Ganti dengan widget kategori Hats
    Scarve(), // Ganti dengan widget kategori Scarve
    Pants(), // Ganti dengan widget kategori Pants
    Coats(), // Ganti dengan widget kategori Coats
    Beanie(), // Ganti dengan widget kategori Beanie
  ];

  void _onCategoryTap(int index) {
    setState(() {
      _activeIndex = index;
      _activeWidget =
          categoryWidgets[index]; // Atur widget aktif sesuai kategori
    });
    print('Selected category: ${categories[index].name}');
  }

  @override
  void initState() {
    super.initState();
    _activeWidget =
        categoryWidgets[0]; // Set widget awal ke kategori pertama (All Product)
  }

  void updateProduct(int index, {String? newTitle, String? newImageUrl}) {
    setState(() {
      if (newTitle != null) products[index].title = newTitle;
      if (newImageUrl != null) products[index].imageUrl = newImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const HeaderWidget(),
            const SizedBox(height: 40),
            SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 32,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return ListViewCard(
                    imageUrl: products[index].imageUrl,
                    title: products[index].title,
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'CATEGORIES',
              style: TextStyle(
                  fontFamily: 'MonumentExtend',
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primary),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  categories.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: CategoryItem(
                      category: categories[index],
                      isActive: index == _activeIndex,
                      onTap: () => _onCategoryTap(index),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _activeWidget,
            const SizedBox(height: 24,)
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final ProductCategory category;
  final bool isActive;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.category,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Colors.white : Colors.grey[200],
            ),
            child: ClipOval(
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  isActive ? Colors.transparent : Colors.black.withOpacity(0.4),
                  BlendMode.srcATop,
                ),
                child: Image.network(
                  category.iconPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: TextStyle(
                fontFamily: 'SequelSans',
                color: isActive
                    ? const Color(0xffD9D9D9)
                    : const Color(0xff373737),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
