import 'package:namico_subscription_manager/core/enum.dart';

class SubscriptionAlreadyClaimedException implements Exception {
  final String? message;
  const SubscriptionAlreadyClaimedException([this.message]);
}

class SupportTier {
  final String? userName;
  final double? ammountUSD;
  final DateTime? declinedSince;
  final DateTime? createdAt;
  final MembershipType membershipType;
  final DateTime? lastChecked;
  final String? imageUrl;

  const SupportTier({
    this.userName,
    this.ammountUSD,
    this.declinedSince,
    this.createdAt,
    this.membershipType = MembershipType.unknown,
    this.lastChecked,
    this.imageUrl,
  });

  MembershipType toMembershipType() => membershipType;
}

class PatreonToken {
  final String? accessToken;
  const PatreonToken({this.accessToken});
}
