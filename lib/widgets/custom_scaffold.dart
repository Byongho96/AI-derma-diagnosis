import 'package:flutter/material.dart';
import 'package:ai_derma_diagnosis/widgets/common/custom_background_container.dart';

class CustomScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final Widget? bottomNavigationBar;

  const CustomScaffold({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.drawer,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar,
        body: body,
        floatingActionButton: floatingActionButton,
        drawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
