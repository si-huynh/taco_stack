import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:taco_stack_app/app/forms/weekly_report_form.dart';
import 'package:taco_stack_app/resources/widgets/buttons/buttons.dart';
import '/app/controllers/weekly_report_form_controller.dart';

class WeeklyReportFormPage
    extends NyStatefulWidget<WeeklyReportFormController> {
  WeeklyReportFormPage({super.key})
      : super(child: _WeeklyReportFormPageState.new);
  static RouteView path =
      ('/weekly-report-form', (_) => WeeklyReportFormPage());
}

class _WeeklyReportFormPageState extends NyState<WeeklyReportFormPage> {
  /// [WeeklyReportFormController] controller
  WeeklyReportFormController get controller => widget.controller;

  final _form = WeeklyReportForm();

  @override
  Null Function() get init => () {};

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
            Text(trans('weeklyReportForm')),
            Text(
              formatter.format(DateTime.now()),
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
            text: trans('submit'),
            submitForm: (_form, _onSubmit),
          ),
          locked: isLoading(),
        ),
      ),
    );
  }

  Future<void> _onSubmit(data) async {
    setLoading(true, resetState: false);
    final date = DateTime.now();
    final result = await controller.submitForm(data, date);
    setLoading(false, resetState: false);
    result.fold(
      (success) => pop(result: success),
      (failure) {
        showToastWarning(description: failure);
      },
    );
  }
}
