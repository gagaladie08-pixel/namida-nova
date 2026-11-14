import 'package:namico_subscription_manager/class/supabase_sub.dart';
import 'package:namico_subscription_manager/class/support_tier.dart';
import 'package:namico_subscription_manager/core/enum.dart';

export 'package:namico_subscription_manager/class/supabase_sub.dart';
export 'package:namico_subscription_manager/class/support_tier.dart';
export 'package:namico_subscription_manager/core/enum.dart';

class NamicoSubscriptionManager {
  static void Function(String message, Object? e, StackTrace? st)? onError;

  static Future<void> initialize({
    dynamic dataDirectory,
    dynamic encryptionKey,
    dynamic isNewKey,
    dynamic Function(dynamic)? onCacheLoaded,
    dynamic Function(dynamic)? onSupabaseLoaded,
  }) async {}

  static final patreon = _PatreonManager();
  static final supabase = _SupabaseManager();
  static final cacheManager = _CacheManager();
}

class _PatreonManager {
  Future<SupportTier?> getUserSupportTierInCacheValid() async => null;
  Future<SupportTier?> getUserSupportTier({dynamic redirectUrlCompleter, dynamic pageConfig, dynamic signIn}) async => null;
  Future<SupportTier?> getUserSupportTierWithoutLogin() async => null;
}

class _SupabaseManager {
  Future<SupabaseSub?> getUserSubValidCache() async => null;
  Future<SupabaseSub?> getUserSubInCache() async => null;
  Future<SupabaseSub> fetchUserValid({dynamic email, dynamic uuid, dynamic deviceId}) async => const SupabaseSub();
  Future<SupabaseSub> claimSubscription({dynamic email, dynamic uuid, dynamic deviceId}) async => const SupabaseSub();
  Future<void> requestMove({dynamic email, dynamic uuid, dynamic deviceId}) async {}
  Future<SupabaseSub> confirmMove({dynamic email, dynamic uuid, dynamic deviceId, dynamic moveCode}) async => const SupabaseSub();
}

class _CacheManager {
  Future<void> deletePatreonCache() async {}
  Future<void> deleteSupabaseCache() async {}
  Future<PatreonToken?> getPatreonTokenCache() async => null;
}
