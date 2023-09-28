import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_firebase_auth_module/flutter_firebase_auth_module.dart';
import 'package:mewnu_core/mewnu_core.dart';

class MewnuBirthdayInput extends StatelessWidget {
  final ISignUpPresenter
      presenter; // TODO REMOVE PRESENTER LOGIC FROM THIS LAYER
  final bool isOptional;

  const MewnuBirthdayInput({
    super.key,
    required this.presenter,
    this.isOptional = false,
  });

  void _showDialog({required BuildContext context, required Widget child}) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  CupertinoDatePicker cupertinoDatePicker() {
    return CupertinoDatePicker(
      initialDateTime: presenter.birthdayDateTime,
      mode: CupertinoDatePickerMode.date,
      dateOrder: DatePickerDateOrder.dmy,
      minimumYear: 1900,
      maximumYear: 2022,
      onDateTimeChanged: (DateTime newDate) {
        presenter.validateBirthday(newDate);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _DatePickerItem(
              children: <Widget>[
                Expanded(
                  child: CupertinoButton(
                    padding: UIPaddings.zero,
                    onPressed: () => _showDialog(
                        context: context, child: cupertinoDatePicker()),
                    child: presenter.birthday == null
                        ? Row(
                            children: [
                              Text(
                                I18n.string.aa15 +
                                    (isOptional ? I18n.string.optional : ''),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .custom
                                            .colors
                                            .textSubtitle2Color),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(presenter.birthday ?? '',
                                  style: Theme.of(context).textTheme.bodyLarge),
                              MewnuCloseButton(
                                onPressed: () => presenter
                                    .validateBirthday(DateTime(2000, 01, 01)),
                              ),
                            ],
                          ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}

class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: Theme.of(context).custom.colors.disabledColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}
