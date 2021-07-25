import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:sabka_bazar_flutter_app/src/Model/categoryModel.dart';
import 'package:sabka_bazar_flutter_app/src/Model/offerModel.dart';
import 'package:sabka_bazar_flutter_app/src/bloc/home_bloc.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_button.dart';
import 'package:sabka_bazar_flutter_app/src/components/app_divider.dart';
import 'package:sabka_bazar_flutter_app/src/components/copyright_widget.dart';
import 'package:sabka_bazar_flutter_app/src/components/my_app_bar.dart';
import 'package:sabka_bazar_flutter_app/src/screens/product_list_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = "/home";

  const HomeScreen({Key? key}) : super(key: key);

  // @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    bloc.fetchAllOffers();
    bloc.fetchAllCategories();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    bloc.dispose();
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
            child: StreamBuilder(
              stream: bloc.allOffers,
              builder: (context, AsyncSnapshot<List<OfferModel>> snapshot) {
                if (snapshot.hasData) {
                  return buildOfferList(snapshot);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          AppDivider(),
          Expanded(
            child: StreamBuilder(
              stream: bloc.allCategory,
              builder: (context, AsyncSnapshot<List<CategoryModel>> snapshot) {
                if (snapshot.hasData) {
                  return buildCategoryList(snapshot);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
          ),
          CopyrightWidget(),
        ],
      ),
    );
  }

  Widget buildOfferList(AsyncSnapshot<List<OfferModel>> snapshot) {
    return _getOfferPageWidget(snapshot);
  }

  Widget buildCategoryList(AsyncSnapshot<List<CategoryModel>> snapshot) {
    return _getCategoryListView(snapshot);
  }

  PageIndicatorContainer _getOfferPageWidget(
      AsyncSnapshot<List<OfferModel>> snapshot) {
    return PageIndicatorContainer(
      child: PageView(
        children: _getOfferImageWidget(snapshot),
        controller: _controller,
      ),
      align: IndicatorAlign.bottom,
      length: snapshot.data!.length,
      indicatorSpace: 15.0,
      indicatorColor: Colors.black12,
      indicatorSelectorColor: Colors.black,
      shape: IndicatorShape.circle(size: 8),
    );
  }

  List<Image> _getOfferImageWidget(AsyncSnapshot<List<OfferModel>> snapshot) {
    var model123 = snapshot.data!;
    return model123
        .map(
          (model) => Image.asset(
            model.bannerImageUrl.toString(),
            width: (MediaQuery.of(context).size.width),
          ),
        )
        .toList();
  }

  Widget _getCategoryListView(AsyncSnapshot<List<CategoryModel>> snapshot) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return AppDivider();
      },
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
          child: Row(
            textDirection:
                index % 2 == 0 ? TextDirection.ltr : TextDirection.rtl,
            children: [
              // TODO: Image IS BREAKING PLEASE CHECK IT
              // Image.asset(
              //   snapshot.data![index].imageUrl.toString(),
              //   width: 150,
              //   height: 150,
              // ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      snapshot.data![index].name.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      snapshot.data![index].description.toString(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    AppButton(
                      buttonText: snapshot.data![index].key.toString(),
                      onPressed: () => _categorySelected(
                        snapshot.data![index],
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

  void _categorySelected(CategoryModel model) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductListScreen(
          categoryId: model.id ?? '12',
          categoryName: model.name ?? 'qwerty',
        ),
        fullscreenDialog: true,
      ),
    );
  }
}
