import 'package:flutter/material.dart';

class SubmitLoginUtils {
  final GlobalKey<FormState> formKey;

  SubmitLoginUtils({required this.formKey});

  void execute() {
    if (formKey.currentState?.validate() == true) {
      // formKey.currentState!.save();
    }
  }
}
