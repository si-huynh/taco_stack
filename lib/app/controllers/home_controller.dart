import 'package:url_launcher/url_launcher.dart';
import 'controller.dart';

class HomeController extends Controller {
  Future<void> onTapDocumentation() async {
    await launchUrl(Uri.parse('https://nylo.dev/docs'));
  }
}
