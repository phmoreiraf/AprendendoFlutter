import 'package:flutter/material.dart';

void logError(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Erro: $message')),
  );
}
