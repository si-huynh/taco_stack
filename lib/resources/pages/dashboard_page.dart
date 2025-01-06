import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:taco_stack_app/app/blocs/reports_management_cubit/reports_management_cubit.dart';
import 'package:taco_stack_app/resources/widgets/daily_standup_tile_widget.dart';
import 'package:taco_stack_app/resources/widgets/profile_widget.dart';
import 'package:taco_stack_app/resources/widgets/weekly_report_panel_widget.dart';
import '/app/controllers/dashboard_controller.dart';

class DashboardPage extends NyStatefulWidget<DashboardController> {
  DashboardPage({super.key}) : super(child: _DashboardPageState.new);
  static RouteView path = ('/dashboard', (_) => DashboardPage());
}

class _DashboardPageState extends NyState<DashboardPage> {
  DashboardController get controller => widget.controller.construct(context);

  @override
  Function() get init => () async {
        await controller.loadUserInfo();
        await controller.loadDailyStandups();
      };

  @override
  Widget view(BuildContext context) {
    return BlocBuilder<ReportsManagementCubit, ReportsManagementState>(
      builder: (context, state) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              title: Text(trans('dashboard')),
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
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(16),
                  WeeklyReportPanelWidget(
                    controller: controller,
                    data: state.weeklyReport,
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Text(
                  trans('dailyStandups'),
                  style: context.textTheme().titleMedium,
                ),
              ),
            ),
            SliverList.separated(
              itemBuilder: (context, index) {
                return DailyStandupTileWidget(
                  data: state.dailyStandups[index],
                  controller: controller,
                );
              },
              itemCount: state.dailyStandups.length,
              separatorBuilder: (context, index) => const Gap(16),
            ),
          ],
        ),
      ),
    );
  }
}
