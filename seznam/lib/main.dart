import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:seznam/core/constants/constants.dart';
import 'package:seznam/features/posts/models/comment_model.dart';
import 'package:seznam/routing/router.dart';
import 'package:seznam/theme/theme.dart';
import 'package:seznam/theme/theme_provider.dart';
import 'package:seznam/theme/theme_util.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(CommentAdapter());
  await Hive.openBox<Comment>(Constants.hiveCommentsBox);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    TextTheme textTheme = createTextTheme(context, "Poppins", "Poppins");
    MaterialTheme theme = MaterialTheme(textTheme);
    final themeMode = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      title: 'Seznam',
      themeMode: themeMode,
      theme: theme.light(),
      darkTheme: theme.dark(),
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
