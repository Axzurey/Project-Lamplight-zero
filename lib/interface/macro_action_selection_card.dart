import 'package:flutter/material.dart';

import '../types/macro_types.dart';
import 'macro_action_card.dart';

class MacroActionSelectionCard extends StatelessWidget {
    const MacroActionSelectionCard({super.key, required this.macroAction, required this.callback});

    final ActionType macroAction;
    
    final void Function(ActionType macroAction) callback;

    @override
    Widget build(BuildContext context) {
        return SizedBox(
            width: 400,
            height: 150,
            child: Card(
                margin: const EdgeInsets.all(5),
                child: InkWell(
                    splashColor: macroColors[macroAction],
                    onTap: () {
                        callback(macroAction);
                    },
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            ListTile(
                                leading: macroIcons[macroAction]!,
                                title: Text(macroNicknames[macroAction]!),
                                subtitle: Text(macroDescriptions[macroAction]!),
                            )
                        ],
                    ),
                )
            ),
        );
    }
}