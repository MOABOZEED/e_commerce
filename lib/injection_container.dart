import 'package:dio/dio.dart';
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart';
import 'package:ecommerce/features/products/data/datasource/product_remote_data_source.dart';
import 'package:ecommerce/features/products/data/repository/product_repository_impl.dart';
import 'package:ecommerce/features/products/domain/repository/product_repository.dart';
import 'package:ecommerce/features/products/domain/usecase/get_product_usecase.dart';
import 'package:ecommerce/features/products/presentation/controller/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/auth/data/datasource/fake_data_source.dart';
import 'features/auth/data/datasource/local/auth_local_data_source.dart';
import '../../features/auth/data/repository/auth_repository_impl.dart';
import '../../features/auth/domain/usecases/RegisterUseCase.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import 'features/auth/data/datasource/local/auth_local_data_source_impl.dart';
import 'features/auth/data/datasource/remote/auth_remote_datasource.dart';
import 'features/auth/data/datasource/remote/auth_remote_datasource_impl.dart';
import 'features/auth/domain/usecases/get_curent_usecase.dart';
import 'features/auth/domain/usecases/logout_usecase.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(sharedPreferences: sl<SharedPreferences>()),
  );

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => FakeAuthRemoteDataSource(sl<AuthLocalDataSource>()),
  );

  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(sl<Dio>()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl<AuthRemoteDataSource>()),
  );

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl<ProductRemoteDataSource>()),
  );

  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => LogoutUseCase(sl()));
  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => GetProductsUseCase(sl()));

  sl.registerFactory(() => AuthBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => ProductBloc(sl()));
  sl.registerFactory(() => CartBloc());
}
