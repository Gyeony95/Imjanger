import 'package:flutter/material.dart';
import 'package:imjanger/di/get_it_injector.dart';
import 'package:imjanger/screens/base/base_view_model.dart';
import 'package:imjanger/utils/widget_util.dart';
import 'package:provider/provider.dart';

abstract class BaseScreen<T extends BaseViewModel> extends StatelessWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      // 종속성 찾은 직후 context 전달
      create: (context) => getIt<T>()..initContext(context),
      builder: (context, child){
        return Scaffold(
          backgroundColor: scaffoldBgColor,
          bottomNavigationBar: bottomNav(context),
          body: buildBody(context),
        ).safeArea();
      },
    );
  }

  @protected
  Color? get scaffoldBgColor => Colors.white;

  @protected
  Widget buildBody(BuildContext context);

  @protected
  Widget? bottomNav(BuildContext context) => null;

  @protected
  T find(BuildContext context) => Provider.of<T>(context, listen: false);

  @protected
  T findRead(BuildContext context) => context.read<T>();

  @protected
  T findWatch(BuildContext context) => context.watch<T>();

  @protected
  S findSelector<S>(BuildContext context, S Function(T) selector) {
    return context.select(selector);
  }

}
