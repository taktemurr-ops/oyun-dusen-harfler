import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_dusen_harfler/oyun_dusen_harfler.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(dusenHarflerConfig.title.length, 33);
    expect(dusenHarflerConfig.tagline.length, 33);
    for (final s in dusenHarflerConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(dusenHarflerConfig.gameId, dusenHarflerId);
    expect(dusenHarflerRules.gameId, dusenHarflerId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(dusenHarflerRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: dusenHarflerId, optionalMechanics: dusenHarflerRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      dusenHarflerRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(dusenHarflerRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
