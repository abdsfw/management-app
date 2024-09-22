import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangment_app/core/manager/lang_cubit.dart';
import 'package:mangment_app/core/utils/app_color.dart';
import 'package:mangment_app/core/utils/helper_functions.dart';
import 'package:mangment_app/feature/home/presentation/views/product_page.dart';
import 'package:mangment_app/feature/home/presentation/views/widgets/floating_product_action_button.dart';
import 'package:mangment_app/generated/l10n.dart';

import '../../../../core/utils/app_function.dart';
import '../manager/home_cubit/home_cubit.dart';
import 'widgets/floating_category_action_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingCategoryActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text(
          S.of(context).management_app, // "Management App",
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  scrollable: true,
                  content: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<LangCubit>(context)
                              .changeLang(selectedLang: "en");
                        },
                        child: const Text("english"),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<LangCubit>(context)
                              .changeLang(selectedLang: "ar");
                        },
                        child: const Text("العربية"),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: Text(
              S.of(context).change_language, //"change language",
            ),
          )
        ],
        leading: const SizedBox(),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (homeCubit.categoryList.isEmpty) {
            return Center(
              child: Text(
                S.of(context).no_category_yet, //  "no product yet",
              ),
            );
          }
          return Column(
            children: [
              // SizedBox(
              //   height: 20,
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     homeCubit.getProductListFromStorageByCategory(
              //         categoryId: null);
              //     HelperFunctions.navigateToScreen(
              //         context,
              //         ProductPage(
              //           categoryId: homeCubit.categoryList[index].id ?? 0,
              //         ));
              //   },
              //   child: Text(
              //     S.of(context).all_item,
              //     style: TextStyle(
              //       fontSize: 30,
              //     ),
              //   ),
              // ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: width < 1200
                        ? (width < 800)
                            ? (width < 600)
                                ? (width < 400)
                                    ? 1
                                    : 2
                                : 3
                            : 4
                        : 5,
                  ),
                  itemCount: homeCubit.categoryList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      color: AppColors.green2,
                      child: InkWell(
                        onTap: () {
                          homeCubit.getProductListFromStorageByCategory(
                              categoryId:
                                  homeCubit.categoryList[index].id ?? 0);
                          HelperFunctions.navigateToScreen(
                              context,
                              ProductPage(
                                categoryId:
                                    homeCubit.categoryList[index].id ?? 0,
                              ));
                        },
                        onDoubleTap: () {
                          homeCubit.iniCategoryEditController(
                              homeCubit.categoryList[index]);
                          AppFunction.editCategoryDialogFun(
                              context, homeCubit, index);
                        },
                        child: Center(
                          child: Text(
                            homeCubit.categoryList[index].name ?? "",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
