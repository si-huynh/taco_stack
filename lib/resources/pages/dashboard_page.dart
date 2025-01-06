import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:taco_stack_app/app/blocs/reports_management_cubit/reports_management_cubit.dart';
import 'package:taco_stack_app/app/models/daily_standup.dart';
import 'package:taco_stack_app/app/models/weekly_report.dart';
import 'package:taco_stack_app/resources/pages/daily_standup_form_page.dart';
import 'package:taco_stack_app/resources/pages/weekly_report_form_page.dart';
import 'package:taco_stack_app/resources/themes/styles/custom/util.dart';
import 'package:taco_stack_app/resources/widgets/profile_widget.dart';
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
                  _buildThisWeekWidget(state.weeklyReport),
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
                return _buildDailyWidget(state.dailyStandups[index]);
              },
              itemCount: state.dailyStandups.length,
              separatorBuilder: (context, index) => const Gap(16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyWidget(DailyStandup data) {
    var title = trans('today');
    if (!data.date.isSameDay(DateTime.now())) {
      title = data.date.toFormat('EEEE')!;
    }
    if (data.isSkipped) {
      title += ' (Skipped)';
    }
    return Card.outlined(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textTheme().bodyLarge,
            ),
            const Gap(8),
            if (data.id.isNotEmpty && !data.isSkipped) ...[
              Text(
                trans('progress'),
                style: context.textTheme().labelMedium,
              ),
              Text(data.progress),
              const Gap(8),
              Text(
                trans('challenges'),
                style: context.textTheme().labelMedium,
              ),
              Text(data.challenges),
              const Gap(8),
              Text(
                trans('planForTomorrow'),
                style: context.textTheme().labelMedium,
              ),
              Text(data.planForTomorrow),
            ] else
              Text(
                trans('noStandup'),
                style: context.textTheme().labelMedium?.copyWith(
                      color: context.theme.colorScheme.outline,
                    ),
              ),
            const Gap(8),
            Wrap(
              spacing: 8,
              runAlignment: WrapAlignment.end,
              alignment: WrapAlignment.end,
              children: [
                if (data.id.isEmpty)
                  FilledButton(
                    onPressed: () => _onAddNewDailyStandup(data: data.toJson()),
                    style: OutlinedButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                    ),
                    child: Text(trans('add')),
                  ),
                if (data.id.isNotEmpty && !data.isSkipped)
                  FilledButton(
                    onPressed: () => _onAddNewDailyStandup(data: data.toJson()),
                    style: OutlinedButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                    ),
                    child: Text(trans('update')),
                  ),
                if (data.id.isEmpty && !data.isSkipped)
                  FilledButton.tonal(
                    onPressed: () => controller.skipDailyStandup(data.date),
                    style: OutlinedButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                    ),
                    child: Text(trans('skip')),
                  ),
                if (data.id.isNotEmpty && !data.isCollected && !data.isSkipped)
                  FilledButton(
                    onPressed: () => controller.collectTaco(
                      data.id,
                      'daily_standups',
                    ),
                    style: OutlinedButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                    ),
                    child: Text(trans('collectTaco')),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThisWeekWidget(WeeklyReport data) {
    return SizedBox(
      width: context.sw,
      child: Card.outlined(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trans('thisWeek'),
                style: context.textTheme().headlineSmall,
              ),
              const Gap(8),
              if (data.id.isNotEmpty) ...[
                Text(
                  trans('summary'),
                  style: context.textTheme().labelMedium,
                ),
                Text(data.summary),
                const Gap(8),
                Text(
                  trans('tasksCompleted'),
                  style: context.textTheme().labelMedium,
                ),
                Text(data.tasksCompleted),
                const Gap(8),
                Text(
                  trans('challengesFaces'),
                  style: context.textTheme().labelMedium,
                ),
                Text(data.challengesFaced),
                const Gap(8),
                Text(
                  trans('nextWeekPlan'),
                  style: context.textTheme().labelMedium,
                ),
                Text(data.nextWeekPlan),
              ] else
                Text(
                  trans('noWeeklyReport'),
                  style: context.textTheme().labelMedium?.copyWith(
                        color: context.theme.colorScheme.outline,
                      ),
                ),
              const Gap(8),
              Wrap(
                spacing: 8,
                runAlignment: WrapAlignment.end,
                alignment: WrapAlignment.end,
                children: [
                  if (data.id.isEmpty)
                    FilledButton(
                      onPressed: _onAddNewWeeklyReport,
                      style: OutlinedButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                      ),
                      child: Text(trans('add')),
                    )
                  else
                    FilledButton(
                      onPressed: () =>
                          _onAddNewWeeklyReport(data: data.toJson()),
                      style: OutlinedButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                      ),
                      child: Text(trans('update')),
                    ),
                  if (data.id.isEmpty && !data.isSkipped)
                    FilledButton.tonal(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                      ),
                      child: Text(trans('skip')),
                    ),
                  if (data.id.isNotEmpty &&
                      !data.isCollected &&
                      !data.isSkipped)
                    FilledButton(
                      onPressed: () => controller.collectTaco(
                        data.id,
                        'weekly_reports',
                      ),
                      style: OutlinedButton.styleFrom(
                        visualDensity: VisualDensity.compact,
                      ),
                      child: Text(trans('collectTaco')),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onAddNewDailyStandup({data}) => routeTo(
        DailyStandupFormPage.path,
        data: data,
        onPop: (value) {
          if (value != null) {
            controller.loadDailyStandups();
            controller.loadUserInfo();
          }
        },
      );

  void _onAddNewWeeklyReport({data}) => routeTo(
        data: data,
        WeeklyReportFormPage.path,
        onPop: (value) {
          if (value != null) {
            controller.loadDailyStandups();
            controller.loadUserInfo();
          }
        },
      );
}
