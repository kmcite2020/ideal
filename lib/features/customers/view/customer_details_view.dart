import 'package:flutter/material.dart';

class CustomerDetails extends StatelessWidget {
  final id;
  CustomerDetails(this.id);
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                // color: Colors.primaries[color.state],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("CUSTOMER DETAILS"),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
