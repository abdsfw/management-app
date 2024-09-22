import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangment_app/core/manager/lang_cubit.dart';
import 'package:mangment_app/feature/home/presentation/views/widgets/floating_product_action_button.dart';
import 'package:mangment_app/feature/home/presentation/views/widgets/product_body.dart';
import 'package:mangment_app/generated/l10n.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.categoryId});
  final int categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingProductActionButton(
        categoryId: categoryId,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(
          S.of(context).management_app, // "Management App",
        ),
      ),
      body: ProductBody(
        categoryId: categoryId,
      ),
    );
  }
}
