# rime-selected

Rime 精选词库，本仓库从 [alswl/Rime](https://github.com/alswl/Rime) 剥离。

- `essay.txt` Rime 原版 essay 中词频高于 700 的词汇和单字（推荐，68k)
  - `mv essay.txt essay.origin.txt; cat essay.origin.txt | awk '{if($2>700){print $0}}' > essay.txt`
- `luna_pinyin.xiandaihanyuchangyongcibiao.dict.yaml`：教育部发布的现代汉语常用词表（教育部，强烈推荐，51k）
- `luna_pinyin.chengyusuyu.dict.yaml` 成语俗语（搜狗，40k）
   - https://pinyin.sogou.com/dict/detail/index/15097
- `luna_pinyin.sijixingzhenquhuadimingciku.dict.yaml`: 四级行政区划地名词库（搜狗）
   - https://pinyin.sogou.com/dict/detail/index/482
- `luna_pinyin.jisuanjicihuidaquan.dict.yaml`：计算机词汇大全（搜狗）
   - https://pinyin.sogou.com/dict/detail/index/15117
- `luna_pinyin.wangluoliuxingxinci.dict.yaml`: 网络流行新词（搜狗，15k，manual updated）
   - https://pinyin.sogou.com/dict/detail/index/4
- `luna_pinyin.shanghaishichengshixinxijingxuan.dict.yaml` 上海市城市信息精选（搜狗）
   - https://pinyin.sogou.com/dict/detail/index/19430
- `luna_pinyin.shanghaihuadaquan.dict.yaml` 上海话大全（搜狗）
   - https://pinyin.sogou.com/dict/detail/index/22413
- `luna_pinyin.mingxing.dict.yaml` 明星（搜狗）
   - https://pinyin.sogou.com/dict/detail/index/15209
- `luna_pinyin.zhongguolishicihuidaquan.dict.yaml` 中国历史词汇大全（搜狗）
   - https://pinyin.sogou.com/dict/detail/index/15130
- `luna_pinyin.kaifadashenzhuanyongciku.dict.yaml` 开发大神专用词库（搜狗，0.3k，manual updated）
   - https://pinyin.sogou.com/dict/detail/index/75228
- `luna_pinyin.emoji.cldr.dict.yaml`：Emoji parsed from [jolicode/emoji-search: Emoji synonyms to build your own emoji-capable search engine (elasticsearch, solr)](https://github.com/jolicode/emoji-search)（强烈推荐 manual updated）
  - include emoji 7.0, eg. 🏎️ (sai che)
  - include emoji 8.0, eg. 🦄️ (du jiao shou)
  - include emoji 9.0, eg. 🤡 (xiao chou)
  - include emoji 10.0, eg. 🧠 (da nao)
  - include emoji 11.0, eg. 🧯 (mie huo qi) 🥽 (hu mu jing)
  - include emoji 12.0, eg. 🧎 (gui xia) 🪂 (tiao san)
  - include emoji 13.0, eg. 🥲 (yan lei) 🐻‍❄ (bei ji xiong)
  - include emoji 14.0, eg. 🪫 (dian liang bu zu)
  - include emoji 15.0, eg. 🪼 (shui mu)
- `luna_pinyin.emoji.apple.dict.yaml`：Apple iOS 10 Emoji
- `luna_pinyin.emoji.scomper.dict.yaml`：Scomper 维护 Emoji（包含 Unicode 9.0）
- `luna_pinyin.kaomoji.dict.yaml`：搜狗颜文字


## 如何使用

首先确保已经安装了 Plum，见 [rime/plum](https://github.com/rime/plum)。

其次进行安装词库：

```
cd your-path-to-rime
./plum/rime-install alswl/rime-selected

# 编辑你使用的输入方式，比如 luna_pinyin.custom.dict.yaml
vim luna_pinyin.custom.dict.yaml
# 添加对应内容：

---
name: luna_pinyin.custom
version: "2018.10.05"
sort: by_weight
use_preset_vocabulary: true
import_tables:
    - luna_pinyin.poetry
    - luna_pinyin.xiandaihanyuchangyongcibiao # <- 比如这条
```
