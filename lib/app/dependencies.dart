import 'package:fyp_project_v2/services/auth/auth_service_mock.dart';
import 'package:fyp_project_v2/services/auth/auth_service_rest.dart';
import 'package:fyp_project_v2/services/news/news_service.dart';
import 'package:fyp_project_v2/services/news/news_service_mock.dart';
import 'package:fyp_project_v2/services/news/news_service_rest.dart';
import 'package:fyp_project_v2/services/product/product_service.dart';
import 'package:fyp_project_v2/services/product/product_service_mock.dart';
import 'package:fyp_project_v2/services/product/product_service_rest.dart';

import '../screen/user_viewmodel.dart';

import '../services/auth/auth_service.dart';
import 'package:get_it/get_it.dart';

import '../services/rest.dart';


GetIt dependency = GetIt.instance;

void init() {
  //Services (connect to backend)
  dependency.registerLazySingleton<RestService>(
    () => RestService(baseUrl: 'http://192.168.0.63:3000'),
  );
  //Rest Service
  dependency.registerLazySingleton<AuthService>(() => AuthServiceRest());
  dependency.registerLazySingleton<NewService>(() => NewServiceRest());
  dependency.registerLazySingleton<ProductService>(() => ProductServiceRest());

  //Mock Service
  //dependency.registerLazySingleton<AuthService>(() => AuthServiceMock());
  // dependency.registerLazySingleton<NewService>(() => NewServiceMock());
  // dependency.registerLazySingleton<ProductService>(() => ProductServiceMock());

  //View models
  dependency.registerLazySingleton<UserViewmodel>(() => UserViewmodel());
}