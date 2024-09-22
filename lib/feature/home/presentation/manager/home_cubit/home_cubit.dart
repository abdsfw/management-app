import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mangment_app/core/utils/database_helper.dart';
import 'package:mangment_app/core/utils/helper_functions.dart';
import 'package:mangment_app/feature/home/data/models/category_model.dart';
import 'package:mangment_app/feature/home/data/models/product_model.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  //! ---------------- VARIABLE ------------------
  TextEditingController nameInputFieldController = TextEditingController();
  TextEditingController priceOfSellInputFieldController =
      TextEditingController();
  TextEditingController priceOfBuyInputFieldController =
      TextEditingController();
  TextEditingController quantityInputFieldController = TextEditingController();
  TextEditingController oldQuantityInputFieldController =
      TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<ProductModel> currentProductList = [];
  List<ProductModel> productList = [];

  List<CategoryModel> categoryList = [];
  TextEditingController categoryNameFieldController = TextEditingController();

  TextEditingController editNameFieldController = TextEditingController();
  TextEditingController editPriceOfBuyFieldController = TextEditingController();
  TextEditingController editPriceOfSellFieldController =
      TextEditingController();
  TextEditingController editQuantityFieldController = TextEditingController();
  TextEditingController editOldQuantityFieldController =
      TextEditingController();

  TextEditingController searchController = TextEditingController();
  int itemQuantityForEdit = 0;

  //! --------------------------------------------

  void initProductEditController(ProductModel productModel) {
    editNameFieldController.text = productModel.name ?? "";
    editPriceOfSellFieldController.text = productModel.priceOfSell.toString();
    editPriceOfBuyFieldController.text = productModel.priceOfBuy.toString();
    editQuantityFieldController.text = productModel.quantity.toString();
    editOldQuantityFieldController.text = productModel.oldQuantity.toString();
  }

  void iniCategoryEditController(CategoryModel categoryModel) {
    categoryNameFieldController.text = categoryModel.name ?? "";
  }

  Future editProduct({required int productId, required int categoryId}) async {
    ProductModel tempProduct = ProductModel(
      categoryId: categoryId,
      id: productId,
      name: editNameFieldController.text,
      priceOfBuy: double.tryParse(editPriceOfBuyFieldController.text) ?? 0.0,
      priceOfSell: double.tryParse(editPriceOfSellFieldController.text) ?? 0.0,
      quantity: int.tryParse(editQuantityFieldController.text) ?? 0,
      oldQuantity: int.tryParse(editOldQuantityFieldController.text) ?? 0,
    );
    await _databaseHelper.updateProduct(product: tempProduct);
    clearControllers();
    //? we should get data from storage
    getProductListFromStorageByCategory(categoryId: categoryId);
  }

  Future updateCategory({required int categoryId}) async {
    await _databaseHelper.updateCategory(
      category:
          CategoryModel(id: categoryId, name: categoryNameFieldController.text),
    );
    categoryNameFieldController.clear();
    getCategoryListFromStorage();
  }

  void clearControllers() {
    nameInputFieldController.clear();
    priceOfSellInputFieldController.clear();
    priceOfBuyInputFieldController.clear();
    quantityInputFieldController.clear();
    oldQuantityInputFieldController.clear();

    editNameFieldController.clear();
    editPriceOfBuyFieldController.clear();
    editPriceOfSellFieldController.clear();
    editQuantityFieldController.clear();
    editOldQuantityFieldController.clear();
  }

  void cancelInputDataDialog(context) {
    clearControllers();
    HelperFunctions.navigateToBack(context);
  }

  Future deleteProduct({required int itemId, required int categoryId}) async {
    await _databaseHelper.deleteProduct(itemId);
    //? we should get data from storage
    getProductListFromStorageByCategory(categoryId: categoryId);
  }

  Future deleteCategory({required int categoryId}) async {
    await _databaseHelper.deleteCategory(categoryId);
    //? we should get data from storage
    categoryNameFieldController.clear();

    getCategoryListFromStorage();
  }

  Future insertProduct({required int categoryId}) async {
    ProductModel tempProduct = ProductModel(
      categoryId: categoryId,
      name: nameInputFieldController.text,
      priceOfBuy: double.tryParse(priceOfBuyInputFieldController.text) ?? 0.0,
      priceOfSell: double.tryParse(priceOfSellInputFieldController.text) ?? 0.0,
      quantity: int.tryParse(quantityInputFieldController.text) ?? 0,
      oldQuantity: int.tryParse(oldQuantityInputFieldController.text) ?? 0,
    );
    await _databaseHelper.insertProduct(product: tempProduct);
    clearControllers();
    //? we should get data from storage
    getProductListFromStorageByCategory(categoryId: categoryId);
  }

  Future insertCategory() async {
    await _databaseHelper.insertCategory(
      category: CategoryModel(name: categoryNameFieldController.text),
    );
    categoryNameFieldController.clear();
    getCategoryListFromStorage();
  }

  Future<void> getCategoryListFromStorage() async {
    categoryList = await _databaseHelper.getCategories();
    emit(HomeInitial());
  }

  Future<void> getProductListFromStorageByCategory(
      {required int? categoryId}) async {
    if (categoryId == null) {
      productList = await _databaseHelper.getProducts();
      searchItem(query: searchController.text);
    } else {
      productList = await _databaseHelper.getProductsByCategory(categoryId);
      searchItem(query: searchController.text);
      // currentProductList = productList;
    }
    emit(HomeInitial());
  }

  void checkIfControllerNotNull(context, {required int categoryId}) {
    if (nameInputFieldController.text.isEmpty ||
        priceOfBuyInputFieldController.text.isEmpty ||
        priceOfSellInputFieldController.text.isEmpty ||
        quantityInputFieldController.text.isEmpty ||
        oldQuantityInputFieldController.text.isEmpty) {
      debugPrint('on or more is empty');
      HelperFunctions.customAlertDialog(context, "you must enter all field");
    } else {
      insertProduct(categoryId: categoryId);
      HelperFunctions.navigateToBack(context);
      debugPrint('not empty');
    }
  }

  void addCategory(context) {
    if (categoryNameFieldController.text.isEmpty) {
      HelperFunctions.customAlertDialog(context, "you must enter all field");
    } else {
      insertCategory();
      HelperFunctions.navigateToBack(context);
    }
  }

  void editCategory(context, {required int categoryId}) {
    if (categoryNameFieldController.text.isEmpty) {
      HelperFunctions.customAlertDialog(context, "you must enter all field");
    } else {
      updateCategory(categoryId: categoryId);
      HelperFunctions.navigateToBack(context);
    }
  }

  void checkAndEditIfEditControllerNotNull(context,
      {required int productId, required int categoryId}) {
    if (editNameFieldController.text.isEmpty ||
        editPriceOfSellFieldController.text.isEmpty ||
        editPriceOfBuyFieldController.text.isEmpty ||
        editQuantityFieldController.text.isEmpty ||
        editOldQuantityFieldController.text.isEmpty) {
      debugPrint('on or more is empty');
      HelperFunctions.customAlertDialog(context, "you must enter all field");
    } else {
      editProduct(productId: productId, categoryId: categoryId);
      HelperFunctions.navigateToBack(context);
      debugPrint('not empty');
    }
  }

  void editItemQuantity({required bool isAdd}) {
    if (isAdd) {
      itemQuantityForEdit++;
    } else {
      if (itemQuantityForEdit > 0) {
        itemQuantityForEdit--;
      }
    }
    emit(HomeInitial());
  }

  Future<void> saveQuantityEdit(
      {required int itemId, required int categoryId}) async {
    await _databaseHelper.updateQuantityProduct(
      itemId: itemId,
      newQuantity: itemQuantityForEdit,
    );
    //? we should get data from storage
    await getProductListFromStorageByCategory(categoryId: categoryId);
  }

  void searchItem({required String query}) {
    currentProductList = productList
        .where((item) => item.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(HomeInitial());
  }
}
