import 'package:go_router/go_router.dart';
import 'package:pricing_calculator/src/features/landing/presentation/screens/landing_screen.dart';
import 'package:pricing_calculator/src/router/route_names.dart';
import 'package:pricing_calculator/src/router/routes.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.home,
      name: RouteNames.home,
      builder: (context, state) => const LandingScreen(),
    ),
  ],
);
