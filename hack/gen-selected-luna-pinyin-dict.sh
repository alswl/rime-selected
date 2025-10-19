#!/usr/bin/env bash

# calculate splitter line num
echo '
---
name: luna_pinyin
version: "2024.02.10"
sort: by_weight
use_preset_vocabulary: true
...
' > selected.luna_pinyin.dict.yaml

# Use gawk to filter: extract all characters from xiandaihanyuchangyongcibiao (including from words)
gawk -F '\t' '
BEGIN {
    # Scan xiandaihanyuchangyongcibiao and extract ALL characters (not just single-char entries)
    while ((getline < "selected.xiandaihanyuchangyongcibiao.dict.yaml") > 0) {
        if (NF >= 2) {
            # Split the first field into individual characters
            len = length($1)
            for (i = 1; i <= len; i++) {
                char = substr($1, i, 1)
                allowed[char] = 1
            }
        }
    }
    close("selected.xiandaihanyuchangyongcibiao.dict.yaml")
}
# Process luna_pinyin.dict.yaml: only output if character is in the whitelist
NF >= 2 && length($1) == 1 && ($1 in allowed) {
    print $0
}
' luna_pinyin.dict.yaml >> selected.luna_pinyin.dict.yaml
