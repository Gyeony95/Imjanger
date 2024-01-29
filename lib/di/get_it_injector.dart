import 'package:get_it/get_it.dart';
import 'package:imjanger/screens/add_complex/add_complex_view_model.dart';
import 'package:imjanger/screens/home/home_view_model.dart';
import 'package:imjanger/screens/list/complex_list_main_view_model.dart';
import 'package:imjanger/screens/login/login_view_model.dart';
import 'package:imjanger/screens/map/map_main_view_model.dart';
import 'package:imjanger/screens/my_page/my_page_view_model.dart';
import 'package:imjanger/screens/splash/splash_view_model.dart';

final GetIt getIt = GetIt.I;

// 종속성 주입에 사용
class GetItInjector {
  void setUp() {
    getIt.registerSingleton<SplashViewModel>(SplashViewModel());
    getIt.registerSingleton<LoginViewModel>(LoginViewModel());
    getIt.registerSingleton<HomeViewModel>(HomeViewModel());
    getIt.registerSingleton<MapMainViewModel>(MapMainViewModel());
    getIt.registerSingleton<ComplexListMainViewModel>(
        ComplexListMainViewModel());
    getIt.registerSingleton<MyPageMainViewModel>(MyPageMainViewModel());
    getIt.registerSingleton<AddComplexViewModel>(AddComplexViewModel());
    // getIt.registerFactory<AddComplexViewModel>(() => AddComplexViewModel());
  }
}
