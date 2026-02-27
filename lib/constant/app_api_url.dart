import 'package:daraz_style_product_listing/utils/app_log.dart';
import 'package:flutter/foundation.dart';

class AppApiUrl {
  AppApiUrl._privateConstructor();
  static final AppApiUrl _instance = AppApiUrl._privateConstructor();
  static AppApiUrl get instance => _instance;
  //////////////  app base api end point
  static final String domain = _getDomain();
  static final String socket = _getDomain();
  final String baseUrl = domain;

  //////////////////////////////////  base
  String refreshToken = "/refreshToken";
  String userProfile = "/user/profile";
  String about = "/rule/about";
  String privacyPolicy = "/rule/privacy-policy";
  String termsAndConditions = "/rule/terms-and-conditions";
  String faq = "/faq";
  String notification = "/notification";
  ////////////
  String login = "/login";
  String authDeleteAccount = "/authDeleteAccount";
  String user = "/user";
  String changePassword = "/changePassword";
  String userResendOtp = "/userResendOtp";
  String authOtpVerify = "/authOtpVerify";
  String authForgotPassword = "/authForgotPassword";
  String authVerifyEmail = "/authVerifyEmail";
  String authResetPassword = "/authResetPassword";
  String products = "/products";
}

String _getDomain() {
  const String liveServer = "https://fakestoreapi.com";
  const String localServer = "https://fakestoreapi.com";

  try {
    if (kDebugMode) {
      return localServer;
    }
  } catch (e) {
    errorLog("_getDomain", e);
  }
  return liveServer;
}
