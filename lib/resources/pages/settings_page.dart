import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:taco_stack_app/resources/themes/styles/custom/util.dart';
import 'package:taco_stack_app/resources/widgets/profile_widget.dart';
import 'package:taco_stack_app/src/gen/assets.gen.dart';

import '/app/controllers/settings_controller.dart';

class SettingsPage extends NyStatefulWidget<SettingsController> {
  SettingsPage({super.key}) : super(child: _SettingsPageState.new);
  static RouteView path = ('/settings', (_) => SettingsPage());
}

class _SettingsPageState extends NyState<SettingsPage> {
  SettingsController get controller => widget.controller.construct(context);

  @override
  Null Function() get init => () {};

  @override
  Widget view(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(trans('settings')),
            leading: const ProfileWidget(),
            leadingWidth: 196,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.magnifyingGlass),
              ),
              const Gap(8),
            ],
            expandedHeight: 100,
            floating: true,
          ),
          _buildContentList(context),
        ],
      ),
    );
  }

  Widget _buildContentList(BuildContext context) {
    final settingsItems = <_SettingItem>[
      _SettingItem(
        icon: Icons.notifications_outlined,
        title: trans('notification'),
        onTap: () => AppSettings.openAppSettings(
          type: AppSettingsType.notification,
        ),
      ),
      _SettingItem(
        icon: Icons.language,
        title: trans('language'),
        onTap: controller.updateLocale,
      ),
      _SettingItem(
        icon: Icons.info_outline,
        title: trans('about'),
        onTap: () => {
          showAboutDialog(
            context: context,
            applicationName: 'TacoStack - Si Huynh',
            applicationVersion: '0.0.1 Dev',
            applicationIcon: Assets.public.appIcon.icon.image(
              width: 48,
              height: 48,
            ),
          ),
        },
      ),
      _SettingItem(
        icon: Icons.logout,
        title: trans('signOut'),
        onTap: () => _onLogoutItemPressed(context),
      ),
    ];
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverList.builder(
        itemCount: settingsItems.length,
        itemBuilder: (context, index) {
          final item = settingsItems[index];
          return ListTile(
            leading: Icon(item.icon),
            trailing: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                Text(
                  item.subTrailing,
                  style: context.textTheme().bodyMedium?.copyWith(
                        color: context.theme.colorScheme.surfaceTint,
                      ),
                ),
                const Icon(Icons.arrow_right),
              ],
            ),
            title: Text(item.title),
            onTap: item.onTap,
          );
        },
      ),
    );
  }

  Future<void> _onLogoutItemPressed(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(trans('signOut')),
        titleTextStyle: context.textTheme().labelLarge?.copyWith(
              fontSize: 20,
            ),
        icon: const Icon(Icons.logout),
        actions: <Widget>[
          TextButton(
            onPressed: context.pop,
            child: Text(trans('cancel')),
          ),
          TextButton(
            onPressed: () {
              controller.signOut();
              context.pop();
            },
            child: Text(trans('yes')),
          ),
        ],
      ),
    );
  }
}

class _SettingItem {
  const _SettingItem({
    required this.icon,
    required this.title,
    required this.onTap,
    // ignore: unused_element
    this.subTrailing = '',
  });

  final IconData icon;
  final String title;
  final String subTrailing;
  final VoidCallback onTap;
}
