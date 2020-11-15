import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 120,
        height: 120,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
