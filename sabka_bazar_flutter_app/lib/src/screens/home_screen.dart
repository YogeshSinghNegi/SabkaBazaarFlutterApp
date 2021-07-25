import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:sabka_bazar_flutter_app/components/app_button.dart';
import 'package:sabka_bazar_flutter_app/components/app_divider.dart';
import 'package:sabka_bazar_flutter_app/components/copyright_widget.dart';
import 'package:sabka_bazar_flutter_app/components/my_app_bar.dart';
import 'package:sabka_bazar_flutter_app/screens/product_list_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _controller;
  var _offerModel = [
    {
      "bannerImageUrl": "assets/images/offer1.jpg",
      "bannerImageAlt": "Independence Day Deal - 25% off on shampoo",
      "isActive": true,
      "order": 1,
      "id": "5b6c38156cb7d770b7010ccc"
    },
    {
      "bannerImageUrl": "assets/images/offer2.jpg",
      "bannerImageAlt": "Independence Day Deal - Rs120 off on surf",
      "isActive": true,
      "order": 2,
      "id": "5b6c38336cb7d770b7010ccd"
    },
    {
      "bannerImageUrl": "assets/images/offer3.jpg",
      "bannerImageAlt": "Independence Day Deal - Rs99 off on domex",
      "isActive": true,
      "order": 3,
      "id": "5b6c38456cb7d770b7010cce"
    },
    {
      "bannerImageUrl": "assets/images/offer4.jpg",
      "bannerImageAlt": "Independence Day Deal - Rs99 off on bodywash",
      "isActive": true,
      "order": 4,
      "id": "5b6c38576cb7d770b7010ccf"
    },
    {
      "bannerImageUrl": "assets/images/offer5.jpg",
      "bannerImageAlt": "Independence Day Deal - Rs70 off on tea",
      "isActive": true,
      "order": 5,
      "id": "5b6c386b6cb7d770b7010cd0"
    }
  ];
  var _categoryModel = [
    {
      "name": "Beverages",
      "key": "beverages",
      "description":
          "Our beverage department will ensure your fridge is always fully stocked. Shop for soda, juice, beer and more. ",
      "enabled": true,
      "order": 3,
      "imageUrl": "assets/images/beverages.png",
      "id": "5b675e5e5936635728f9fc30"
    },
    {
      "name": "Bakery Cakes and Dairy",
      "key": "bakery-cakes-dairy",
      "description":
          "The best cupcakes, cookies, cakes, pies, cheesecakes, fresh bread, biscotti, muffins, bagels, fresh coffee, milk and more.",
      "enabled": true,
      "order": 2,
      "imageUrl": "assets/images/bakery.png",
      "id": "5b6899123d1a866534f516de"
    },
    {
      "name": "Beauty and Hygiene",
      "key": "beauty-hygiene",
      "description":
          "Buy beauty and personal care products online in India at best prices.",
      "enabled": true,
      "order": 4,
      "imageUrl": "assets/images/beauty.png",
      "id": "5b68994e3d1a866534f516df"
    },
    {
      "name": "Baby Care",
      "key": "baby",
      "description":
          "Shop online for Baby Products, Diapers, Skin Care Products,etc.",
      "enabled": true,
      "order": 5,
      "imageUrl": "assets/images/baby.png",
      "id": "5b6899683d1a866534f516e0"
    },
    {
      "name": "Seafood",
      "key": "seafood",
      "description": "Great place to buy fresh seafood.",
      "enabled": false,
      "order": -1,
      "id": "5b68997d3d1a866534f516e1"
    },
    {
      "name": "Fruits & Vegetables",
      "key": "fruit-and-veg",
      "description": "A variety of fresh fruits and vegetables.",
      "enabled": true,
      "order": 1,
      "imageUrl": "assets/images/fruits.png",
      "id": "5b6899953d1a866534f516e2"
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController();
    _categoryModel = _categoryModel
        .where(
          (item) => item["enabled"].toString() == 'true',
        )
        .toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      body: Column(
        children: [
          Container(
            height: 180.0,
            // width: (MediaQuery.of(context).size.width),
            child: _getOfferPageWidget(),
          ),
          AppDivider(),
          Expanded(
            child: _getCategoryListView(),
          ),
          CopyrightWidget(),
        ],
      ),
    );
  }

  PageIndicatorContainer _getOfferPageWidget() {
    return PageIndicatorContainer(
      child: PageView(
        children: _getOfferImageWidget(),
        controller: _controller,
      ),
      align: IndicatorAlign.bottom,
      length: 5,
      indicatorSpace: 15.0,
      // padding: const EdgeInsets.all(10),
      indicatorColor: Colors.black12,
      indicatorSelectorColor: Colors.black,
      shape: IndicatorShape.circle(size: 8),
      // shape: IndicatorShape.roundRectangleShape(size: Size.square(12),cornerSize: Size.square(3)),
      // shape: IndicatorShape.oval(size: Size(12, 8)),
    );
  }

  List<Image> _getOfferImageWidget() {
    return _offerModel
        .map(
          (model) => Image.asset(
            model["bannerImageUrl"].toString(),
            // height: 200,
            width: (MediaQuery.of(context).size.width),
          ),
        )
        .toList();
  }

  Widget _getCategoryListView() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return AppDivider();
      },
      itemCount: _categoryModel.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
          child: Row(
            textDirection:
                index % 2 == 0 ? TextDirection.ltr : TextDirection.rtl,
            children: [
              Image.asset(
                _categoryModel[index]["imageUrl"].toString(),
                width: 150,
                height: 150,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      _categoryModel[index]["name"].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _categoryModel[index]["description"].toString(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    AppButton(
                      buttonText: _categoryModel[index]["key"].toString(),
                      onPressed: () => _categorySelected(
                        _categoryModel[index],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _categorySelected(Map model) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductListScreen(
          categoryId: model["id"],
          categoryName: model["name"],
        ),
        fullscreenDialog: true,
      ),
    );
  }
}
