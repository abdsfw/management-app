import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:mangment_app/core/utils/app_color.dart';
import 'package:mangment_app/feature/home/presentation/views/home_page.dart';
import 'package:mangment_app/feature/login_and_splash/presentation/manager/cubit_splash/splash_login_cubit.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        BlocProvider.of<SplashLoginCubit>(context).changeContainerHeight();
        Timer(
          const Duration(seconds: 1),
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ),
            );
          },
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: AppColors.greyBlue
            // gradient: LinearGradient(
            //   colors: [
            //     AppColors.kPrimaryColorYellow.withOpacity(0.8),
            //     AppColors.kSecondaryColor.withOpacity(0.6)
            //   ],
            //   //colors: [Colors.blueAccent, Colors.blue[300]!],
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            // ),
            ),
        child: BlocConsumer<SplashLoginCubit, SplashLoginState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Center(
              child: AnimatedContainer(
                duration: Duration(
                  milliseconds: BlocProvider.of<SplashLoginCubit>(context)
                      .durationOfAnimation,
                ),
                height: BlocProvider.of<SplashLoginCubit>(context)
                        .animatedContainerHeight +
                    MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.28,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: const Image(
                        // fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/cubes_splash.gif",
                        ),
                      ),
                    ),
                    if (BlocProvider.of<SplashLoginCubit>(context)
                        .forTextAppear)
                      FadeIn(
                        child: const Text(
                          'management',
                          // style: Styles.textStyle20Bold,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
