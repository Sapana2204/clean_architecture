import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../model/login_model.dart';
import '../utils/routes/routes_names.dart';
import '../viewModel/login_viewmodel.dart';


class SplashService {
  static Future<void> checkAuthentication(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));

    // 👉 Directly go to Home (no login check)
    Navigator.pushReplacementNamed(context, RouteNames.home);
  }
}