import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nectar_ui/view/filters_page/filters_page.dart';
import 'package:nectar_ui/view/home_page/home_page.dart';
import 'package:nectar_ui/view/shop_page/shop_page.dart';
import 'package:nectar_ui/view/splash_page/splash_page.dart';
import '../../view/account_page/account_page.dart';
import '../../view/authentication_pages/login_page/login_page.dart';
import '../../view/authentication_pages/register_page/register_page.dart';
import '../../view/authentication_pages/reset_page/reset_page.dart';
import '../../view/cart_page/cart_page.dart';
import '../../view/detalis_page/product_detail_page.dart';
import '../../view/favourite_page/favourite_page.dart';
import '../../view/onboarding_page/view/onboard_view.dart';
import '../../view/search_page/search_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: OnBoardPage,
      path: '/onboard',
    ),
    AutoRoute(
      page: SplashPage,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: LoginPage,
      path: '/login',
    ),
    AutoRoute(
      page: RegisterPage,
      path: '/register',
    ),
    AutoRoute(
      page: ResetPage,
      path: '/reset',
    ),
    AutoRoute(
      page: HomePage,
      children: [
        AutoRoute(
          page: ShopPage,
          path: 'shop',
        ),
        AutoRoute(
          page: ExplorePage,
          path: 'explore',
        ),
        AutoRoute(
          page: CartPage,
          path: 'cart',
        ),
        AutoRoute(
          page: FavouritePage,
          path: 'favourite',
        ),
        AutoRoute(
          page: AccountPage,
          path: 'account',
        ),
        AutoRoute(
          page: FilterPage,
          path: 'filter',
        ),
        AutoRoute(
          page: ProductDetailsPage,
          path: 'product',
        )
      ],
    ),
  ],
)

// extend the generated private router
class AppRouter extends _$AppRouter {}

class EmptyPageRouter extends AutoRouter {
  const EmptyPageRouter({Key? key}) : super(key: key);
}