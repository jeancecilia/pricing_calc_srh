
// Extension on widget that wraps it with a Padding widget
import 'package:flutter/material.dart';
import 'package:pricing_calculator/src/utilities/custom_exceptions.dart';
import 'package:toastification/toastification.dart';

extension ContainerExtension on Widget {
  Widget reveal({Color? color = Colors.red}) {
    return Container(
      color: color,
      child: this,
    );
  }
}

extension ShowToast on BuildContext {
  void showErrorMessage(String error) {
    toastification.show(
      context: this,
      title: Text(error),
      type: ToastificationType.error,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  void showError(CustomException error) {
    final errorMessage = error.message;

    toastification.show(
      context: this,
      title: Text(errorMessage),
      type: ToastificationType.error,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  void showSuccess(String message, {String? subtitle}) {
    toastification.show(
      context: this,
      title: Text(message),
      description: subtitle != null ? Text(subtitle) : null,
      type: ToastificationType.success,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }
}

// Extension on String calleg elongate that returns the string 5 times
extension Elongate on String {
  String elongate() {
    return "$this$this$this$this$this";
  }
}

// Extension reveal to wrap a widget with a container giving it a color

// Extension to get if current device is tablet, mobile or desktop
extension DeviceTypeExtension on BuildContext {
  bool get isTablet {
    return MediaQuery.of(this).size.shortestSide >= 600;
  }

  bool get isMobile {
    return MediaQuery.of(this).size.shortestSide < 600;
  }
}
