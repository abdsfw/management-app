import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mangment_app/core/widget/custom_input_field.dart';
import 'package:mangment_app/feature/home/presentation/manager/home_cubit/home_cubit.dart';

import '../../../../../generated/l10n.dart';

class FloatingCategoryActionButton extends StatelessWidget {
  const FloatingCategoryActionButton({
    super.key,
  });

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
                  controller: homeCubit.categoryNameFieldController,
                ),
                const Divider(),
              ],
            ),
            actionsAlignment: MainAxisAlignment.start,
            actions: [
              ElevatedButton(
                onPressed: () {
                  homeCubit.addCategory(context);
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
        S.of(context).add_category, // "add product",
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
