part of '../party_page.dart';

class _PartyInfoSections extends StatelessWidget {
  const _PartyInfoSections();

  @override
  Widget build(BuildContext context) {
    final double horizontalMargin = Dimensions.inst.showSubpageInfoAtSideContext(context) ? 0.0 : Dimensions.inst.getSettingsHorizontalMargin(context);
    return Stack(
      children: [
        SuperSmoothListView(
          padding: kBottomPaddingInsets.add(EdgeInsets.symmetric(horizontal: horizontalMargin)),
          children: const [
            _PartyMembersHeader(),
            _PartyNowPlayingCenterCard(),
            _ReactionsCard(),
            _HeaderCard(),
            _JoinRequestsCard(),
            _MembersCard(),
            _PartyHistoryLive(),
            _HostSettingsCard(),
          ],
        ),
        const Positioned.fill(
          child: _ReactionOverlay(),
        ),
      ],
    );
  }
}

class _PartyMembersHeader extends StatelessWidget {
  const _PartyMembersHeader();

  @override
  Widget build(BuildContext context) {
    final controller = PartyController.inst;
    return ObxO(
      rx: controller.infoTick,
      builder: (context, _) {
        final members = controller.state.members.values.toList();
        if (members.isEmpty) return const SizedBox();
        return NContainer(
          margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          decoration: (colors) => BoxDecoration(
            color: colors.card.withOpacityExt(0.55),
            borderRadius: BorderRadius.circular(20.0.multipliedRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  NIcon(Broken.profile_2user, size: 16.0, color: NColors.defaultIcon()),
                  const SizedBox(width: 8.0),
                  NamidaText(
                    '${lang.members} (${members.length})',
                    style: const NText(.small, weight: FontWeight.w600),
                  ),
                  const Spacer(),
                  if (controller.code != null)
                    InkWell(
                      borderRadius: BorderRadius.circular(8.0),
                      onTap: () {
                        final invite = controller.inviteLink;
                        if (invite != null) {
                          NamidaUtils.copyText(invite);
                          snackyy(
                            icon: Broken.tick_circle,
                            title: lang.partyListeningParty,
                            message: "Lien d'invitation copié !",
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            NIcon(Broken.copy, size: 13.0, color: NColors.primary),
                            const SizedBox(width: 4.0),
                            NamidaText(
                              controller.code!,
                              style: const NText(.small, weight: FontWeight.bold),
                              color: NColors.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final member in members) ...[
                      _MemberAvatarPill(member: member),
                      const SizedBox(width: 8.0),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MemberAvatarPill extends StatelessWidget {
  final PartyMember member;

  const _MemberAvatarPill({required this.member});

  @override
  Widget build(BuildContext context) {
    final isHost = member.role == PartyRole.host;
    final initial = member.name.isNotEmpty ? member.name.substring(0, 1).toUpperCase() : '?';
    return NBuilder(
      builder: (context, colors) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: isHost ? colors.primary.withOpacityExt(0.18) : colors.secondaryContainer.withOpacityExt(0.35),
          borderRadius: BorderRadius.circular(22.0),
          border: isHost ? Border.all(color: colors.primary.withOpacityExt(0.6), width: 1.2) : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 11.0,
              backgroundColor: isHost ? colors.primary : colors.secondary,
              child: Text(
                initial,
                style: const TextStyle(fontSize: 11.0, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              member.name,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: isHost ? FontWeight.bold : FontWeight.w500,
              ),
            ),
            if (isHost) ...[
              const SizedBox(width: 5.0),
              const Icon(Icons.star, size: 13.0, color: Colors.amber),
            ],
          ],
        ),
      ),
    );
  }
}

class _PartyNowPlayingCenterCard extends StatelessWidget {
  const _PartyNowPlayingCenterCard();

  @override
  Widget build(BuildContext context) {
    final controller = PartyController.inst;
    return NContainer(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: (colors) => BoxDecoration(
        color: colors.card.withOpacityExt(0.7),
        borderRadius: BorderRadius.circular(24.0.multipliedRadius),
        border: Border.all(
          color: colors.cardTheme.withOpacityExt(0.25),
          width: 1.0,
        ),
      ),
      child: ObxO(
        rx: controller.queueTick,
        builder: (context, _) => ObxO(
          rx: controller.anchorTick,
          builder: (context, _) {
            final state = controller.state;
            final me = controller.me;
            final anchor = state.anchor;
            final entry = state.currentEntry;
            final canControl = me != null && entry != null && state.canControl(me);
            final artworkSize = (namida.width * 0.48).clampDouble(160.0, 220.0);
            final ytId = entry?.ytId ?? entry?.fallbackYtId;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.0.multipliedRadius),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 16.0,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(22.0.multipliedRadius),
                      child: SizedBox(
                        width: artworkSize,
                        height: artworkSize,
                        child: ytId != null
                            ? YtThumbnail(
                                videoId: ytId,
                                thumbnailSize: artworkSize,
                                fit: BoxFit.cover,
                              )
                            : Obx((context) {
                                final current = Player.inst.currentItem.valueR;
                                if (current is Selectable) {
                                  return ArtworkWidget(
                                    track: current.track,
                                    thumbnailSize: artworkSize,
                                    forceSquared: true,
                                  );
                                }
                                return Container(
                                  color: Colors.black12,
                                  child: const Center(
                                    child: Icon(Broken.musicnote, size: 54.0),
                                  ),
                                );
                              }),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                NamidaText(
                  entry == null ? lang.partyQueueEmpty : entry.title,
                  style: const NText(.large, weight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                if (entry != null && entry.artist.isNotEmpty) ...[
                  const SizedBox(height: 4.0),
                  NamidaText(
                    entry.artist,
                    style: NText.medium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
                const SizedBox(height: 12.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  constraints: const BoxConstraints(minHeight: 46.0),
                  child: const SimpleLyricsLineWidget(
                    karaoke: true,
                    maxLines: 2,
                    softWrap: true,
                    fitToWidth: true,
                  ),
                ),
                const SizedBox(height: 10.0),
                _PositionBar(
                  anchor: anchor,
                  durationMS: entry?.durationMS ?? 0,
                  enabled: canControl,
                ),
                const SizedBox(height: 6.0),
                if (canControl)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NamidaIconButton(
                        icon: Broken.previous,
                        iconSize: 28.0,
                        tooltip: () => lang.previous,
                        onPressed: () => controller.sendCommand(const PartyMsg.previous()),
                      ),
                      const SizedBox(width: 16.0),
                      NBuilder(
                        builder: (context, colors) => Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colors.primary,
                          ),
                          child: NamidaIconButton(
                            icon: anchor.playing ? Broken.pause : Broken.play,
                            iconSize: 36.0,
                            iconColor: Colors.white,
                            onPressed: () => controller.sendCommand(anchor.playing ? const PartyMsg.pause() : const PartyMsg.play()),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      NamidaIconButton(
                        icon: Broken.next,
                        iconSize: 28.0,
                        tooltip: () => lang.next,
                        onPressed: () => controller.sendCommand(const PartyMsg.next()),
                      ),
                    ],
                  )
                else
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NIcon(Broken.headphone, size: 16.0, color: NColors.defaultIcon()),
                        const SizedBox(width: 6.0),
                        NamidaText(
                          "Lecture synchronisée avec l'hôte",
                          style: NText.small,
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String? countText;

  const _SectionTitle({
    required this.title,
    this.countText,
  });

  @override
  Widget build(BuildContext context) {
    final countText = this.countText;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          if (countText != null) ...[
            NDecoratedBox(
              decoration: (colors) => BoxDecoration(
                borderRadius: BorderRadius.circular(6.0.multipliedRadius),
                color: colors.secondaryContainer.withOpacityExt(0.4),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                child: NamidaText(
                  countText,
                  style: const NText(.small, weight: FontWeight.w600),
                  color: NColors.primary,
                ),
              ),
            ),
            const SizedBox(width: 6.0),
          ],
          Expanded(
            child: NamidaText(
              title,
              style: NText.medium,
            ),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String text;
  final Color color;
  final IconData? icon;

  const _Chip({
    required this.text,
    required this.color,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0.multipliedRadius),
        color: color.withOpacityExt(0.12),
        border: Border.all(color: color.withOpacityExt(0.3)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 12.0,
                color: color,
              ),
              const SizedBox(width: 4.0),
            ],
            NamidaText(
              text,
              style: const NText(.small, size: .s11),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final PartyConnectionStatus status;

  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final colors = NColorsData.of(context);
    final (text, color) = switch (status) {
      PartyConnectionStatus.connected => (lang.partyStatusConnected, Colors.green),
      PartyConnectionStatus.pendingApproval => (lang.partyStatusPendingApproval, Colors.orange),
      PartyConnectionStatus.reconnecting => (lang.partyStatusReconnecting, Colors.orange),
      PartyConnectionStatus.connecting || PartyConnectionStatus.closed => (lang.partyStatusConnecting, colors.primary),
    };
    return _Chip(
      text: text,
      color: color,
    );
  }
}

class _SyncStateChip extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const _SyncStateChip({this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return ObxO(
      rx: PartyController.inst.syncState,
      builder: (context, syncState) {
        final (String text, IconData icon, Color color, void Function()? onTap) = switch (syncState) {
          PartySyncState.catchingUp => (lang.partySyncCatchingUp, Broken.refresh_2, Colors.orange, null),
          PartySyncState.pausedLocally => (lang.partySyncPausedLocally, Broken.play, Colors.orange, Player.inst.play),
          PartySyncState.unavailable => (lang.partySyncUnavailable, Broken.forbidden_2, Colors.red, null),
          PartySyncState.idle || PartySyncState.inSync => ('', Broken.tick_circle, Colors.transparent, null),
        };
        if (text.isEmpty) return const SizedBox();
        return Padding(
          padding: padding,
          child: NamidaInkWell(
            onTap: onTap,
            borderRadius: 6.0,
            bgColor: NColors.fixed(color.withOpacityExt(0.12)),
            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 12.0,
                  color: color,
                ),
                const SizedBox(width: 4.0),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 140.0),
                  child: NamidaText(
                    text,
                    style: const NText(.small, size: .s11),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ReactionsCard extends StatelessWidget {
  const _ReactionsCard();

  @override
  Widget build(BuildContext context) {
    return SettingsCard(
      icon: Broken.emoji_happy,
      title: lang.partyReactions,
      subtitle: null,
      trailing: NamidaIconButton(
        icon: Broken.edit_2,
        iconSize: 18.0,
        tooltip: () => lang.edit,
        onPressed: _editReactions,
      ),
      child: ObxO(
        rx: settings.party.reactions,
        builder: (context, _) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
          child: Row(
            children: [
              for (final emoji in settings.party.reactionsList())
                NamidaInkWell(
                  onTap: () => PartyController.inst.sendReaction(emoji),
                  borderRadius: 14.0,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                  child: Text(
                    emoji,
                    style: const TextStyle(fontSize: 22.0),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

void _editReactions() {
  final controller = TextEditingController(text: settings.party.reactions.value);
  NamidaNavigator.inst.navigateDialog(
    onDisposing: controller.dispose,
    dialog: CustomBlurryDialog(
      icon: Broken.emoji_happy,
      title: lang.partyReactions,
      normalTitleStyle: true,
      trailingWidgets: [
        NamidaIconButton(
          icon: Broken.refresh_left_square,
          iconSize: 20.0,
          tooltip: () => lang.restoreDefaults,
          onPressed: () {
            settings.party.reactions.reset();
            NamidaNavigator.inst.closeDialog();
          },
        ),
      ],
      actions: [
        const CancelButton(),
        NamidaButton(
          text: lang.save,
          onTap: () {
            settings.party.reactions.save(controller.text.trim().nullifyEmpty());
            NamidaNavigator.inst.closeDialog();
          },
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
        child: CustomTagTextField(
          controller: controller,
          hintText: settings.party.defaultReactions,
          labelText: lang.partyReactions,
          maxLines: 1,
        ),
      ),
    ),
  );
}

class _ReactionOverlay extends StatefulWidget {
  const _ReactionOverlay();

  @override
  State<_ReactionOverlay> createState() => _ReactionOverlayState();
}

class _ReactionOverlayState extends State<_ReactionOverlay> with SingleTickerProviderStateMixin {
  late final _animation = AnimationController(vsync: this, duration: const Duration(milliseconds: 1600));
  late final _opacity = TweenSequence<double>([
    TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 1.0),
    TweenSequenceItem(tween: ConstantTween(1.0), weight: 6.0),
    TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 3.0),
  ]).animate(_animation);
  late final _slide = Tween(begin: Offset.zero, end: const Offset(0.0, -1.4)).animate(_animation);

  String? _emoji;
  String? _name;

  @override
  void initState() {
    super.initState();
    _animation.addStatusListener(_onAnimationStatus);
    PartyController.inst.reactionTick.addListener(_onReaction);
  }

  @override
  void dispose() {
    PartyController.inst.reactionTick.removeListener(_onReaction);
    _animation.dispose();
    super.dispose();
  }

  // -- dropping the emoji keeps the ticker idle while nothing is floating
  void _onAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) setState(() => _emoji = null);
  }

  void _onReaction() {
    final reaction = PartyController.inst.lastReaction;
    if (reaction == null) return;
    setState(() {
      _emoji = reaction.$2;
      _name = PartyController.inst.state.members[reaction.$1]?.name;
    });
    _animation.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    final emoji = _emoji;
    if (emoji == null) return const SizedBox();
    final name = _name;
    return IgnorePointer(
      child: Obx(
        (context) => Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Padding(
            padding: EdgeInsets.only(bottom: Dimensions.inst.globalBottomPaddingEffectiveR + 12.0, right: 12.0, left: 12.0),
            child: RepaintBoundary(
              child: FadeTransition(
                opacity: _opacity,
                child: SlideTransition(
                  position: _slide,
                  child: NDecoratedBox(
                    decoration: (colors) => BoxDecoration(
                      color: colors.card.withOpacityExt(0.9),
                      borderRadius: BorderRadius.circular(16.0.multipliedRadius),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            emoji,
                            style: const TextStyle(fontSize: 26.0),
                          ),
                          if (name != null) ...[
                            const SizedBox(width: 8.0),
                            NamidaText(
                              name,
                              style: NText.small,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderCard extends StatelessWidget {
  const _HeaderCard();

  void _onLeaveTap() {
    final controller = PartyController.inst;
    if (!controller.isHost) {
      controller.leave();
      return;
    }
    NamidaNavigator.inst.navigateDialog(
      dialog: CustomBlurryDialog(
        icon: Broken.logout,
        title: lang.partyLeave,
        normalTitleStyle: true,
        actions: const [
          CancelButton(),
        ],
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomListTile(
              icon: Broken.logout,
              title: lang.partyLeave,
              subtitle: lang.partyLeaveSubtitle,
              onTap: () {
                NamidaNavigator.inst.closeDialog();
                controller.leave();
              },
            ),
            CustomListTile(
              icon: Broken.close_circle,
              title: lang.partyCloseForEveryone,
              onTap: () {
                NamidaNavigator.inst.closeDialog();
                controller.leave(closeRoom: true);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = PartyController.inst;
    return ObxO(
      rx: controller.infoTick,
      builder: (context, _) {
        final code = controller.code ?? '';
        final inviteLink = controller.inviteLink;
        final roomName = controller.state.roomName;
        return SettingsCard(
          icon: Broken.people,
          title: roomName.isEmpty ? lang.partyListeningParty : roomName,
          subtitle: null,
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _SyncStateChip(
                padding: EdgeInsetsDirectional.only(end: 6.0),
              ),
              ObxO(
                rx: controller.status,
                builder: (context, status) => _StatusChip(status: status),
              ),
            ],
          ),
          child: Column(
            children: [
              ObxO(
                rx: controller.status,
                builder: (context, status) => status == PartyConnectionStatus.connected && !controller.hostOnline
                    ? CustomListTile(
                        icon: Broken.warning_2,
                        passedColor: Colors.orange,
                        title: lang.partyHostOffline,
                      )
                    : const SizedBox(),
              ),
              _InviteSection(code: code, inviteLink: inviteLink),
              ObxO(
                rx: controller.isListening,
                builder: (context, isListening) => CustomSwitchListTile(
                  icon: Broken.headphone,
                  title: lang.partyListenOnThisDevice,
                  subtitle: lang.partyListenOnThisDeviceSubtitle,
                  value: isListening,
                  onChanged: (isTrue) => controller.setListening(!isTrue),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: NamidaButton(
                        icon: Broken.logout,
                        colorScheme: Colors.red,
                        borderRadius: 18.0,
                        text: lang.partyLeave,
                        onTap: _onLeaveTap,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _JoinRequestsCard extends StatelessWidget {
  const _JoinRequestsCard();

  @override
  Widget build(BuildContext context) {
    final controller = PartyController.inst;
    return ObxO(
      rx: controller.infoTick,
      builder: (context, _) => ObxO(
        rx: controller.requestsTick,
        builder: (context, _) {
          if (!controller.isHost) return const SizedBox();
          final requests = controller.joinRequests.toList();
          if (requests.isEmpty) return const SizedBox();
          return SettingsCard(
            icon: Broken.user_add,
            title: lang.partyJoinRequests,
            subtitle: null,
            child: Column(
              children: [
                for (final request in requests)
                  CustomListTile(
                    icon: Broken.user,
                    title: request.name,
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        NamidaIconButton(
                          icon: Broken.close_circle,
                          iconSize: 22.0,
                          tooltip: () => lang.reject,
                          onPressed: () => controller.answerJoinRequest(request.id, false),
                        ),
                        NamidaButton(
                          text: lang.accept,
                          onTap: () => controller.answerJoinRequest(request.id, true),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _MembersCard extends StatelessWidget {
  const _MembersCard();

  @override
  Widget build(BuildContext context) {
    final controller = PartyController.inst;
    return ObxO(
      rx: controller.infoTick,
      builder: (context, _) => ObxO(
        rx: controller.membersTick,
        builder: (context, _) {
          final members = controller.state.members.values;
          final me = controller.me;
          final isHost = controller.isHost;
          final maxMembers = controller.maxMembers;
          return SettingsCard(
            icon: Broken.profile_2user,
            title: lang.partyMembers,
            subtitle: maxMembers > 0 ? '${members.length}/$maxMembers' : '${members.length}',
            child: Column(
              children: [
                for (final member in members)
                  _MemberTile(
                    member: member,
                    me: me,
                    isHost: isHost,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _MemberTile extends StatelessWidget {
  final PartyMember member;
  final PartyMember? me;
  final bool isHost;

  const _MemberTile({
    required this.member,
    required this.me,
    required this.isHost,
  });

  void _confirmTransferHost() {
    NamidaNavigator.inst.navigateDialog(
      dialog: CustomBlurryDialog(
        isWarning: true,
        normalTitleStyle: true,
        bodyText: lang.partyTransferHostConfirm(name: member.name),
        actions: [
          const CancelButton(),
          NamidaButton(
            text: lang.confirm.toUpperCase(),
            onTap: () {
              NamidaNavigator.inst.closeDialog();
              PartyController.inst.transferHost(member.n);
            },
          ),
        ],
      ),
    );
  }

  List<NamidaPopupItem> _moderationItems() {
    final controller = PartyController.inst;
    return [
      NamidaPopupItem(
        icon: Broken.user_remove,
        title: lang.partyKick,
        onTap: () => controller.kick(member.n),
      ),
      NamidaPopupItem(
        icon: Broken.forbidden_2,
        title: lang.partyBan,
        onTap: () => controller.kick(member.n, ban: true),
      ),
    ];
  }

  List<NamidaPopupItem> _actionItems() {
    final me = this.me;
    if (me == null || me.n == member.n) return const [];
    if (isHost) {
      final controller = PartyController.inst;
      return [
        member.role == PartyRole.admin
            ? NamidaPopupItem(
                icon: Broken.shield_slash,
                title: lang.partyRemoveAdmin,
                onTap: () => controller.setRole(member.n, PartyRole.guest),
              )
            : NamidaPopupItem(
                icon: Broken.shield_tick,
                title: lang.partyMakeAdmin,
                onTap: () => controller.setRole(member.n, PartyRole.admin),
              ),
        NamidaPopupItem(
          icon: Broken.crown_1,
          title: lang.partyTransferHost,
          onTap: _confirmTransferHost,
        ),
        ..._moderationItems(),
      ];
    }
    if (me.role == PartyRole.admin && member.role == PartyRole.guest) return _moderationItems();
    return const [];
  }

  @override
  Widget build(BuildContext context) {
    final isMe = me?.n == member.n;
    final actionItems = _actionItems();
    final tile = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Tooltip(
                  message: member.listening ? lang.partyListenOnThisDevice : lang.partyRemoteControl,
                  child: NIcon(
                    member.listening ? Broken.headphone : Broken.mobile,
                    size: 20.0,
                    color: NColors.defaultIcon(),
                  ),
                ),
                const SizedBox(width: 12.0),
                Flexible(
                  child: NamidaText(
                    member.name,
                    style: NText.medium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (isMe) ...[
                  const SizedBox(width: 6.0),
                  NBuilder(
                    builder: (context, colors) => _Chip(
                      text: lang.partyYou,
                      color: colors.secondary,
                    ),
                  ),
                ],
                const SizedBox(width: 6.0),
                NBuilder(
                  builder: (context, colors) {
                    final (roleText, roleColor, roleIcon) = switch (member.role) {
                      PartyRole.host => (lang.host, Colors.orange, Broken.crown_1),
                      PartyRole.admin => (lang.partyRoleAdmin, colors.primary, Broken.shield_tick),
                      PartyRole.guest => (lang.partyRoleGuest, colors.onSurface.withOpacityExt(0.5), null),
                    };
                    return _Chip(
                      text: roleText,
                      color: roleColor,
                      icon: roleIcon,
                    );
                  },
                ),
              ],
            ),
          ),
          if (actionItems.isNotEmpty)
            NamidaPopupWrapper(
              childrenDefault: () => actionItems,
              child: NIcon(
                Broken.more,
                size: 18.0,
                color: NColors.defaultIcon(),
              ),
            ),
        ],
      ),
    );
    if (actionItems.isEmpty) return tile;
    return NamidaPopupWrapper(
      childrenDefault: () => actionItems,
      child: tile,
    );
  }
}

class _HostSettingsCard extends StatelessWidget {
  const _HostSettingsCard();

  void _promptSetPassword() {
    final textController = TextEditingController();
    NamidaNavigator.inst.navigateDialog(
      onDisposing: textController.dispose,
      dialog: CustomBlurryDialog(
        title: lang.partySetPassword,
        actions: [
          const CancelButton(),
          NamidaButton(
            text: lang.save,
            onTap: () {
              final password = textController.text;
              if (password.isEmpty) return;
              PartyController.inst.setRoomOpts(password: password);
              NamidaNavigator.inst.closeDialog();
            },
          ),
        ],
        child: CustomTagTextField(
          controller: textController,
          hintText: lang.partyRoomPassword,
          labelText: '',
          obscureText: true,
          maxLines: 1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = PartyController.inst;
    return ObxO(
      rx: controller.infoTick,
      builder: (context, _) {
        if (!controller.isHost) return const SizedBox();
        final perms = controller.state.perms;
        final opts = controller.opts;
        final bans = controller.bans;
        return SettingsCard(
          icon: Broken.setting_2,
          title: lang.partyHostSettings,
          subtitle: null,
          child: Column(
            children: [
              _SectionTitle(title: lang.partyGuestPermissions),
              CustomSwitchListTile(
                icon: Broken.play,
                title: lang.partyPermControl,
                value: perms.control,
                onChanged: (isTrue) => controller.setPermissions(perms.copyWith(control: !isTrue)),
              ),
              CustomSwitchListTile(
                icon: Broken.add_circle,
                title: lang.partyPermAdd,
                value: perms.add,
                onChanged: (isTrue) => controller.setPermissions(perms.copyWith(add: !isTrue)),
              ),
              CustomSwitchListTile(
                icon: Broken.edit_2,
                title: lang.partyPermEdit,
                value: perms.edit,
                onChanged: (isTrue) => controller.setPermissions(perms.copyWith(edit: !isTrue)),
              ),
              CustomSwitchListTile(
                icon: Broken.message,
                title: lang.partyPermChat,
                value: perms.chat,
                onChanged: (isTrue) => controller.setPermissions(perms.copyWith(chat: !isTrue)),
              ),
              if (opts != null) ...[
                const NamidaContainerDivider(
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                ),
                CustomSwitchListTile(
                  icon: Broken.shield_tick,
                  title: lang.partyRequireApproval,
                  value: opts.approval,
                  onChanged: (isTrue) => controller.setRoomOpts(approval: !isTrue),
                ),
                _PublicRoomTile(
                  value: opts.isPublic,
                  isLan: controller.isLanParty,
                  onChanged: (isTrue) => controller.setRoomOpts(isPublic: !isTrue),
                ),
                if (opts.isPublic)
                  ObxO(
                    rx: settings.party.sharePlaying,
                    builder: (context, sharePlaying) => CustomSwitchListTile(
                      icon: Broken.musicnote,
                      title: lang.partySharePlaying,
                      subtitle: lang.partySharePlayingSubtitle,
                      value: sharePlaying,
                      onChanged: (isTrue) => controller.setSharePlaying(!isTrue),
                    ),
                  ),
                CustomSwitchListTile(
                  icon: Broken.lock_1,
                  title: lang.partyLockRoom,
                  subtitle: lang.partyLockRoomSubtitle,
                  value: opts.locked,
                  onChanged: (isTrue) => controller.setRoomOpts(locked: !isTrue),
                ),
                CustomListTile(
                  icon: Broken.key,
                  title: lang.partySetPassword,
                  onTap: _promptSetPassword,
                  trailing: opts.hasPassword
                      ? NamidaIconButton(
                          icon: Broken.trash,
                          iconSize: 20.0,
                          tooltip: () => lang.partyRemovePassword,
                          onPressed: () => controller.setRoomOpts(clearPassword: true),
                        )
                      : null,
                ),
              ],
              if (bans.isNotEmpty) ...[
                const NamidaContainerDivider(
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                ),
                _SectionTitle(
                  title: lang.partyBannedMembers,
                  countText: '${bans.length}',
                ),
                for (final ban in bans)
                  CustomListTile(
                    icon: Broken.forbidden_2,
                    title: ban.name,
                    trailing: NamidaButton(
                      text: lang.partyUnban,
                      onTap: () => controller.unban(ban.id),
                    ),
                  ),
              ],
            ],
          ),
        );
      },
    );
  }
}

void _showQrCode(String inviteLink) {
  NamidaNavigator.inst.navigateDialog(
    dialog: CustomBlurryDialog(
      title: lang.partyScanToJoin,
      normalTitleStyle: true,
      actions: [
        NamidaButton(
          text: lang.done,
          onTap: NamidaNavigator.inst.closeDialog,
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0.multipliedRadius),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: _CrispQr(
                data: inviteLink,
                maxSize: 220.0,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class _InviteSection extends StatelessWidget {
  final String code;
  final String? inviteLink;

  const _InviteSection({required this.code, required this.inviteLink});

  @override
  Widget build(BuildContext context) {
    final link = inviteLink;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: .min,
                  children: [
                    NamidaInkWell(
                      onTap: () => NamidaUtils.copyToClipboard(content: code, title: lang.partyCode),
                      borderRadius: 10.0,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                      bgColor: const NColors(.card, opacity: 0.4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              NamidaText(
                                lang.partyCode,
                                style: NText.small,
                              ),
                              const SizedBox(width: 6.0),
                              Icon(
                                Broken.copy,
                                size: 14.0,
                                color: NText.small.of(context).color,
                              ),
                            ],
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              code,
                              style: NText.large.of(context).copyWith(fontSize: 26.0, letterSpacing: 4.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6.0),
                    Row(
                      children: [
                        Expanded(
                          child: NamidaInkWellButton(
                            centered: true,
                            sizeMultiplier: 0.95,
                            icon: Broken.link_1,
                            text: lang.partyInviteLink,
                            enabled: link != null,
                            onTap: () => NamidaUtils.copyToClipboard(content: link!, title: lang.partyInviteLink),
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Expanded(
                          child: NamidaInkWellButton(
                            centered: true,
                            sizeMultiplier: 0.95,
                            icon: Broken.share,
                            text: lang.share,
                            enabled: link != null,
                            onTap: () => NamidaUtils.shareText(PartyController.inst.inviteText ?? link!),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (link != null) ...[
                const SizedBox(width: 14.0),
                NamidaInkWell(
                  onTap: () => _showQrCode(link),
                  bgColor: NColors.fixed(Colors.white),
                  borderRadius: 10.0,
                  padding: const EdgeInsets.all(6.0),
                  child: RepaintBoundary(
                    child: _CrispQr(
                      data: link,
                      maxSize: 102.0,
                      backgroundColor: Colors.white.withOpacityExt(0.8),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _CrispQr extends StatefulWidget {
  final String data;
  final double maxSize;
  final Color backgroundColor;

  const _CrispQr({
    required this.data,
    required this.maxSize,
    this.backgroundColor = Colors.white,
  });

  @override
  State<_CrispQr> createState() => _CrispQrState();
}

class _CrispQrState extends State<_CrispQr> {
  late int _modules;
  late QrPainter _painter;

  @override
  void initState() {
    super.initState();
    _encode();
  }

  @override
  void didUpdateWidget(covariant _CrispQr oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) _encode();
  }

  void _encode() {
    final qr = QrCode.fromData(data: widget.data, errorCorrectLevel: QrErrorCorrectLevel.L);
    _modules = qr.moduleCount;
    _painter = QrPainter.withQr(qr: qr, gapless: true);
  }

  @override
  Widget build(BuildContext context) {
    final dpr = MediaQuery.devicePixelRatioOf(context);
    final modulePhysicalPx = (widget.maxSize * dpr / _modules).floorToDouble();
    return SizedBox.square(
      dimension: _modules * modulePhysicalPx / dpr,
      child: FittedBox(
        child: ColoredBox(
          color: widget.backgroundColor,
          child: CustomPaint(
            size: Size.square(_modules.toDouble()),
            painter: _painter,
          ),
        ),
      ),
    );
  }
}
