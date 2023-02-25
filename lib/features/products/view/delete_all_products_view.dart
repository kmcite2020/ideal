import 'package:flutter/material.dart';
import 'package:ideal/shared/utils.dart';

class DeleteAllProductsView extends StatelessWidget {
  const DeleteAllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Products'.textScale4.pad,
        ElevatedButton(
          child: 'Delete All Products'.text,
          onPressed: () {},
        ).pad,
      ],
    );
  }
}
