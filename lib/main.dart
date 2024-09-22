import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mangment_app/core/cache/cashe_helper.dart';
import 'package:mangment_app/core/manager/lang_cubit.dart';
import 'package:mangment_app/core/utils/app_color.dart';
import 'package:mangment_app/feature/home/presentation/manager/edit_cubit/edit_cubit.dart';
import 'package:mangment_app/feature/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:mangment_app/feature/home/presentation/views/home_page.dart';
import 'package:mangment_app/feature/login_and_splash/presentation/manager/cubit_splash/splash_login_cubit.dart';
import 'package:mangment_app/feature/login_and_splash/presentation/views/splash_screen_page.dart';
import 'package:mangment_app/generated/l10n.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize ffi loader if needed.
  sqfliteFfiInit();
  // Set the sqflite database factory
  await CasheHelper.casheInit();
  databaseFactory = databaseFactoryFfi;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()..getCategoryListFromStorage(),
        ),
        BlocProvider(
          create: (context) => SplashLoginCubit(),
        ),
        BlocProvider(
          create: (context) => LangCubit()..setLangAttribute(),
        ),
      ],
      child: BlocBuilder<LangCubit, LangState>(
        builder: (context, state) {
          return MaterialApp(
            locale: Locale(BlocProvider.of<LangCubit>(context).lang),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: 'management',
            theme: ThemeData(
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: AppColors.lightGreyBlue,
              ),
              appBarTheme: const AppBarTheme(
                color: AppColors.green1,
                centerTitle: true,
                iconTheme: IconThemeData(color: AppColors.white),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppColors.darkGreen1),
              useMaterial3: true,
            ),
            home: const SplashScreenPage(), //const HomePage(),
          );
        },
      ),
    );
  }
}
