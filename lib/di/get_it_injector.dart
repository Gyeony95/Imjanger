import 'package:get_it/get_it.dart';
import 'package:imjanger/screens/home/home_view_model.dart';
import 'package:imjanger/screens/list/complex_list_main_view_model.dart';
import 'package:imjanger/screens/login/login_view_model.dart';
import 'package:imjanger/screens/map/map_main_view_model.dart';
import 'package:imjanger/screens/my_page/my_page_view_model.dart';
import 'package:imjanger/screens/splash/splash_view_model.dart';

final GetIt getItInstance = GetIt.I;

// 종속성 주입에 사용
class GetItInjector {
  void setUp() {
    getItInstance.registerSingleton<SplashViewModel>(SplashViewModel());
    getItInstance.registerSingleton<LoginViewModel>(LoginViewModel());
    getItInstance.registerSingleton<HomeViewModel>(HomeViewModel());
    getItInstance.registerSingleton<MapMainViewModel>(MapMainViewModel());
    getItInstance.registerSingleton<ComplexListMainViewModel>(
        ComplexListMainViewModel());
    getItInstance.registerSingleton<MyPageMainViewModel>(MyPageMainViewModel());
  }
}
