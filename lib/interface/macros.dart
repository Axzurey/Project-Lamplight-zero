import 'package:flutter/material.dart';
import 'package:project_lamplight/functions/firesave.dart';
import 'package:project_lamplight/interface/macro_card.dart';
import 'package:project_lamplight/interface/macro_editor_page.dart';
import 'package:project_lamplight/main.dart';
import 'package:project_lamplight/types/macro_types.dart';

class MacrosPage extends StatefulWidget {
  	const MacrosPage({super.key, required this.globalState});

    final GlobalPageState globalState;

  	@override
  	State<MacrosPage> createState() => MacrosPageState();
}

class MacrosPageState extends State<MacrosPage> {

	List<MacroStruct> macros = [];

	@override
	Widget build(BuildContext context) {

        getMacros().then((value) {
            if (value.length == macros.length) return;
            setState(() {
                macros = value;
            });
        });

		return widget.globalState.isEditingMacro ? Stack(
            children: [
                Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: MacroEditorPage(pageState: this),
                )
            ]
        ) : Stack(
			children: [
                // ignore: sized_box_for_whitespace
                Container( //I'm not trying to whitespace this -_-
                    width: MediaQuery.of(context).size.width,
                    child: Padding(padding: const EdgeInsets.only(top: 40),
                        child: SingleChildScrollView(      
                            scrollDirection: Axis.vertical,
                            child: Wrap(
                                children: macros.map((e) => Center(
                                    child: MacroCard(macro: e, onClick: () {
                                        //TODO: EDIT MACRO
                                    }),
                                )).toList(),
                            ),
                        )
                    )
                )
			],
		);
	}
}