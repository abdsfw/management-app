import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mangment_app/core/utils/helper_functions.dart';
import 'package:mangment_app/feature/home/presentation/manager/home_cubit/home_cubit.dart';

import '../../generated/l10n.dart';
import '../widget/custom_input_field.dart';

class AppFunction {
  static Future<dynamic> editItemProductDialogFun(
      BuildContext context, HomeCubit homeCubit, int index,
      {required int categoryId}) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        scrollable: true,
        content: Column(
          children: [
            Text(
              S.of(context).name_of_product, //  "name",
            ),
            CustomInputField(
              controller: homeCubit.editNameFieldController,
            ),
            const Divider(),
            Text(
              S.of(context).price_of_buy, //  "price of buy",
            ),
            CustomInputField(
              controller: homeCubit.editPriceOfBuyFieldController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d+\.?\d{0,2}'),
                ),
              ],
            ),
            const Divider(),
            Text(
              S.of(context).price_of_sell, //    "price of sell",
            ),
            CustomInputField(
              controller: homeCubit.editPriceOfSellFieldController,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^\d+\.?\d{0,2}'),
                ),
              ],
            ),
            const Divider(),
            Text(
              S.of(context).quantity, // "quantity",
            ),
            CustomInputField(
              controller: homeCubit.editQuantityFieldController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const Divider(),
            Text(
              S.of(context).old_quantity, // "quantity",
            ),
            CustomInputField(
              controller: homeCubit.editOldQuantityFieldController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            const Divider(),
          ],
        ),
        actionsAlignment: MainAxisAlignment.start,
        actions: [
          ElevatedButton(
            onPressed: () {
              homeCubit.checkAndEditIfEditControllerNotNull(context,
                  productId: homeCubit.currentProductList[index].id ?? 0,
                  categoryId: categoryId);
            },
            child: Text(
              S.of(context).save, //"save",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              HelperFunctions.customConfirmDialog(
                context,
                S
                    .of(context)
                    .delete_item_question, // "are you sure to delete this item?",
                onPressed: () {
                  homeCubit.deleteProduct(
                      itemId: homeCubit.currentProductList[index].id ?? -1,
                      categoryId: categoryId);
                  HelperFunctions.navigateToBack(context);
                  HelperFunctions.navigateToBack(context);
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text(
              S.of(context).delete, //   "delete",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              HelperFunctions.navigateToBack(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text(
              S.of(context).cancel, // "cancel",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  static Future<dynamic> editCategoryDialogFun(
      BuildContext context, HomeCubit homeCubit, int index) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        scrollable: true,
        content: Column(
          children: [
            Text(
              S.of(context).name_of_category, //  "name",
            ),
            CustomInputField(
              controller: homeCubit.categoryNameFieldController,
            ),
            const Divider(),
          ],
        ),
        actionsAlignment: MainAxisAlignment.start,
        actions: [
          ElevatedButton(
            onPressed: () {
              homeCubit.editCategory(context,
                  categoryId: homeCubit.categoryList[index].id ?? 0);
            },
            child: Text(
              S.of(context).save, //"save",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              HelperFunctions.customConfirmDialog(
                context,
                S
                    .of(context)
                    .delete_item_question, // "are you sure to delete this item?",
                onPressed: () {
                  homeCubit.deleteCategory(
                    categoryId: homeCubit.categoryList[index].id ?? -1,
                  );
                  HelperFunctions.navigateToBack(context);
                  HelperFunctions.navigateToBack(context);
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text(
              S.of(context).delete, //   "delete",
              style: const TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              homeCubit.categoryNameFieldController.clear();

              HelperFunctions.navigateToBack(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text(
              S.of(context).cancel, // "cancel",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
