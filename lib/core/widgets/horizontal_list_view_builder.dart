import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar_ui/core/extensions/context_extensions.dart';
import 'package:nectar_ui/core/navigator/app_router.dart';
import 'package:nectar_ui/core/padding/app_padding.dart';
import 'package:nectar_ui/core/widgets/snack_bars.dart';
import 'package:provider/provider.dart';

import '../constant/app_constant.dart';
import '../constant/icon_enum.dart';
import '../helper/db_helper.dart';
import '../helper/text_scale_size.dart';
import '../models/cart_model.dart';
import '../models/category_product.dart';
import '../models/query_snapshot.dart';
import '../providers/cart_provider.dart';

class HorizontalListView extends StatefulWidget {
  final QuerySnapshot<CategoryProduct> data;

  const HorizontalListView({Key? key, required this.data}) : super(key: key);

  @override
  State<HorizontalListView> createState() => _HorizontalListViewState();
}

class _HorizontalListViewState extends State<HorizontalListView> {
  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        cacheExtent: 250,
        itemExtent: 170,
        itemCount: node.entities!.length,
        itemBuilder: (context, index) {
          var dataItem = node.entities![index];
          return Padding(
            padding: const AppPadding.onlyRight(),
            child: InkWell(
              onTap: () =>
                  context.router.push(ProductDetailsRoute(data: dataItem)),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: const Color(0xffE2E2E2),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Padding(
                  padding: const AppPadding.allLow(),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: NetworkImage(
                              dataItem.image!,
                            ),
                            fit: BoxFit.contain,
                            width: context.screenWidth,
                            height: 100,
                          ),
                          Padding(
                            padding: const AppPadding.onlyTop(),
                            child: SizedBox(
                              width: context.screenWidth,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    dataItem.name!,
                                    style:
                                        Theme.of(context).textTheme.subtitle2,
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                  Text(
                                    "355ml,Price",
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        child: Text(
                          "\$${dataItem.price!}",
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.right,
                          textScaleFactor: ScaleSize.textScaleFactor(context),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: SizedBox(
                          width: 45,
                          height: 45,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: cMainColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17.0),
                              ),
                            ),
                            onPressed: () {
                              cart.addItemsIndex(dataItem.id.toString());

                              if (!cart.sameItemCheck) {
                                dbHelper!
                                    .insert(Product(
                                  id: dataItem.id.toString(),
                                  productId: dataItem.id.toString(),
                                  productName: dataItem.name!.toString(),
                                  productInitialPrice:
                                      double.parse(dataItem.price!.toString()),
                                  productPrice:
                                      double.parse(dataItem.price!.toString()),
                                  productStock: 100,
                                  productQuantity: 1,
                                  productImage: dataItem.image!.toString(),
                                ))
                                    .then((value) {
                                  cart.addTotalprice(
                                      double.parse(dataItem.price!.toString()));
                                  cart.addCounter();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      CustomSnackBar.successSnackBar);
                                }).onError((error, StackTrace stackTrace) {
                                  // print("$error");
                                });
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(CustomSnackBar.errorSnackBar);
                              }
                            },
                            child: SvgPicture.asset(
                              IconEnums.plus.toPathSvg,
                              height: 17,
                              color: cWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  QuerySnapshot<CategoryProduct> get node => widget.data;
}
