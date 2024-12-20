import 'package:flutter/material.dart';
import 'package:flutter_features/routes/app_pages.dart';
import 'package:flutter_features/routes/app_routes.dart';
import 'package:flutter_features/utils/log_handler_util.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  LogHandlerUtil.isProduction =
      dotenv.env['IS_PRODUCTION']?.toLowerCase() == 'true';
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.chatScreen,
    );
  }
}
