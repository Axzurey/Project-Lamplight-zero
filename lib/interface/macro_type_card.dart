import 'package:flutter/material.dart';
import 'package:project_lamplight/types/macro_types.dart';

Map<MacroType, String> descriptions = {
    MacroType.keybound: "Activates when a key or button combination is pressed",
    MacroType.periodic: "Activates at a certain time of a weeekday"
};

Map<MacroType, Color> macroColors = {
    MacroType.keybound: Colors.blue.withAlpha(50),
    MacroType.periodic: Colors.green.withAlpha(50)
};

Map<MacroType, Widget> macroIcons = {
    MacroType.keybound: const Icon(Icons.keyboard),
    MacroType.periodic: const Icon(Icons.alarm)
};

class MacroTypeCard extends StatelessWidget {
    const MacroTypeCard({super.key, required this.macroType, required this.callback});

    final MacroType macroType;
    
    final void Function(MacroType type) callback;

    @override
    Widget build(BuildContext context) {
        return SizedBox(
            width: 400,
            height: 150,
            child: Card(
                margin: const EdgeInsets.all(5),
                child: InkWell(
                    splashColor: macroColors[macroType],
                    onTap: () {
                        callback(macroType);
                    },
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                            ListTile(
                                leading: macroIcons[macroType]!,
                                title: Text(macroType.name),
                                subtitle: Text(descriptions[macroType]!),
                            )
                        ],
                    ),
                )
            ),
        );
    }
}