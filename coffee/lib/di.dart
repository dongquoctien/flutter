import 'package:coffee/data/api/home/category_api.dart';
import 'package:coffee/data/api/home/home_page_api.dart';
import 'package:coffee/data/api/product/product_api.dart';
import 'package:coffee/repository/home/category_repository.dart';
import 'package:coffee/repository/home/home_page_repository.dart';
import 'package:coffee/repository/product/product_repository.dart';
import 'package:coffee/viewmodel/comment/controller/comment_controller.dart';
import 'package:coffee/viewmodel/home/category_controller.dart';
import 'package:coffee/viewmodel/home/home_page_controller.dart';
import 'package:coffee/viewmodel/post/controller/post_controller.dart';
import 'package:coffee/viewmodel/product/product_controller.dart';
import 'package:coffee/viewmodel/todo/controller/todo_controller.dart';
import 'package:coffee/viewmodel/user/controller/user_controller.dart';
import 'package:coffee/repository/comment/comment_repository.dart';
import 'package:coffee/repository/post/post_repository.dart';
import 'package:coffee/data/api/comment/comment_api.dart';
import 'package:coffee/common/network/dio_client.dart';
import 'package:coffee/data/api/post/post_api.dart';
import 'package:coffee/data/api/todo/todo_api.dart';
import 'package:coffee/data/api/user/user_api.dart';
import 'repository/todo/todo_repository.dart';
import 'repository/user/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //Dio
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));

  // User api
  getIt.registerLazySingleton<UserApi>(
      () => UserApi(dioClient: getIt<DioClient>()));
  // User repository
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepository(userApi: getIt<UserApi>()),
  );
  //UserController
  getIt.registerFactory(
    () => UserController(userRepository: getIt<UserRepository>()),
  );

  // _Todo api
  getIt.registerLazySingleton<ToDoApi>(
      () => ToDoApi(dioClient: getIt<DioClient>()));
  // _Todo repository
  getIt.registerLazySingleton<TodoRepository>(
    () => TodoRepository(todoApi: getIt<ToDoApi>()),
  );
  //TodoController
  getIt.registerFactory(
    () => ToDoController(todoRepository: getIt<TodoRepository>()),
  );

  // Post api
  getIt.registerLazySingleton<PostApi>(
      () => PostApi(dioClient: getIt<DioClient>()));
  // Post repository
  getIt.registerLazySingleton<PostRepository>(
    () => PostRepository(postApi: getIt<PostApi>()),
  );
  //PostController
  getIt.registerFactory(
    () => PostController(postRepository: getIt<PostRepository>()),
  );

  // Comment api
  getIt.registerLazySingleton<CommentApi>(
      () => CommentApi(dioClient: getIt<DioClient>()));
  // Comment repository
  getIt.registerLazySingleton<CommentRepository>(
    () => CommentRepository(commentApi: getIt<CommentApi>()),
  );
  //CommentController
  getIt.registerFactory(
    () => CommentController(commentRepository: getIt<CommentRepository>()),
  );

  // HomePage api
  getIt.registerLazySingleton<HomePageApi>(
      () => HomePageApi(dioClient: getIt<DioClient>()));
  // HomePage repository
  getIt.registerLazySingleton<HomePageRepository>(
    () => HomePageRepository(homePageApi: getIt<HomePageApi>()),
  );
  //HomePageController
  getIt.registerFactory(
    () => HomePageController(homePageRepository: getIt<HomePageRepository>()),
  );

  // Category api
  getIt.registerLazySingleton<CategoryApi>(
      () => CategoryApi(dioClient: getIt<DioClient>()));
  // Category repository
  getIt.registerLazySingleton<CategoryRepository>(
    () => CategoryRepository(categoryApi: getIt<CategoryApi>()),
  );
  //Category Controller
  getIt.registerFactory(
    () => CategoryController(categoryRepository: getIt<CategoryRepository>()),
  );

    // Product api
  getIt.registerLazySingleton<ProductApi>(
      () => ProductApi(dioClient: getIt<DioClient>()));
  // Product repository
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepository(productApi: getIt<ProductApi>()),
  );
  //Product Controller
  getIt.registerFactory(
    () => ProductController(productRepository: getIt<ProductRepository>()),
  );
}
