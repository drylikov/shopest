import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
          height: 30,
          width: 30,
        child: CircularProgressIndicator(color: Color.fromRGBO(255, 110, 78, 1)),),
    );
  }
}