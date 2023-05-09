import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

import '../../src/model/social_info.dart';

Future<List<SocialInfo>> loadSocialListFromYaml(String yamlPath) async {
  final data = await rootBundle.loadString(yamlPath);
  YamlMap mapData = loadYaml(data);

  final List<SocialInfo> socialInfos = <SocialInfo>[];

  final YamlList yamlList = mapData['socials'];

  for (final item in yamlList.value) {
    final socialInfo = SocialInfo(
      name: item['name'],
      url: item['url'],
    );
    socialInfos.add(socialInfo);
  }
  return socialInfos;
}
