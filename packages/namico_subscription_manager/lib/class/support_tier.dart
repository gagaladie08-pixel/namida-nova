import 'package:namico_subscription_manager/core/enum.dart';

class SupportTier {
  final String? userName;
  final double? ammountUSD;
  final DateTime? declinedSince;
  final DateTime? createdAt;
  final MembershipType membershipType;

  const SupportTier({
    this.userName,
    this.ammountUSD,
    this.declinedSince,
    this.createdAt,
    this.membershipType = MembershipType.unknown,
  });

  MembershipType toMembershipType() => membershipType;
}

class PatreonToken {
  final String? accessToken;
  const PatreonToken({this.accessToken});
}
