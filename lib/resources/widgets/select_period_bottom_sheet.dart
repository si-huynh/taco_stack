import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:taco_stack_app/app/blocs/reports_management_cubit/reports_management_cubit.dart';
import 'package:taco_stack_app/resources/themes/styles/custom/util.dart';

class SelectPeriodBottomSheet extends StatelessWidget {
  const SelectPeriodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        constraints: BoxConstraints(
          minHeight: context.sh * 0.7,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(16),
            Text(
              'Select Week',
              style: context.theme.textTheme.headlineSmall?.copyWith(
                color: context.theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const Gap(16),
            SelectPeriodWidget(
              startFrom: DateTime.now().subtract(const Duration(days: 365)),
              onPeriodSelected: (period) => context.pop(result: period),
            ),
            const Gap(16),
            FilledButton(
              onPressed: () => context.pop(),
              child: Text(trans('cancel')),
            ),
          ],
        ),
      ),
    );
  }

  static Future<DateTime?> show(BuildContext context) async {
    return showModalBottomSheet<DateTime>(
      context: context,
      constraints: BoxConstraints(
        minHeight: context.sh,
        maxHeight: context.sh,
      ),
      showDragHandle: true,
      useRootNavigator: true,
      isScrollControlled: true,
      builder: (context) => const SelectPeriodBottomSheet(),
    );
  }
}

class SelectPeriodWidget extends StatefulWidget {
  const SelectPeriodWidget({
    super.key,
    required this.startFrom,
    required this.onPeriodSelected,
  });

  /// Furthest time to render
  final DateTime startFrom;
  final void Function(DateTime?) onPeriodSelected;

  @override
  State<SelectPeriodWidget> createState() => _SelectPeriodWidgetState();
}

class _SelectPeriodWidgetState extends State<SelectPeriodWidget> {
  late int selectedYear;

  final _now = DateTime.now();

  @override
  void initState() {
    selectedYear = _now.year;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const padding = 16.0;
    final maxCellWidth = (context.sw - padding * 4) / 5;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GridView.count(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          crossAxisCount: 5,
          childAspectRatio: maxCellWidth / 48,
          crossAxisSpacing: padding,
          mainAxisSpacing: padding / 2,
          children: List.generate(52, (i) => i + 1)
              .map(
                (e) => _buildWeekItemWidget(e, maxCellWidth),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildWeekItemWidget(int week, double itemWidth) {
    final isCurrentMonth = DateTime.now().weekOfYear == week;
    return ActionChip(
      backgroundColor: isCurrentMonth
          ? context.theme.colorScheme.onSurface.withOpacity(0.12)
          : null,
      label: SizedBox(
        width: itemWidth,
        child: Text(
          week.toString(),
          textAlign: TextAlign.center,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      onPressed: () => widget.onPeriodSelected(
        _dateTimeFromWeekNumber(DateTime.now().year, week),
      ),
    );
  }

  DateTime _dateTimeFromWeekNumber(
    int year,
    int weekNumber, [
    int weekDay = DateTime.monday,
  ]) {
    // January 4th is always in week 1
    final fourthJanuary = DateTime(year, 1, 4);

    // removing the weekday from January 4th returns the monday of week 1, which could be in the preceding year.
    final firstDayOfWeek1 = DateTime(year, 1, 4 - (fourthJanuary.weekday - 1));

    // Not using DateTime.add() since that adds a duration which takes things such as daylight savings into account, which could introduce errors.
    return DateTime(
      firstDayOfWeek1.year,
      firstDayOfWeek1.month,
      firstDayOfWeek1.day + 7 * (weekNumber - 1) + (weekDay - 1),
    );
  }
}
