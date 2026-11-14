#!/usr/bin/env python3
import os
import re
import json

def main():
    arb_path = 'external/language/translations/en.arb'
    if not os.path.exists(arb_path):
        print(f"File not found: {arb_path}")
        return

    with open(arb_path, 'r', encoding='utf-8') as f:
        arb = json.load(f)

    # Parametrized keys mapping: (value_text, placeholders_dict)
    parametrized_keys = {
        "bitPerfectActiveOn": (
            "Bit-perfect active on {device} ({format})",
            {"device": {"type": "String"}, "format": {"type": "String"}}
        ),
        "bitPerfectUpTo": (
            "Bit-perfect up to {format}",
            {"format": {"type": "String"}}
        ),
        "couldNotConnectToName": (
            "Could not connect to {name}",
            {"name": {"type": "String"}}
        ),
        "countLanguages": (
            "{count} languages",
            {"count": {"type": "int"}}
        ),
        "embeddedLyricsArePrioritized": (
            "Embedded lyrics are prioritized over {setting}",
            {"setting": {"type": "String"}}
        ),
        "forcedOffBy": (
            "Forced off by {mode}",
            {"mode": {"type": "String"}}
        ),
        "graphicEqualizerBands": (
            "{count} bands",
            {"count": {"type": "int"}}
        ),
        "importAppleMusicHistoryGuide": (
            "Import Apple Music history guide: {link}",
            {"link": {"type": "String"}}
        ),
        "importSourceData": (
            "Import data from {source}",
            {"source": {"type": "String"}}
        ),
        "lyricsFilesArePrioritized": (
            "Lyrics files are prioritized over {setting}",
            {"setting": {"type": "String"}}
        ),
        "newTracksSimilarSubtitle": (
            "Tracks similar to {currentTrack}",
            {"currentTrack": {"type": "String"}}
        ),
        "sourcePerScope": (
            "{source} per scope",
            {"source": {"type": "String"}}
        ),
        "usbDirectAwaitingPermission": (
            "Waiting for permission for {device}",
            {"device": {"type": "String"}}
        ),
        "usbDirectClaiming": (
            "Claiming {device}",
            {"device": {"type": "String"}}
        ),
        "usbDirectFailed": (
            "USB direct failed on {device}",
            {"device": {"type": "String"}}
        ),
        "usbDirectPermissionDenied": (
            "Permission denied for {device}",
            {"device": {"type": "String"}}
        ),
        "usbDirectUnsupportedDevice": (
            "Unsupported device: {device}",
            {"device": {"type": "String"}}
        ),
        "usbDirectWaitingPlayback": (
            "Waiting for playback on {device}",
            {"device": {"type": "String"}}
        ),
        "useForDevice": (
            "Use for {device}",
            {"device": {"type": "String"}}
        ),
    }

    # Find all lang.<key> references in lib/
    lang_calls = set()
    for root, dirs, files in os.walk('lib'):
        for file in files:
            if file.endswith('.dart'):
                with open(os.path.join(root, file), 'r', encoding='utf-8', errors='ignore') as f:
                    content = f.read()
                    matches = re.finditer(r'lang\.([a-zA-Z0-9_]+)', content)
                    for m in matches:
                        lang_calls.add(m.group(1))

    def key_to_label(key):
        s = re.sub(r'([A-Z])', r' \1', key)
        words = s.strip().split()
        if not words:
            return key
        return ' '.join([words[0].capitalize()] + [w.lower() for w in words[1:]])

    added_count = 0
    for k in sorted(lang_calls):
        if k not in arb:
            if k in parametrized_keys:
                val, placeholders = parametrized_keys[k]
                arb[k] = val
                arb[f"@{k}"] = {"placeholders": placeholders}
            else:
                arb[k] = key_to_label(k)
            added_count += 1

    with open(arb_path, 'w', encoding='utf-8') as f:
        json.dump(arb, f, indent=2, ensure_ascii=False)

    print(f"Patched {added_count} missing translations into {arb_path}")

if __name__ == '__main__':
    main()
