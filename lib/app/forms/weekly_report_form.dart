import 'package:nylo_framework/nylo_framework.dart';

/* WeeklyReport Form
|--------------------------------------------------------------------------
| Usage: https://nylo.dev/docs/6.x/forms#how-it-works
| Casts: https://nylo.dev/docs/6.x/forms#form-casts
| Validation Rules: https://nylo.dev/docs/6.x/validation#validation-rules
|-------------------------------------------------------------------------- */

class WeeklyReportForm extends NyFormData {
  WeeklyReportForm({String? name}) : super(name ?? 'weekly_report');

  @override
  List<Object> fields() => [
        Field.textArea(
          trans('summary'),
          autofocus: true,
          validate: FormValidator().notEmpty(),
        ),
        Field.textArea(
          trans('tasksCompleted'),
          validate: FormValidator().notEmpty(),
        ),
        Field.textArea(
          trans('challengesFaced'),
          validate: FormValidator().notEmpty(),
        ),
        Field.textArea(
          trans('nextWeekPlan'),
          validate: FormValidator().notEmpty(),
        ),
      ];
}
