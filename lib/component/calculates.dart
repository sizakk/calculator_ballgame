double expPythagorean({
  required int runs,
  required int earedRuns,
}) {
  return double.parse((runs * runs / (runs * runs + earedRuns * earedRuns))
      // .floor()
      .toStringAsFixed(3));
}
