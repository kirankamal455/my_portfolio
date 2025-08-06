import 'package:auto_route/auto_route.dart';
import 'package:kiran_portfolio/core/router/router.gr.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: DashboardRoute.page,
      path: '/',
      initial: true,
    ),
  ];
}
