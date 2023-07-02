import 'package:flutter/material.dart';
import 'package:project_lamplight/interface/macro_editor_page.dart';

class ScreenBrightnessPage extends StatefulWidget {
    const ScreenBrightnessPage({super.key, required this.pageState, required this.index});

    final MacroEditorPageState pageState;
    final int index;

    @override
    State<ScreenBrightnessPage> createState() => ScreenBrightnessPageState();
}

class ScreenBrightnessPageState extends State<ScreenBrightnessPage> {

    double brightness = 0;

    @override
    Widget build(BuildContext context) {
        return Stack(
            children: [
                Column(
                    children: [
                        const SizedBox(height: 20),
                        const Text("Please set your preferred settings"),
                        const SizedBox(height: 20),
                        Row(
                            children: [
                                const SizedBox(width: 20),
                                const Text("Target Brightness"),
                                SizedBox(
                                    width: MediaQuery.of(context).size.width * .5,
                                    child: Slider(
                                        value: brightness,
                                        max: 100,
                                        divisions: 100,
                                        label: brightness.round().toString(),
                                        onChanged: (v) {
                                            setState(() {
                                                brightness = v;
                                            });
                                        },
                                    ),
                                )
                            ]
                        )
                    ]
                ),
                Align(alignment: Alignment.bottomRight, child:
                    Padding(padding: const EdgeInsets.only(right: 20, bottom: 20), child: FloatingActionButton.extended(
                        onPressed: () {
                            widget.pageState.setState(() {
                                widget.pageState.pageIndex = 3;
                                widget.pageState.macroActionMeta[widget.index] = {
                                    "brightness": brightness
                                };
                            });
                        },
                        label: const Text("Done"), 
                        icon: const Icon(Icons.check)
                    ))
                ),
                Align(alignment: Alignment.bottomLeft, child:
                    Padding(padding: const EdgeInsets.only(left: 20, bottom: 20), child: FloatingActionButton.extended(
                        onPressed: () {
                            widget.pageState.setState(() {
                                widget.pageState.pageIndex = 3;
                            });
                        },
                        label: const Text("Cancel"),
                        icon: const Icon(Icons.cancel)
                    ))
                )
            ]
        );
    }
}