import 'package:blog_app/core/secrets/app_secret.dart';
import 'package:blog_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:blog_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';
import 'package:blog_app/features/auth/domain/usecases/current_user.dart';
import 'package:blog_app/features/auth/domain/usecases/user_log_in.dart';
import 'package:blog_app/features/auth/domain/usecases/user_sign_up.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  await dotenv.load(fileName: ".env");
  final supabase = await Supabase.initialize(
    url: supabaseUrl!,
    anonKey: supabaseApiKey!,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);
}

void _initAuth() {
  //Data Sources
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      supabaseClient: (serviceLocator()),
    ),
  );

  //Repository
  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(serviceLocator()),
  );

  //Use-Case
  serviceLocator.registerFactory(
    () => UserSignUp(
      authRepository: (serviceLocator()),
    ),
  );

  //Use-Case
  serviceLocator.registerFactory(
    () => UserLogIn(
      serviceLocator(),
    ),
  );

  //Use-Case
  serviceLocator.registerFactory(
    () => CurrentUser(
      serviceLocator(),
    ),
  );

  //Bloc
  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
      userLogIn: serviceLocator(),
      currentUser: serviceLocator(),
    ),
  );
}
