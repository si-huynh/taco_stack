import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:taco_stack_app/app/controllers/dashboard_controller.dart';
import 'package:taco_stack_app/app/models/daily_standup.dart';
import 'package:taco_stack_app/resources/pages/daily_standup_form_page.dart';
import 'package:taco_stack_app/resources/themes/styles/custom/util.dart';

class DailyStandupTileWidget extends StatelessWidget {
  const DailyStandupTileWidget({
    super.key,
    required this.data,
    required this.controller,
  });

  final DailyStandup data;
  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
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
}
