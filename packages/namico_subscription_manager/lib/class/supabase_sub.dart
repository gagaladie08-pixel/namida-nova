import 'package:namico_subscription_manager/core/enum.dart';

class SupabaseSub {
  final String? uuid;
  final String? email;
  final String? name;
  final DateTime? availableTill;
  final int days;
  final bool claimed;
  final DateTime? lastChecked;
  final MembershipType membershipType;

  const SupabaseSub({
    this.uuid,
    this.email,
    this.name,
    this.availableTill,
    this.days = 0,
    this.claimed = false,
    this.lastChecked,
    this.membershipType = MembershipType.unknown,
  });

  MembershipType toMembershipType() => membershipType;

  Map<String, dynamic> toMap() => {
    'uuid': uuid,
    'email': email,
    'name': name,
    'available_till': availableTill?.toIso8601String(),
    'days': days,
    'claimed': claimed,
    'last_checked': lastChecked?.toIso8601String(),
  };
}
