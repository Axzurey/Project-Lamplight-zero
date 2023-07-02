import 'package:flutter/material.dart';
import 'package:project_lamplight/interface/macro_editor_page.dart';

List<String> weekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

class PeriodicMacroPage extends StatefulWidget {
    const PeriodicMacroPage({super.key, required this.pageState});

    final MacroEditorPageState pageState;

    @override
    State<PeriodicMacroPage> createState() => _PeriodicMacroPageState();
}

class _PeriodicMacroPageState extends State<PeriodicMacroPage> {

    TimeOfDay selectedTime = TimeOfDay.now();
    List<int> weekDays = [];

    @override
    Widget build(BuildContext ctx) {
        return Stack(
            children: [
                Column(children: [
                    const SizedBox(height: 20),
                    const Align(alignment: Alignment.topCenter, child: 
                        Padding(padding: EdgeInsets.only(top: 20), child: Text("Please select the time you prefer"))
                    ),
                    const SizedBox(height: 20),
                    Row(
                        children: [
                            const SizedBox(width: 20),
                            Text('Selected time: ${selectedTime.hour}:${selectedTime.minute} (24h)'),
                            const SizedBox(width: 20),
                            ElevatedButton(onPressed: () async {
                                final TimeOfDay? time = await showTimePicker(
                                    context: ctx,
                                    initialTime: selectedTime,
                                    initialEntryMode: TimePickerEntryMode.input
                                );

                                setState(() {
                                    selectedTime = time ?? selectedTime;
                                });

                            }, child: const Text("Open Time Picker"))
                        ]
                    ),
                    const Align(alignment: Alignment.topCenter, child: 
                        Padding(padding: EdgeInsets.only(top: 20), child: Text("Please select the days you prefer"))
                    ),
                    const SizedBox(height: 20),
                    Column(
                        children: weekdays.map((v) {
                            int vindex = weekdays.indexOf(v);
                            return Row(
                                children: [
                                    const SizedBox(width: 20),
                                    Text(v),
                                    const SizedBox(width: 20),
                                    Expanded(
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Padding(padding: const EdgeInsets.only(right: 20),
                                                child: Switch(value: weekDays.contains(vindex), onChanged: (vState) {
                                                    setState(() {
                                                        if (weekDays.contains(vindex)) {
                                                            if (!vState) {
                                                                weekDays.remove(vindex);
                                                            }
                                                        }
                                                        else {
                                                            if (vState) {
                                                                weekDays.add(vindex);
                                                            }
                                                        }
                                                    });
                                                })
                                            ),
                                        )
                                    )
                                ]
                            );
                        }).toList()
                    ),
                ]),
                Align(alignment: Alignment.bottomRight, child:
                    Padding(padding: const EdgeInsets.only(right: 20, bottom: 20), child: FloatingActionButton.extended(
                        onPressed: () {
                            if (weekDays.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: const Text("You can not continue without setting any days!"),
                                        action: SnackBarAction(label: "Got it!", onPressed: () {
                                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                        }),
                                    )
                                );
                            }
                            else {
                                widget.pageState.setState(() {
                                    widget.pageState.pageIndex = 3;
                                    widget.pageState.macroTypeMeta = {
                                        "hour": selectedTime.hour,
                                        "minute": selectedTime.minute,
                                        "days": weekDays,
                                    };
                                });
                            }
                            
                        },
                        label: const Text("Next"), 
                        icon: const Icon(Icons.navigate_next)
                    ))
                ),
            ]
        );
    }
}