import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ShowToastHelper {
  final BuildContext context;
  final String message;
  final ToastificationType? type;

  ShowToastHelper({required this.context, required this.message, this.type});

  void execute() {
    if (!context.mounted) return;
    toastification.show(
      context: context,
      title: Text(message, overflow: TextOverflow.ellipsis, maxLines: 1),
      autoCloseDuration: const Duration(seconds: 3),
      type: type,
      icon: _buildIcon(type),
    );
  }

  Widget? _buildIcon(ToastificationType? type) {
    return switch (type) {
      ToastificationType.error => Icon(Icons.error_outline),
      ToastificationType.info => Icon(Icons.info),
      ToastificationType.success => Icon(Icons.check_circle_outlined),
      _ => null,
    };
  }
}
