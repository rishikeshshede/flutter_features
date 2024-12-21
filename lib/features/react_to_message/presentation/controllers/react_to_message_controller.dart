import 'package:flutter_features/features/react_to_message/domain/interfaces/message_interface.dart';
import 'package:get/get.dart';

class ReactToMessageController extends GetxController {
  late final MessageInterface messageInterface;

  RxBool isLoading = false.obs;
}
