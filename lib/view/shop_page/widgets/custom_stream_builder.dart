import 'package:flutter/material.dart';
import 'package:nectar_ui/view/shop_page/widgets/custom_title_and_button.dart';

import '../../../core/models/category_product.dart';
import '../../../core/models/query_snapshot.dart';
import '../../../core/widgets/horizontal_list_view_builder.dart';

class CustomStreamBuilder extends StatelessWidget {
  final String title;
  final Stream<QuerySnapshot<CategoryProduct>> stream;

  const CustomStreamBuilder({
    Key? key,
    required this.stream,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<CategoryProduct>>(
        stream: stream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<CategoryProduct>> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = snapshot.requireData;
          return Column(
            children: [
              CustomTitleAndButton(
                title: title,
                data: data,
              ),
              HorizontalListView(data: data),
            ],
          );
        });
  }
}
