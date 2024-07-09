import 'package:auto_route/auto_route.dart';

import '../features/auth/presentation/screens/auth_screen.dart';
import '../features/auth/presentation/screens/signup_screen.dart'; // Новый экран регистрации
import '../features/home/presentation/screens/home_screen.dart';
import '../features/product/presentation/screens/product_screen.dart';
import '../features/cart/presentation/screens/cart_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';
import '../features/checkout/presentation/screens/checkout_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page, initial: true),
        AutoRoute(page: SignupRoute.page),
        AutoRoute(
          page: HomeRoute.page,
          children: [
            AutoRoute(page: ProductRoute.page),
            AutoRoute(page: CartRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(page: CheckoutRoute.page),
      ];
}
