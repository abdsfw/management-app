part of 'splash_login_cubit.dart';

@immutable
sealed class SplashLoginState {}

final class SplashLoginInitial extends SplashLoginState {}

final class AddToHeightState extends SplashLoginState {}
