import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_features/features/react_to_message/presentation/controllers/react_to_message_controller.dart';

class BlurBGLayer extends StatelessWidget {
  const BlurBGLayer({
    super.key,
    required this.reactionController,
  });

  final ReactToMessageController reactionController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: reactionController.stopReaction,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
        child: Container(
          color: Colors.grey[850]!.withOpacity(0.6),
        ),
      ),
    );
  }
}
