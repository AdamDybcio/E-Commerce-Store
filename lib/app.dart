import 'package:ecommerce_store/bindings/general_bindings.dart';
import 'package:ecommerce_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FlutterStore',
      initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const Scaffold(backgroundColor: AppColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
