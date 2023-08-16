import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Daily Mind',
          style: context.textTheme.headlineMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(),
    );
  }
}
