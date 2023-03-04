import 'package:flutter/material.dart';
import 'package:nectar_ui/core/navigator/app_router.dart';
import 'package:nectar_ui/core/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'core/constant/app_constant.dart';
import 'core/init/dependency_injector.dart';
import 'core/theme/themes.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  await _init();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        AppConstant.enLocale,
        AppConstant.trLocale,
      ],
      saveLocale: true,
      fallbackLocale: AppConstant.enLocale,
      path: AppConstant.langPath,
      //child: MyApp(),
      child: MultiProvider(
        providers: DependencyInjector.instance.providers,
        child: const MyApp(),
      ),
    ),
  );
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //final _appRouter = AppRouter();
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => CartProvider()),
    //     ChangeNotifierProvider(create: (_) => ThemeProvider()..initialize()),
    //   ],
    //   child: Builder(builder: (BuildContext context) {
    //     return Consumer<ThemeProvider>(builder: (context, provider, child) {
    //       return MaterialApp.router(
    //         debugShowCheckedModeBanner: false,
    //         title: 'Nectar',
    //         theme: MyThemes.lightTheme,
    //         darkTheme: MyThemes.darkTheme,
    //         themeMode: provider.themeMode,
    //         localizationsDelegates: context.localizationDelegates,
    //         supportedLocales: context.supportedLocales,
    //         locale: context.locale,
    //         routerDelegate: _appRouter.delegate(),
    //         routeInformationParser: _appRouter.defaultRouteParser(),
    //       );
    //     });
    //   }),
    // );
    return Builder(
      builder: (BuildContext context) {
        return Consumer<ThemeProvider>(
          builder: (context, provider, child) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: AppConstant.appName,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              themeMode: provider.themeMode,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              routerDelegate: _appRouter.delegate(),
              routeInformationParser: _appRouter.defaultRouteParser(),
            );
          },
        );
      },
    );
  }
}
