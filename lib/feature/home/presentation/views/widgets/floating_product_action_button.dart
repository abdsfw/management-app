import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mangment_app/core/widget/custom_input_field.dart';
import 'package:mangment_app/feature/home/presentation/manager/home_cubit/home_cubit.dart';

import '../../../../../generated/l10n.dart';

class FloatingProductActionButton extends StatelessWidget {
  const FloatingProductActionButton({
    super.key,
    required this.categoryId,
  });
  final int categoryId;
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);

    return FloatingActionButton.extended(
      onPressed: () {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            scrollable: true,
            content: Column(
              children: [
                Text(
                  S.of(context).name_of_product, //"name",
                ),
                CustomInputField(
                  controller: homeCubit.nameInputFieldController,
                ),
                const Divider(),
                Text(
                  S.of(context).price_of_buy, // "price of buy",
                ),
                CustomInputField(
                  controller: homeCubit.priceOfBuyInputFieldController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^\d+\.?\d{0,2}'),
                    ),
                  ],
                ),
                const Divider(),
                Text(
                  S.of(context).price_of_sell, // "price of sell",
                ),
                CustomInputField(
                  controller: homeCubit.priceOfSellInputFieldController,
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
                  controller: homeCubit.quantityInputFieldController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const Divider(),
                Text(
                  S.of(context).old_quantity, // "old quantity",
                ),
                CustomInputField(
                  controller: homeCubit.oldQuantityInputFieldController,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                const Divider(),
              ],
            ),
            actionsAlignment: MainAxisAlignment.start,
            actions: [
              ElevatedButton(
                onPressed: () {
                  homeCubit.checkIfControllerNotNull(context,
                      categoryId: categoryId);
                },
                child: Text(
                  S.of(context).enter, // "enter",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  homeCubit.cancelInputDataDialog(context);
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
      },
      label: Text(
        S.of(context).add_product, // "add product",
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
