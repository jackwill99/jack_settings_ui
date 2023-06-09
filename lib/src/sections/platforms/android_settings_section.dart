import 'package:flutter/material.dart';
import 'package:jack_settings_ui/src/tiles/abstract_settings_tile.dart';
import 'package:jack_settings_ui/src/utils/settings_theme.dart';

class AndroidSettingsSection extends StatelessWidget {
  const AndroidSettingsSection({
    required this.tiles,
    this.margin,
    this.title,
    this.description,
    Key? key,
  }) : super(key: key);

  final List<AbstractSettingsTile> tiles;
  final EdgeInsetsDirectional? margin;
  final Widget? title;
  final Widget? description;

  @override
  Widget build(BuildContext context) {
    return buildSectionBody(context);
  }

  Widget buildSectionBody(BuildContext context) {
    final theme = SettingsTheme.of(context);
    final scaleFactor = MediaQuery.of(context).textScaleFactor;
    final tileList = buildTileList();

    if (title == null) {
      return tileList;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.only(
            top: 24 * scaleFactor,
            bottom: 10 * scaleFactor,
            start: 24,
            end: 24,
          ),
          child: DefaultTextStyle(
            style: TextStyle(
              color: theme.themeData.titleTextColor,
            ),
            child: title!,
          ),
        ),
        Container(
          color: theme.themeData.settingsSectionBackground,
          child: tileList,
        ),
        if (description != null)
          Padding(
            padding: EdgeInsetsDirectional.only(start: 24, end: 24),
            child: DefaultTextStyle(
              style: TextStyle(
                color: theme.themeData.tileDescriptionTextColor,
              ),
              child: description!,
            ),
          ),
      ],
    );
  }

  Widget buildTileList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: tiles.length,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return tiles[index];
      },
    );
  }
}
