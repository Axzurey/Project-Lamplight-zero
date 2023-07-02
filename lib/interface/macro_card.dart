import 'package:flutter/material.dart';
import 'package:project_lamplight/types/macro_types.dart';

import 'macro_type_card.dart';

class MacroCard extends StatelessWidget {
    const MacroCard({super.key, required this.macro, required this.onClick});

    final MacroStruct macro;
    final Function() onClick;

    @override
    Widget build(BuildContext context) {
        return SizedBox(
            width: MediaQuery.of(context).size.width * .92,
            height: MediaQuery.of(context).size.height * .15,
            child: Card(
                color: const Color.fromARGB(200, 3, 169, 244),
                margin: const EdgeInsets.all(5),
                child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    splashColor: macroColors[macro.macro.data.type],
                    onTap: onClick,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            ListTile(
                                leading: macroIcons[macro.macro.data.type],
                                title: Text(macro.macro.data.name, textScaleFactor: 1.5),
                                subtitle: Text(macro.macro.data.description, textScaleFactor: 1.25),
                            )
                        ],
                    ),
                )
            ),
        );
    }
}