import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:taco_stack_app/app/controllers/dashboard_controller.dart';
import 'package:taco_stack_app/app/models/weekly_report.dart';
import 'package:taco_stack_app/resources/pages/weekly_report_form_page.dart';
import 'package:taco_stack_app/resources/themes/styles/custom/util.dart';

class WeeklyReportPanelWidget extends StatelessWidget {
  const WeeklyReportPanelWidget({
    super.key,
    required this.data,
    required this.controller,
  });

  final WeeklyReport data;
  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(),
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
            const Divider(),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Wrap _buildActionButtons() {
    return Wrap(
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
            onPressed: () => _onAddNewWeeklyReport(data: data.toJson()),
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
        if (data.id.isNotEmpty && !data.isCollected && !data.isSkipped)
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
    );
  }

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
