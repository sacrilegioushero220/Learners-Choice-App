enum TrafficSignType {
  mandatory,
  cautionary,
  informatory,
}

extension TrafficSignTypeExtension on TrafficSignType {
  String get path {
    switch (this) {
      case TrafficSignType.mandatory:
        return 'mandatorySigns';
      case TrafficSignType.cautionary:
        return 'cautionarySigns';
      case TrafficSignType.informatory:
        return 'informatorySigns';
      default:
        return 'mandatorySigns';
    }
  }
}
