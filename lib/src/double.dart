extension AsPercentageString on double {
  String get asPercentageString => "${(this * 100).floor()}%";
}
