import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mangment_app/core/utils/app_function.dart';
import 'package:mangment_app/core/widget/custom_app_card.dart';
import 'package:mangment_app/feature/home/presentation/views/item_prdouct_page.dart';

import '../../../../../core/utils/helper_functions.dart';
import '../../../../../core/widget/custom_expanded_text.dart';
import '../../../../../core/widget/custom_input_field.dart';
import '../../manager/home_cubit/home_cubit.dart';

class ItemProductRow extends StatelessWidget {
  const ItemProductRow({
    super.key,
    required this.index,
    required this.categoryId,
  });
  final int index;
  final int categoryId;
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return Card(
      child: InkWell(
        onDoubleTap: () {
          homeCubit
              .initProductEditController(homeCubit.currentProductList[index]);
          AppFunction.editItemProductDialogFun(context, homeCubit, index,
              categoryId: categoryId);
        },
        onTap: () {
          homeCubit.itemQuantityForEdit =
              homeCubit.currentProductList[index].quantity ?? -1;
          HelperFunctions.navigateToScreen(
              context,
              ItemProductPage(
                index: index,
                categoryId: categoryId,
              ));
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              CustomExpandedText(
                title: "${homeCubit.currentProductList[index].name}", //"name",
              ),
              CustomExpandedText(
                title: homeCubit.currentProductList[index].priceOfBuy
                    .toString(), //"name",
              ),
              CustomExpandedText(
                title:
                    homeCubit.currentProductList[index].priceOfSell.toString(),
              ),
              CustomExpandedText(
                  title: homeCubit.currentProductList[index].quantity
                      .toString() //"name",
                  ),
              CustomExpandedText(
                title: homeCubit.currentProductList[index].oldQuantity
                    .toString(), //"name",
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
