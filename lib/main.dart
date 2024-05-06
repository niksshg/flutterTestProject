import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:some_project/crypto_app.dart';
import 'package:some_project/repositories/crypto_coins/crypto_coins.dart';
import 'package:some_project/router/router.dart';
import 'package:some_project/theme/theme.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepo>(
      () => CryptoCoinsRepo(dio: Dio()));
  runApp(const CryptoTestApp());
}
