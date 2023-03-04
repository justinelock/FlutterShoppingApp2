import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nectar_ui/core/extensions/double_extensions.dart';
import 'package:nectar_ui/core/padding/app_padding.dart';
import 'package:nectar_ui/view/shop_page/widgets/custom_dots.dart';
import 'package:nectar_ui/view/shop_page/widgets/custom_stream_builder.dart';
import '../../../core/constant/icon_enum.dart';
import 'package:nectar_ui/core/extensions/string_extensions.dart';

import '../../core/models/banner.dart';
import '../../core/models/query_snapshot.dart';
import '../../core/services/firestore.dart';
import '../../core/init/lang/locale_keys.g.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //var _currentIndex = 0;

  ValueNotifier<int> valueNotifier = ValueNotifier(0);

  @override
  void dispose() {
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Padding(
          padding: const AppPadding.onlyTop(),
          child: Column(
            children: [
              IconEnums.logo.toImage,
              10.0.sizedBoxOnlyHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconEnums.location.toImage,
                  Padding(
                    padding: const AppPadding.onlyLeft(),
                    child: Text(
                      "Pasay",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const AppPadding.symmetric(),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot<Banners>>(
                  stream: FireCloudStore.banner(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot<Banners>> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    //final data = snapshot.requireData;
                    final List<Banners> dataItems =
                        snapshot.requireData.entities!;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CarouselSlider.builder(
                          itemCount: dataItems.length,
                          options: customCarouselOptions(),
                          itemBuilder: (ctx, index, realIdx) {
                            Banners dataItem = dataItems[index];
                            return InkWell(
                              onTap: () {},
                              child: Image.network(
                                dataItem.image!,
                                height: 100,
                                fit: BoxFit.fitWidth,
                              ),
                            );
                          },
                        ),

                        /// banner dot
                        ValueListenableBuilder(
                          valueListenable: valueNotifier,
                          builder: (BuildContext context, int value, Widget? child) {
                            return CustomDots(
                              dataSize: dataItems.length,
                              currentIndex: value,
                            );
                          },
                        ),
                      ],
                    );
                  }),
              CustomStreamBuilder(
                title: LocaleKeys.shop_exclusiveOffer.locale,
                stream: FireCloudStore.exclusive(),
              ),
              CustomStreamBuilder(
                title: LocaleKeys.shop_topSeller.locale,
                stream: FireCloudStore.topSeller(),
              ),
              CustomStreamBuilder(
                title: LocaleKeys.shop_groceries.locale,
                stream: FireCloudStore.groceries(),
              ),
              20.0.sizedBoxOnlyHeight,
            ],
          ),
        ),
      ),
    );
  }

  CarouselOptions customCarouselOptions() {
    return CarouselOptions(
      enableInfiniteScroll: true,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 5),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      pauseAutoPlayOnTouch: true,
      viewportFraction: 1,
      // 0.75
      height: 100,
      enlargeCenterPage: true,
      onPageChanged: (index, reason) {
        //_currentIndex = index;
        valueNotifier.value = index;
        //setState(() {});
      },
    );
  }
}
