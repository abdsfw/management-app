import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangment_app/core/widget/custom_app_card.dart';

import '../../../../generated/l10n.dart';
import '../manager/home_cubit/home_cubit.dart';

class ItemProductPage extends StatelessWidget {
  const ItemProductPage(
      {super.key, required this.index, required this.categoryId});
  final int index;
  final int categoryId;
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).item_of_product, //  "item of product",
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                ColumnDetailsOfItem(
                  title: S.of(context).name_of_product, //"name of product",
                  itemName: homeCubit.currentProductList[index].name ??
                      "error", //"data data",
                ),
                ColumnDetailsOfItem(
                  title: S.of(context).price_of_buy, // "price of buy",
                  itemName: homeCubit.currentProductList[index].priceOfBuy
                      .toString(), //"data data",
                ),
                ColumnDetailsOfItem(
                  title: S.of(context).price_of_sell, // "price of sell",
                  itemName: homeCubit.currentProductList[index].priceOfSell
                      .toString(), //"data data",
                ),
                CustomAppCard(
                  child: Text(
                    S.of(context).quantity, // "quantity",
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  homeCubit.currentProductList[index].quantity
                      .toString(), //  '100',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        homeCubit.editItemQuantity(isAdd: true);
                      },
                      icon: const Icon(Icons.add),
                      label: Text(
                        S.of(context).add, // "add",
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        homeCubit.editItemQuantity(isAdd: false);
                      },
                      icon: const Icon(Icons.remove),
                      label: Text(
                        S.of(context).minus, //  "minus",
                      ),
                    ),
                  ],
                ),
                if (homeCubit.currentProductList[index].quantity !=
                    homeCubit.itemQuantityForEdit)
                  Text(
                    homeCubit.itemQuantityForEdit.toString(), //  '100',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                const Divider(),
                ColumnDetailsOfItem(
                  title: S.of(context).old_quantity, // "price of sell",
                  itemName: homeCubit.currentProductList[index].oldQuantity
                      .toString(), //"data data",
                ),
                const SizedBox(
                  height: 50,
                ),
                if (homeCubit.currentProductList[index].quantity !=
                    homeCubit.itemQuantityForEdit)
                  ElevatedButton.icon(
                    onPressed: () {
                      homeCubit.saveQuantityEdit(
                          itemId: homeCubit.currentProductList[index].id ?? -1,
                          categoryId: categoryId);
                    },
                    icon: const Icon(Icons.save),
                    label: Text(
                      S.of(context).save, //  "save",
                    ),
                  ),
                SizedBox(
                  height: 30,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ColumnDetailsOfItem extends StatelessWidget {
  const ColumnDetailsOfItem({
    super.key,
    required this.title,
    required this.itemName,
  });
  final String title;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomAppCard(
          child: Text(
            title, //"name of product",
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
        Text(
          itemName, //   'data data',
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
