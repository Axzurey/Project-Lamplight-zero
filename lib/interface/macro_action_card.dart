import 'package:flutter/material.dart';
import 'package:project_lamplight/types/macro_types.dart';

Map<ActionType, Color> macroColors = {
    ActionType.modifyBrightness: Colors.blue.withAlpha(50),
    ActionType.modifyVolume: Colors.green.withAlpha(50),
    ActionType.playAudio: Colors.red.withAlpha(50),
};

Map<ActionType, String> macroDescriptions = {
    ActionType.modifyBrightness: "Changes the system brightness",
    ActionType.modifyVolume: "Changes the system volume",
    ActionType.playAudio: "Plays an audio file",
};

Map<ActionType, String> macroNicknames = {
    ActionType.modifyBrightness: "Modify Brightness",
    ActionType.modifyVolume: "Modify Volume",
    ActionType.playAudio: "Play Sound",
};

Map<ActionType, Widget> macroIcons = {
    ActionType.modifyBrightness: const Icon(Icons.sunny),
    ActionType.modifyVolume: const Icon(Icons.volume_up),
    ActionType.playAudio: const Icon(Icons.audio_file),
};

class MacroActionCard extends StatelessWidget {
    const MacroActionCard({super.key, required this.macroAction, required this.callback, required this.index});

    final ActionType macroAction;

    final int index;
    
    final void Function(int index) callback;

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
                        callback(index);
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