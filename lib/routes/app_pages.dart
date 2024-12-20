import 'package:flutter_features/features/react_to_message/bindings/chat_screen_binding.dart';
import 'package:flutter_features/features/react_to_message/presentation/screens/chat_screen.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

/// This file defines the navigation structure for the application.
///
/// It maps route names (defined in [AppRoutes]) to their corresponding screens
/// and bindings. This ensures all navigation logic is centralized and
/// provides an easy way to manage routes and dependencies for the app.
///
/// **How to use:**
/// - Add a new `GetPage` entry in the `pages` list for any new screen.
/// - Specify the route name, page, and any associated binding.
/// - Use `Get.toNamed(routeName)` to navigate between screens.

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.chatScreen,
      page: () => const ChatScreen(),
      binding: ChatScreenBinding(),
    ),
  ];
}
