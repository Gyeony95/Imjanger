import 'package:go_router/go_router.dart';
import 'package:imjanger/resources/routes/routes.dart';
import 'package:imjanger/screens/base/base_view_model.dart';

class SplashViewModel extends BaseViewModel{
  String test = 'test1';

  @override
  void onInit(){
    splashDelayStart();
  }

  // 2초 딜레이 주고 다음 화면으로 보냄
  Future<void> splashDelayStart() async {
    await Future.delayed(const Duration(seconds: 2)).then((value){
      // context.go(Routes.login);
      context.go(Routes.home);
    });
  }
}