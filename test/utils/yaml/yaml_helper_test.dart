import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/src/model/social_info.dart';
import 'package:portfolio/utils/yaml/yaml_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  var yamlPath = 'config/social_infos.yaml';

  test('convert valid yaml to model', () async {
    final data = await loadSocialListFromYaml(yamlPath);
    expect(data, isA<List<SocialInfo>>());
    expect(data, isNotEmpty);
    expect(data.length, 3);
    expect(data[0].name, 'facebook');
    expect(data[0].url, 'https://www.facebook.com/trido392');
    expect(data[1].name, 'github');
    expect(data[1].url, 'https://github.com/TorryDo');
    expect(data[2].name, 'linkedIn');
    expect(data[2].url, 'https://www.linkedin.com/in/tridonguyen');
  });

  // test('convert invalid yaml to model', () async {
  //   expect(() => fromYaml('invalid.yaml'), throwsA(isA<FormatException>()));
  // });
}
