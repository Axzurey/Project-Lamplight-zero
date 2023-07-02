import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:project_lamplight/types/macro_types.dart';

MacroAction createMacroAction(ActionType actionType, Map<dynamic, dynamic> metadata) {
    switch (actionType) {
        case ActionType.modifyBrightness:
            return MacroAction.modifyBrightness(metadata as MacroModifyBrightnessAction);
        case ActionType.modifyVolume:
            return MacroAction.modifyVolume(metadata as MacroModifyVolumeAction);
        case ActionType.playAudio:
            return MacroAction.playAudio(metadata as MacroPlayAudioAction);
        default:
            throw '$actionType is not implemented';
    }
}

MacroStruct createMacroStruct(MacroType macroType, String name, String description, List<Map<dynamic, dynamic>> metadata, List<ActionType> actions, Map<String, dynamic> meta) {
    
    List<MacroAction> trueActions = [];

    for (int i = 0; i < trueActions.length; i++) {
        trueActions.add(createMacroAction(actions[i], metadata[i]));
    }

    switch (macroType) {
        case MacroType.periodic:
            return MacroStruct.periodic((
                metadata: (
                    day: meta['days']!,
                    hour: meta['hour']!,
                    minute: meta['minute']!
                ),
                data: (
                    description: description,
                    name: name,
                    type: macroType,
                    actionSequence: trueActions
                )
            ) as PeriodicMacroStruct);
        case MacroType.keybound:
            return MacroStruct.keybound((
                metadata: (
                    keys: meta['keys']
                ),
                data: (
                    description: description,
                    name: name,
                    type: macroType,
                    actionSequence: trueActions
                )
            ) as KeyboundMacroStruct);
        default:
            throw '$macroType is not implemented';
    }
}

Future<bool> isMacroNameInUse(String macroname) async {
    if (FirebaseAuth.instance.currentUser != null) {

        List<MacroStruct> macros = await getMacros();

        return macros.indexWhere((element) => element.macro.data.name == macroname) != -1;
    }
    return true; //i don't want to error here, rather i'll just check in advance if they're authenticated.
}

Future<void> addMacro(MacroStruct macro) async {
    if (FirebaseAuth.instance.currentUser != null) {

        DatabaseReference ref = FirebaseDatabase.instance.ref(FirebaseAuth.instance.currentUser!.uid);
        print(macro.macro.data.name);
        await ref.update({
            "macros/${macro.macro.data.name}": macro.toJson(),
        });
    }
}

Future<List<MacroStruct>> getMacros() async {
    if (FirebaseAuth.instance.currentUser != null) {
        try {
            DatabaseReference ref = FirebaseDatabase.instance.ref(FirebaseAuth.instance.currentUser!.uid);
            final snapshot = await ref.child("macros").get();

            if (snapshot.exists) {
                Map<Object?, Object?> val = snapshot.value as Map<Object?, Object?>;
                Map<String, dynamic> truevals = {};

                for (var item in val.keys) {
                    truevals[item.toString()] = Map<String, dynamic>.from(val[item] as dynamic);
                }

                List<MacroStruct> l = List<MacroStruct>.empty(growable: true);
                
                truevals.forEach((key, value) {
                    MacroStruct c = MacroStruct.fromJson(value);
                    l.add(c);
                });

                return l;
            }
            else {
                return List<MacroStruct>.empty();
            }
        }
        catch(_) {
            return List<MacroStruct>.empty();
        }

    }
    return List<MacroStruct>.empty();
}