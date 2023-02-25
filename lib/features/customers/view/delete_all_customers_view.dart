import 'package:flutter/material.dart';
import 'package:ideal/shared/utils.dart';

class DeleteAllCustomersView extends StatelessWidget {
  const DeleteAllCustomersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Customers'.textScale4.pad,
        ElevatedButton(
          child: 'Delete All Customers'.text,
          onPressed: () {},
        ).pad,
      ],
    );
  }
}
