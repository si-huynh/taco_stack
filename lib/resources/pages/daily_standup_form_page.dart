import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:taco_stack_app/app/forms/daily_standup_form.dart';
import 'package:taco_stack_app/app/models/daily_standup.dart';
import 'package:taco_stack_app/resources/widgets/buttons/buttons.dart';
import '/app/controllers/daily_standup_form_controller.dart';

class DailyStandupFormPage
    extends NyStatefulWidget<DailyStandupFormController> {
  DailyStandupFormPage({super.key})
      : super(child: _DailyStandupFormPageState.new);
  static RouteView path =
      ('/daily-standup-form', (_) => DailyStandupFormPage());
}

class _DailyStandupFormPageState extends NyState<DailyStandupFormPage> {
  DailyStandupFormController get controller => widget.controller;

  final _form = DailyStandupForm();

  bool _isUpdated = false;

  @override
  Null Function() get init => () {
        if (widget.data() != null) {
          final report = DailyStandup.fromJson(widget.data());
          _form.initialData(
            () => {
              'progress': report.progress,
              'challenges': report.challenges,
              'planForTomorrow': report.planForTomorrow,
            },
          );
          _isUpdated = report.id.isNotEmpty;
        }
      };

  @override
  LoadingStyle get loadingStyle => LoadingStyle.normal();

  @override
  Widget view(BuildContext context) {
    final formatter = DateFormat(
      'EEE, dd-MMM-yyyy',
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(trans('dailyStandupForm')),
            Text(
              formatter.format(DateTime.parse(widget.data()['date'])),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: NyForm(
          form: _form,
          footer: Button.primary(
            text: trans(_isUpdated ? 'update' : 'submit'),
            submitForm: (_form, _onSubmit),
          ),
          locked: isLoading(),
        ),
      ),
    );
  }

  Future<void> _onSubmit(data) async {
    setLoading(true, resetState: false);
    final date = DateTime.parse(widget.data()['date']);
    final result = await controller.submitForm(
      data,
      date,
      id: widget.data()['id'],
    );
    setLoading(false, resetState: false);
    result.fold(
      (success) => pop(result: success),
      (failure) {
        showToastWarning(description: failure);
      },
    );
  }
}
