import 'package:flutter/material.dart';
import 'package:mangment_app/feature/home/data/models/category_model.dart';
import 'package:mangment_app/feature/home/data/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String dataBaseRootPath = await getDatabasesPath();
    debugPrint('dataBaseRootPath: ${dataBaseRootPath}');
    String path = '${dataBaseRootPath}management.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE category (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      )
      ''',
    );
    await db.execute(
      '''
      CREATE TABLE product (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        categoryId INTEGER,
        name TEXT NOT NULL,
        priceOfBuy DOUBLE,
        priceOfSell DOUBLE,
        quantity INTEGER,
        oldQuantity INTEGER
      )
      ''',
      // FOREIGN KEY (categoryId) REFERENCES category (id)
    );
  }

  // Category CRUD operations
  Future<int> insertCategory({required CategoryModel category}) async {
    Database db = await database;
    return await db.insert('category', category.toJson());
  }

  Future<List<CategoryModel>> getCategories() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('category');
    return List.generate(maps.length, (i) {
      return CategoryModel.fromJson(maps[i]);
    });
  }

  Future<int> updateCategory({required CategoryModel category}) async {
    Database db = await database;
    return await db.update(
      'category',
      category.toJson(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  // Future<int> deleteCategory(int id) async {
  //   Database db = await database;
  //   return await db.delete(
  //     'category',
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }
  Future<int> deleteCategory(int id) async {
    Database db = await database;

    // Use a transaction to ensure both deletions happen together
    return await db.transaction((txn) async {
      // First, delete products with the given category id
      await txn.delete(
        'product',
        where: 'categoryId = ?', // Assuming the column name is 'category_id'
        whereArgs: [id],
      );

      // Then, delete the category itself
      return await txn.delete(
        'category',
        where: 'id = ?',
        whereArgs: [id],
      );
    });
  }

  // Product CRUD operations
  Future<int> insertProduct({required ProductModel product}) async {
    Database db = await database;
    return await db.insert('product', product.toJson());
  }

  Future<List<ProductModel>> getProducts() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('product');
    return List.generate(maps.length, (i) {
      return ProductModel.fromJson(maps[i]);
    });
  }

  Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'product',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
    return List.generate(maps.length, (i) {
      return ProductModel.fromJson(maps[i]);
    });
  }

  Future<int> updateProduct({required ProductModel product}) async {
    Database db = await database;
    return await db.update(
      'product',
      product.toJson(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<int> updateQuantityProduct(
      {required int newQuantity, required int itemId}) async {
    Database db = await database;
    return await db.update(
      'product',
      {"quantity": newQuantity},
      where: 'id = ?',
      whereArgs: [itemId],
    );
  }

  Future<int> deleteProduct(int id) async {
    Database db = await database;
    return await db.delete(
      'product',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
