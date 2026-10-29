# High Card Balatro Mod
简体中文 | [English](Readme.md)

**High Card**是一款适用于游戏Balatro的Mod，灵感来自同名日本多媒体企划《至高之牌》，加入了52张参考该企划相关设定设计的独特小丑牌。

## 功能特色

- **全新小丑牌** — 52张以《至高之牌》的X-Plaing Cards为原型的小丑牌。
- **全新挑战** — 新增10个有关上述新小丑牌的挑战。
- **石头牌显示** — 在侧边提示框中显示石头牌隐藏的牌面花色与点数。
- **原版游戏补丁** — 目录中的文件`lovely.toml`修复了原版Balatro游戏中“骷髅先生”无法在牌堆耗尽时挽救游戏的bug。
- **多语言支持** — 提供英语、简体中文和繁体中文翻译。

## 兼容性

以下配置已完成测试：

- **Balatro：** `v1.0.1o-full`
- **Steamodded (SMODS)：** `v26.1002.0`
- **Lovely注入器：** `v0.10.0`
- **操作系统：** Windows 11

其他版本或配置可能兼容，但尚未经过完整测试。

## 运行需求

- [Balatro](https://store.steampowered.com/app/2379780/Balatro/) — `v1.0.1o-full`
- [Steamodded (SMODS)](https://github.com/Steamodded/smods) — `v26.1002.0`
- [Lovely Injector](https://github.com/ethangreen-dev/lovely-injector) — `v0.10.0`

安装本Mod前，请先安装Steamodded和Lovely并确保它们能正常运行。

## 安装方法

1. 安装Balatro、Steamodded和Lovely。
2. 下载release中的ZIP压缩包并解压。
3. 找到包含`HighCard.lua`、`main.json`和`lovely.toml`的Mod文件夹。
4. 将Mod文件夹直接放入Balatro的`Mods`目录中，若名称不同则将文件夹重命名为`HighCard`，并确保Mod文件没有被额外的文件夹层级包裹。

   - **Windows：** `%AppData%/Balatro/Mods/`
   - **macOS：** `~/Library/Application Support/Balatro/Mods/`
   - **Linux / Steam Deck：** Mods文件夹的具体位置取决于安装方式。对于通过Proton运行的安装方式，请参阅[Steamodded Linux安装指南](https://github.com/Steamodded/smods/wiki/Installing-Steamodded-linux)。

5. 启动Balatro，并在Mods菜单中确认**High Card**成功显示。

若对应位置不存在`Mods`文件夹，请自行创建。

## 目录结构

```text
HighCard/
├── assets/
│   ├── 1x/
│   └── 2x/
├── localization/
│   ├── en-us.lua
│   ├── zh_CN.lua
│   └── zh_TW.lua
├── HighCard.lua
├── lovely.toml
└── main.json
```

## 语言支持

目前支持以下语言：

- 英语（`en-us`）
- 简体中文（`zh_CN`）
- 繁体中文（`zh_TW`）

## 问题反馈与建议

如果你遇到Bug或兼容性问题，请[提交 Issue](../../issues)。

反馈时请尽可能提供以下信息：

- Balatro版本
- Steamodded版本
- Lovely版本
- 问题的复现步骤
- 相关错误日志（如有）

欢迎有关小丑牌平衡性调整和新增语言翻译的建议。

## 参与贡献

欢迎提交Bug报告、平衡性调整建议和新增语言翻译。

你可以[提交Pull Request](../../pulls)以供项目维护者审查，但并不表明如若此做将获得修改本Mod并重新发布的许可。

## 许可证

本项目采用自定义非商业使用许可证。

你可以出于个人非商业用途免费下载、使用和重新分发未经修改的原版Mod，但必须遵守许可证中的相关条款；

未经版权持有人事先书面许可，不得重新分发本Mod的修改版本，也不得将其用于商业用途。

完整条款请参阅[LICENSE](LICENSE)。

作为非官方的个人创作项目，本项目与《至高之牌》的创作者及权利持有人没有任何关联，也并未获得其任何形式的授权与赞助。
