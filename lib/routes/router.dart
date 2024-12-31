import 'package:nylo_framework/nylo_framework.dart';

import '/resources/pages/not_found_page.dart';
import '/resources/pages/sign_in_page.dart';
import '/resources/pages/sign_up_page.dart';

/* App Router
|--------------------------------------------------------------------------
| * [Tip] Create pages faster 🚀
| Run the below in the terminal to create new a page.
| "dart run nylo_framework:main make:page profile_page"
|
| * [Tip] Add authentication 🔑
| Run the below in the terminal to add authentication to your project.
| "dart run scaffold_ui:main auth"
|
| Learn more https://nylo.dev/docs/6.x/router
|-------------------------------------------------------------------------- */

NyRouter appRouter() => nyRoutes((router) {
      //router.add(HomePage.path).initialRoute();
      // Add your routes here ...

      // router.add(NewPage.path, transition: PageTransitionType.fade);

      // Example using grouped routes
      // router.group(() => {
      //   "route_guards": [AuthRouteGuard()],
      //   "prefix": "/dashboard"
      // }, (router) {
      //
      // });
      router.add(NotFoundPage.path).unknownRoute();
      router.add(SignUpPage.path).initialRoute();
      router.add(SignInPage.path);
    });
