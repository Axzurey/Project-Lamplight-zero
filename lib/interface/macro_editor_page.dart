import 'package:flutter/material.dart';
import 'package:project_lamplight/functions/firesave.dart';
import 'package:project_lamplight/interface/macro_action_card.dart';
import 'package:project_lamplight/interface/macro_action_pages/screen_brightness_page.dart';
import 'package:project_lamplight/interface/macro_action_selection_card.dart';
import 'package:project_lamplight/interface/macro_type_card.dart';
import 'package:project_lamplight/interface/macro_type_pages/periodic_macro_page.dart';
import 'package:project_lamplight/interface/macros.dart';
import 'package:project_lamplight/types/macro_types.dart';

Map<MacroType, Widget Function(MacroEditorPageState pageState)> macroPageMaps = {
    MacroType.periodic: (p) => PeriodicMacroPage(pageState: p),
    MacroType.keybound: (p) => PeriodicMacroPage(pageState: p)
};

Map<ActionType, Widget Function (MacroEditorPageState pageState, int index)> macroActionPageMaps = {
    ActionType.modifyBrightness: (p, i) => ScreenBrightnessPage(pageState: p, index: i)
};

class MacroEditorPage extends StatefulWidget {
    const MacroEditorPage({super.key, required this.pageState});

    final MacrosPageState pageState;

    @override
    State<MacroEditorPage> createState() => MacroEditorPageState();
}

class MacroEditorPageState extends State<MacroEditorPage> with TickerProviderStateMixin {

    int pageIndex = 0;
    String macroName = "";
    String macroDescription = "";
    MacroType? macroType;
    Map<String, Object> macroTypeMeta = {};
    List<Map<String, Object>> macroActionMeta = [];
    List<ActionType> macroActions = [];
    int activeEditingMacroTypeIndex = 0;

    late AnimationController controller;

    @override
    void initState() {
        controller = AnimationController(
            vsync: this,
            duration: const Duration(seconds: 1),
        )..addListener(() {
            setState(() {
                
            });
        });
        super.initState();
    }

    @override
    void dispose() {
        controller.dispose();
        super.dispose();
    }
   
    @override
    Widget build(BuildContext context) {

        Widget pageBuild = const Text("I should not be here; This is a bug.");

        switch (pageIndex) {
            case 0:
                pageBuild = Stack(
                    key: const ValueKey<int>(0),
                    children: [
                        Align(
                            child: Column(
                                children: [
                                    const SizedBox(height: 20),
                                    const Align(alignment: Alignment.topCenter, child: 
                                        Padding(padding: EdgeInsets.only(top: 20), child: Text("Set the name and description of your macro"))
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                        width: MediaQuery.of(context).size.width * .75,
                                        child: TextField(
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: "Macro Name"
                                            ),
                                            onChanged: (e) {
                                                setState(() {
                                                    macroName = e;
                                                });
                                            },
                                        ),
                                    ),
                                    const SizedBox(height: 20),
                                    SizedBox(
                                        width: MediaQuery.of(context).size.width * .75,
                                        child: TextField(
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: "Macro Description"
                                            ),
                                            onChanged: (e) {
                                                setState(() {
                                                    macroDescription = e;
                                                });
                                            },
                                        ),
                                    )
                                ]
                            )
                        ),
                        Align(alignment: Alignment.bottomRight, child:
                            Padding(padding: const EdgeInsets.only(right: 20, bottom: 20), child: FloatingActionButton.extended(
                                onPressed: () {
                                    setState(() {
                                        pageIndex = 1;
                                    });
                                },
                                label: const Text("Next"), 
                                icon: const Icon(Icons.navigate_next)
                            ))
                        ),
                        Align(alignment: Alignment.bottomLeft, child:
                            Padding(padding: const EdgeInsets.only(left: 20, bottom: 20), child: FloatingActionButton.extended(
                                onPressed: () {
                                    widget.pageState.widget.globalState.setState(() {
                                        widget.pageState.widget.globalState.isEditingMacro = false;
                                    });
                                },
                                label: const Text("Cancel"),
                                icon: const Icon(Icons.cancel)
                            ))
                        )
                    ]
                );
            case 1:
                pageBuild = Stack(
                    key: const ValueKey<int>(1),
                    children: [
                        const Align(alignment: Alignment.topCenter, child: 
                            Padding(padding: EdgeInsets.only(top: 20), child: Text("Please select he activation clause for your macro"))
                        ),
                        SingleChildScrollView(
                            padding: const EdgeInsets.only(top: 50),
                            scrollDirection: Axis.vertical,
                            child: Wrap(
                                children: MacroType.values.map((e) => MacroTypeCard(macroType: e, callback: (mType) {
                                    setState(() {
                                        macroType = mType;
                                        pageIndex = 2;
                                    });
                                })).toList()
                            ),
                        ),
                        Align(alignment: Alignment.bottomLeft, child:
                            Padding(padding: const EdgeInsets.only(left: 20, bottom: 20), child: FloatingActionButton.extended(
                                onPressed: () {
                                    setState(() {
                                        pageIndex = 0;
                                    });
                                },
                                label: const Text("Previous"),
                                icon: const Icon(Icons.navigate_before)
                            ))
                        )
                    ]
                );
            case 2:
                pageBuild = Stack(
                    key: const ValueKey<int>(2),
                    children: [
                        macroPageMaps[macroType!]!(this),
                        Align(alignment: Alignment.bottomLeft, child:
                            Padding(padding: const EdgeInsets.only(left: 20, bottom: 20), child: FloatingActionButton.extended(
                                onPressed: () {
                                    setState(() {
                                        pageIndex = 1;
                                    });
                                },
                                label: const Text("Previous"),
                                icon: const Icon(Icons.navigate_before)
                            ))
                        )
                    ]
                );
            case 3: //this is the macro actions page
                pageBuild = Stack(
                    key: const ValueKey<int>(3),
                    children: [
                        const Align(alignment: Alignment.topCenter, child: 
                            Padding(padding: EdgeInsets.only(top: 20), child: Text("These are your selected actions"))
                        ),
                        Padding(padding: const EdgeInsets.only(top: 40), child: 
                            SizedBox(
                                height: MediaQuery.of(context).size.height * .7,
                                child: SingleChildScrollView(      
                                    scrollDirection: Axis.vertical,
                                    child: Wrap(
                                        children: macroActions.map((v) {
                                            return MacroActionCard(macroAction: v, callback: (i) {
                                                macroActions.removeAt(i);
                                                macroActionMeta.removeAt(i);
                                            }, index: macroActions.indexOf(v));
                                        }).toList(),
                                    ),
                                ),
                            )
                        ),
                        Align(alignment: Alignment.bottomCenter, child:
                            Padding(padding: const EdgeInsets.only(left: 20, bottom: 20), child: FloatingActionButton(
                                onPressed: () {
                                    setState(() {
                                        pageIndex = 4;
                                    });
                                },
                                child: const Icon(Icons.add)
                            ))
                        ),
                        Align(alignment: Alignment.bottomRight, child:
                            Padding(padding: const EdgeInsets.only(right: 20, bottom: 20), child: FloatingActionButton.extended(
                                onPressed: () async {
                                    MacroStruct macro = createMacroStruct(macroType!, macroName, macroDescription, macroActionMeta, macroActions, macroTypeMeta);
                                    await addMacro(macro);
                                    widget.pageState.widget.globalState.setState(() {
                                        widget.pageState.widget.globalState.isEditingMacro = false;
                                        widget.pageState.macros.add(macro);
                                    });
                                },
                                label: const Text("Done"),
                                icon: const Icon(Icons.check)
                            ))
                        ),
                        Align(alignment: Alignment.bottomLeft, child:
                            Padding(padding: const EdgeInsets.only(left: 20, bottom: 20), child: FloatingActionButton.extended(
                                onPressed: () {
                                    setState(() {
                                        pageIndex = 2;
                                    });
                                },
                                label: const Text("Previous"),
                                icon: const Icon(Icons.navigate_before)
                            ))
                        )
                    ],
                );
            case 4:
                pageBuild = Stack(
                    key: const ValueKey<int>(4),
                    children: [
                        const Align(alignment: Alignment.topCenter, child: 
                            Padding(padding: EdgeInsets.only(top: 20), child: Text("Select a Macro Action"))
                        ),
                        Padding(padding: const EdgeInsets.only(top: 40), child: 
                            SingleChildScrollView(      
                                scrollDirection: Axis.vertical,
                                child: Wrap(
                                    children: macroNicknames.keys.map((key) {
                                // ignore: unnecessary_cast
                                        return MacroActionSelectionCard(macroAction: key, callback: (k) {
                                            //apparently the cast was needed? Man, fuck this language.
                                            setState(() {
                                                macroActionMeta.add({});
                                                macroActions.add(k);
                                                pageIndex = 5;
                                                activeEditingMacroTypeIndex = macroActions.length - 1;
                                            });
                                        });
                                    }).toList()
                                )
                            )
                        ),
                        Align(alignment: Alignment.bottomLeft, child:
                            Padding(padding: const EdgeInsets.only(left: 20, bottom: 20), child: FloatingActionButton.extended(
                                onPressed: () {
                                    setState(() {
                                        pageIndex = 3;
                                    });
                                },
                                label: const Text("Previous"),
                                icon: const Icon(Icons.navigate_before)
                            ))
                        )
                    ],
                );
            case 5:
                pageBuild = Stack(
                    key: const ValueKey<int>(5),
                    children: [
                        macroActionPageMaps[macroActions[activeEditingMacroTypeIndex]]!(this, activeEditingMacroTypeIndex)
                    ]
                );
            default: 
                pageBuild = const Text("Something is terribly wrong here");
        }

        controller.animateTo((pageIndex == 5 || pageIndex == 4) ? 1 / 5 * 4 : 1 / 5 * (pageIndex + 1), duration: const Duration(milliseconds: 200));
        
        return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, animation) {
                return SlideTransition(
                    position: Tween<Offset>(
                        begin: Offset(MediaQuery.of(context).size.width / 100, 0), end: Offset.zero
                    ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOutQuad))
                ,child: child);
            },
            child: Stack(
                children: [
                    LinearProgressIndicator(
                        value: controller.value,
                        semanticsLabel: "Macro Creation Progress",
                    ),
                    pageBuild
                ],
            )
        );
    }
}