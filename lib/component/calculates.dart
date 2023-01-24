double expPythagorean({
  required int runs,
  required int earedRuns,
}) {
  return double.parse(
      (runs * runs * 100 / (runs * runs + earedRuns * earedRuns))
          .toStringAsFixed(1));
}
