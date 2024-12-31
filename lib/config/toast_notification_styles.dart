import 'package:nylo_framework/nylo_framework.dart';

/* Toast Notification Styles
|--------------------------------------------------------------------------
| Define your toast notification styles here.
|-------------------------------------------------------------------------- */

class NyToastNotificationStyleMetaHelper
    extends ToastNotificationStyleMetaHelper {
  NyToastNotificationStyleMetaHelper(super.style);

  @override
  ToastMeta onSuccess() {
    return ToastMeta.success();
  }

  @override
  ToastMeta onWarning() {
    return ToastMeta.warning();
  }

  @override
  ToastMeta onInfo() {
    return ToastMeta.info();
  }

  @override
  ToastMeta onDanger() {
    return ToastMeta.danger();
  }

  // Example customizing the default notification
  // for 'ToastNotificationStyleType.SUCCESS'
  // onSuccess() {
  //   return ToastMeta.success(
  //     title: "Hello",
  //     description: "World",
  //     action: () {},
  //     backgroundColor: Colors.Yellow,
  //     metaData: {
  //       "add_extra": "meta_data"
  //     }
  //   );
  // }
}
