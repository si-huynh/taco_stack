import 'package:nylo_framework/nylo_framework.dart';

import '/routes/router.dart';

class RouteProvider implements NyProvider {
  @override
  Future<Nylo> boot(Nylo nylo) async {
    nylo.addRouter(appRouter());

    // Optional
    // nylo.onDeepLink(_onDeepLink); // Handle deep links
    return nylo;
  }

  @override
  Future<void> afterBoot(Nylo nylo) async {
    nylo.initRoutes();
  }

// _onDeepLink(route, data) {
//   print("Deep link route: $route");
//   print("Deep link data: $data");

// Example of updating the route stack
//  if (route == ProfilePage.path) {
//    Nylo.updateRouteStack([
//      SettingsPage.path, // first route
//      PostsPage.path, // second route
//      PostDetailPage.path, // and so on..
//      ProfilePage.path // deep link route
//    ], replace: true, deepLink: true, dataForRoute: {
//          PostsPage.path: {"name": "John Doe"}
//    });
//  }
// }
}
