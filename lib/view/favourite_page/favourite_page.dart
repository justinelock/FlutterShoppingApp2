import 'package:flutter/material.dart';

import '../../../core/constant/app_constant.dart';
import '../../../core/constant/app_strings.dart';
import '../../../core/constant/icon_enum.dart';
import '../../../core/widgets/divider.dart';

class FavouritePage extends StatefulWidget {
  FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  final String _imagePath = "assets/images/png/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            Strings.favourite,
          ),
          bottom: const PreferredSize(
              preferredSize: Size.fromHeight(4.0), child: CustomDivider()),
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 150),
            child: Column(
              children: [
                _createFavouriteItems("Sprite Can", "325ml", 1.50,
                    "assets/images/png/spriteCan.png"),
                const CustomDivider(),
                _createFavouriteItems("Diet Coke", "325ml", 1.50,
                    "assets/images/png/dietCoke.png"),
                const CustomDivider(),
                _createFavouriteItems("Coca Cola Can ", "325ml", 1.50,
                    "assets/images/png/cocaCola.png"),
                const CustomDivider(),
                _createFavouriteItems("Apple & Grape Juice", "325ml", 1.50,
                    "assets/images/png/juice.png"),
                const CustomDivider(),
                _createFavouriteItems("Pepsi Can", "325ml", 1.50,
                    "assets/images/png/pepsiCan.png"),
                const CustomDivider(),
              ],
            ),
          ),
        ]),
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: const Color(0xff53B175),
              fixedSize: const Size(double.infinity, 67),
              padding: const EdgeInsets.all(5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19.0),
              ),
            ),
            onPressed: () {},
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  Strings.addAllToCart,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget _createFavouriteItems(
      String name, String kg, double price, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(imagePath,
                  height: 75, width: 75, fit: BoxFit.contain),
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Text(
                        name,
                        style: Theme.of(context).textTheme.subtitle2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "$kg, Price",
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            top: 15,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "\$1.50",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: IconEnums.rightarrow.toImage,
                      iconSize: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
