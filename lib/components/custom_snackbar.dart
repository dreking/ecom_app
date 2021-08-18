import 'package:flutter/material.dart';

Widget buildCustomSnackBar(
  BuildContext context, {
  required String field,
  required bool status,
}) {
  final message = status
      ? '$field added to cart'
      : 'Something went wrong while adding to cart';

  return SnackBar(content: Text(message));
}
