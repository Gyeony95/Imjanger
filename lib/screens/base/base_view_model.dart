import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

abstract class BaseViewModel extends ChangeNotifier with DiagnosticableTreeMixin{
  BaseViewModel(){
    onInit();
  }
  late BuildContext context;

  void initContext(BuildContext ctx){
    context = ctx;
  }

  @protected
  void onInit(){}

  @protected
  void onReady() {
    Future.delayed(Duration.zero);
  }

  @protected
  void onDispose() {}

  @override
  void dispose() {
    onDispose();
    super.dispose();
  }

  // dev tool 에 찍히는 부분
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<ChangeNotifier>('value', this));
  }
}