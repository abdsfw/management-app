import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangment_app/core/widget/custom_search_field.dart';
import 'package:mangment_app/feature/home/presentation/views/widgets/item_product_row.dart';
import '../../../../../core/widget/custom_expanded_text.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/home_cubit/home_cubit.dart';

class ProductBody extends StatelessWidget {
  const ProductBody({
    super.key,
    required this.categoryId,
  });
  final int categoryId;
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return Column(
      children: [
        // TextFormField(),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomSearchField(
            controller: homeCubit.searchController,
            hintText: S.of(context).search, //"search",
            onChange: (x) {
              homeCubit.searchItem(query: x);
            },
          ),
        ),
        const RowNameOfColumns(),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (homeCubit.currentProductList.isEmpty) {
              return Expanded(
                child: Center(
                  child: Text(
                    S.of(context).no_product_yet, //  "no product yet",
                  ),
                ),
              );
            }
            return Expanded(
              child: ListView.builder(
                itemCount: homeCubit.currentProductList.length,
                itemBuilder: (context, index) => ItemProductRow(
                  index: index,
                  categoryId: categoryId,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class RowNameOfColumns extends StatelessWidget {
  const RowNameOfColumns({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          CustomExpandedText(
            title: S.of(context).name_of_product, //"name Of product",
            fontWeight: FontWeight.bold,
          ),
          CustomExpandedText(
            title: S.of(context).price_of_buy, //"price of buy",
            fontWeight: FontWeight.bold,
          ),
          CustomExpandedText(
            title: S.of(context).price_of_sell, //"price of sell",
            fontWeight: FontWeight.bold,
          ),
          CustomExpandedText(
            title: S.of(context).quantity, // "quantity",
            fontWeight: FontWeight.bold,
          ),
          CustomExpandedText(
            title:
                S.of(context).old_quantity, //"الكمية القديمة", // "quantity",
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
