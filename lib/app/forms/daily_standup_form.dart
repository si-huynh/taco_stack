import 'package:nylo_framework/nylo_framework.dart';

class DailyStandupForm extends NyFormData {
  DailyStandupForm({String? name}) : super(name ?? 'daily_standup');
  @override
  List<Object> fields() => [
        Field.textArea(
          trans('progress'),
          autofocus: true,
          validate: FormValidator().notEmpty(),
        ),
        Field.textArea(
          trans('challenges'),
          validate: FormValidator().notEmpty(),
        ),
        Field.textArea(
          trans('planForTomorrow'),
          validate: FormValidator().notEmpty(),
        ),
      ];
}
