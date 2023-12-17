import 'package:flutter/material.dart';

import 'package:tetiharana/utilities/tools.dart';

class PickDate extends StatefulWidget {
  // Pick date from icon button

  final String? restorationId;
  final IconData? icon;
  final Color? iconColor;
  final void Function(String) updateDate;
  const PickDate({
    super.key,
    this.restorationId,
    required this.icon,
    this.iconColor,
    required this.updateDate,
  });

  @override
  State<PickDate> createState() => _PickDateState();
}

class _PickDateState extends State<PickDate> with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(1950),
          lastDate: DateTime.now(),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        widget.updateDate(
            '${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => {_restorableDatePickerRouteFuture.present()},
      icon: Icon(
        widget.icon,
        color: widget.iconColor,
      ),
    );
  }
}

class MyDatePicker extends StatefulWidget {
  // Date picker with custom input
  final String title;
  final String? controller;
  final void Function(String) updateDate;

  const MyDatePicker({
    super.key,
    required this.title,
    this.controller,
    required this.updateDate,
  });

  @override
  State<MyDatePicker> createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              widget.controller != ""
                  ? Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Tools.color09,
                      ),
                    )
                  : Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 0,
                        color: Tools.color09,
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Tools.color10,
                      ),
                    ),
                  ),
                  child: SizedBox(
                    width: size.width,
                    height: 50,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Text(
                          widget.controller.toString() != ""
                              ? widget.controller.toString()
                              : widget.title,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Positioned(
                          // right: -15,
                          right: -10,
                          child: PickDate(
                            icon: Icons.calendar_month_rounded,
                            iconColor: Tools.color09,
                            updateDate: widget.updateDate,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
