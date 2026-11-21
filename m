Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303609;
	b=Y4WtifwdMqS+Vpqq4k3KlFQ7neyCYipB0kSuAJPXsJqAOdFi0hW9xeOIKF/5pqjg/iBB
	 2BrJJOh/HLIna9x+z5aFJ0EUx8PcqUhcuYI5eqazZiqoUar66sVa6zR+uPeXHVoOD9YcW
	 6zUYWEwGKQQBWu60S2/Uv7DfPmHKboMXLpTckL7O5lfbMwhOhj6LXdJ41bsXRcxWxInGv
	 n6CSoLqM01KoXO4cEfChzo/CAcTsbk+6aGevwV2qOp5PHgkQ4vyaN2GIaGZ45/F1ifDIc
	 x9yqyTc64pKTCD08mBcQj6vid5PrnfLT4mCr6ySNqcNteLSyI+jlSer0XbFAEUPwysg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303609;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=uioZ55CJ2GHe6TiiERn3Q6GU4DCpV+IM+fvb4tz39pA=;
	b=DEG9HiqPcadjGB/uET04OJmVniQsUANq+scxNIIf6W5GmJoycp2FPj0FCgUAynWsDk6f
	 eX295xvW8WEIWZwBM2p+pnotr/U8yyCgMH6tLg/050g5io3l/E4guH+/7dhwBQTVyBiUA
	 yWlfrEmf8bU6+brGNnPpsEZIaNznMK2IZHOmv+/OQvwxfl7ctPcnP44DJVzT5YMuwi5m6
	 01ISu4use7rPDSSoaLNgsLkERD/8yq6JToHKGesdHtOFgllcIC3wIx9j8UnY0ct42Lg5O
	 t5Q3MX1AXHzRPC9ncwbHCSkIgm3JywEYK4NaxcAigHB7RpXH42eEuYk+CrTwyFQvPxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XbHPKRY5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BAF606A339;
	Sat, 21 Nov 2026 23:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XbHPKRY5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607751F000D4;
	Sat, 21 Nov 2026 23:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795303609;
	bh=uioZ55CJ2GHe6TiiERn3Q6GU4DCpV+IM+fvb4tz39pA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XbHPKRY5WsIx3t8S+1s5NS/T06LZA9GvIXh7SJ368t62lMYFNvFa62BSVEde1md6l
	 Q6fPcCERMSviZFU/Twdh6qNKVrLse62C1H1rz5cX1k4HmIwzBKngMEqAaRHs4yG9dx
	 1PtCeWKbqYjyd9r6eYWiLLg0A6dEEUHkEN4GRPA+QfhECz6xd71HkU1xbbLjBSZyTy
	 0Y6XgsaOCJ8X/1JcxcGdj+viclM55VeMeUTFIp3YETHP0TVdpOHS6qJm60ezby369W
	 MStHZ4lP9Oj2VW4E/x5u9hYKVeK67Cz4F8tNQkNu+xr6XYYy27Kr2ZgcZLvpMWpTJW
	 ihqY8Dgza/srw==
From: Jakub Kicinski <kuba@kernel.org>
To: ansuelsmth@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	lorenzo@kernel.org,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	maxime.chevallier@bootlin.com,
	p.zabel@pengutronix.de,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	rmk+kernel@armlinux.org.uk,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev,
	zhengping.zhang@airoha.com
Subject: Re: [PATCH net-next v22 07/15] net: phylink: add capabilities helpers and track modified advertising
Date: Sat, 21 Nov 2026 15:26:47 -0800
Message-ID: <20261121232647.1365377-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117123956.11981-8-ansuelsmth@gmail.com>
References: <20261117123956.11981-8-ansuelsmth@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: phylink: add capabilities helpers and track modified advertising

This prepares for PCS release and late attach. It adds
phylink_update_capabilities() to recompute the supported and advertised
link modes, and it tracks the full advertisement and a user-disabled mask
in struct phylink. It also saves the PHY advertisement before restricting
it, and stops the SFP path from modifying pl->sfp_support in place.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 88280866c19a2..921c227a5b3c0 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -2120,6 +2233,142 @@ static void phylink_update_pause_state(struct phylink *pl, int pause_state)

[ ... ]

> +static void phylink_update_capabilities(struct phylink *pl,
> +					struct phylink_link_state *config)
> +{
> +	if (pl->phydev) {
> +		lockdep_assert_held(&pl->phydev_mutex);
> +		lockdep_assert_held(&pl->phydev->lock);
> +	}
> +	lockdep_assert_held(&pl->state_mutex);
> +
> +	if (pl->phydev) {
> +		phylink_phy_update_capabilities(pl, pl->phydev,
> +						pl->phy_state.interface);
> +		return;
> +	}
> +
> +	if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
> +		phylink_parse_fixedlink_capabilities(pl, config);
> +		goto exit;
> +	}
> +
> +	if (pl->cfg_link_an_mode == MLO_AN_INBAND) {
> +		phylink_parse_inband_capabilities(pl, config);
> +		goto exit;
> +	}

[Severity: Medium]
Can the SFP branch below ever run for an SFP cage described with
managed = "in-band-status"?

phylink_sfp_set_config() only updates req_link_an_mode and
link_config.interface. cfg_link_an_mode therefore stays MLO_AN_INBAND
while an optical module is in use.

This check then sends the recompute to
phylink_parse_inband_capabilities(). That function zeroes pl->supported
and rebuilds it from the generic interface caps, not from pl->sfp_support.

For 10GBASE-R this gives every 10G link mode plus Autoneg instead of the
modes read from the module's EEPROM. It also brings back the Autoneg bit
that phylink_sfp_config_optical() removes when the only interface is
INBAND_NONE.

Some module interfaces are not in the in-band switch, for example
PHY_INTERFACE_MODE_100BASEX. For those, phylink_parse_inband_capabilities()
returns after pl->supported has already been cut down to MII, Autoneg,
Pause and Asym_Pause:

	default:
		phylink_err(pl,
			    "incorrect link mode %s for in-band status\n",
			    phy_modes(config->interface));
		return -EINVAL;

The return value is ignored here, so pl->supported is left with no speed
modes. The old code restricted the result with
linkmode_and(pl->supported, pl->supported, pl->sfp_support) whatever the
AN mode was.

At this commit, phylink_update_mac_pause_capabilities() reaches this path.
Later in the series pcs_provider_notify() does too, and the branch order
there is unchanged.

> +
> +	/* Revalidate the SFP module modes against every available interface. */
> +	if (pl->sfp_bus && !pl->phydev && config->interface &&
> +	    !phy_interface_empty(pl->sfp_interfaces)) {
> +		__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
> +
> +		linkmode_copy(supported, pl->sfp_support);
> +		linkmode_copy(config->advertising, pl->sfp_support);
> +		if (!__phylink_validate_mask(pl, NULL, supported, config,
> +					     pl->sfp_interfaces)) {
> +			phylink_sfp_update_capabilities(pl, supported, config,
> +							config->interface);
> +			linkmode_copy(pl->supported, supported);
> +			linkmode_copy(pl->advertising, config->advertising);
> +		}

[Severity: Medium]
Should this also narrow the result to the active link_config.interface?

__phylink_validate_mask() returns the union across all of
pl->sfp_interfaces. phylink_sfp_update_capabilities() only adjusts the
Autoneg bit.

Other paths do narrow. phylink_sfp_config_optical() validates against the
chosen interface before phylink_sfp_set_config() stores the
advertisement. The old phylink_update_mac_pause_capabilities() did the
same through __phylink_validate(pl, pl->supported, config).

After a recompute, pl->advertising and link_config.advertising can contain
both 1000baseX_Full and 10000baseSR_Full while the link runs 10GBASE-R.
phylink_ethtool_ksettings_get() then reports modes that the current
interface can't run. phylink_ethtool_ksettings_set() also computes
user_disabled_advertising against that wider mask.

> +
> +		goto exit;
> +	}

[ ... ]

> @@ -2146,20 +2396,16 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
>  	if (old_pause == mac_pause)
>  		return;
>  
> +	mutex_lock(&pl->phydev_mutex);
> +	phydev = pl->phydev;
> +	if (phydev)
> +		mutex_lock(&phydev->lock);
>  	mutex_lock(&pl->state_mutex);
>  
>  	pl->config->mac_capabilities &= ~(MAC_SYM_PAUSE | MAC_ASYM_PAUSE);
>  	pl->config->mac_capabilities |= mac_pause;
>  
> -	phylink_set(pl->supported, Pause);
> -	phylink_set(pl->supported, Asym_Pause);
> -
> -	if (pl->phydev)
> -		linkmode_and(pl->supported, pl->supported, pl->phydev->supported);
> -	else if (pl->sfp_bus)
> -		linkmode_and(pl->supported, pl->supported, pl->sfp_support);
> -
> -	__phylink_validate(pl, pl->supported, config);
> +	phylink_update_capabilities(pl, config);

[Severity: Medium]
Does the PHY still renegotiate when the MAC loses pause support?

With a PHY attached, this call goes through
phylink_phy_update_capabilities(). That function validates
pl->phy_advertising against MAC caps that no longer include pause, then
writes the result straight into the PHY:

	/* Restrict the phy advertisement according to the MAC support. */
	linkmode_copy(phy->advertising, config.advertising);

It does not call phy_config_aneg() or phy_start_aneg(). By the time
phylink_update_pause_state() calls phy_set_asym_pause(), the pause bits
are already clear:

drivers/net/phy/phy_device.c:phy_set_asym_pause() {
	linkmode_copy(oldadv, phydev->advertising);
	linkmode_set_pause(phydev->advertising, tx, rx);

	if (!linkmode_equal(oldadv, phydev->advertising) &&
	    phydev->autoneg)
		phy_start_aneg(phydev);
}

linkmode_equal() is therefore true, and aneg is not restarted. With AN
enabled, manual_changed is false, so no resolve is triggered either.

Before this patch, phydev->advertising still had the pause bits at this
point. phy_set_asym_pause() saw the difference and restarted aneg. The
kernel-doc still says the function "triggers renegotiation if needed".

The in-tree caller rtl8169_change_mtu() passes caps = 0 when switching to
a jumbo MTU. Won't the PHY keep advertising PAUSE_CAP/PAUSE_ASYM, and
flow control stay active in jumbo mode, until something else
renegotiates?

Writing phydev->advertising directly also skips phylib's own bookkeeping,
such as the adv_old mask used by phy_speed_up().

[ ... ]

> @@ -2507,18 +2683,17 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
>  	 */
>  	phy_support_asym_pause(phy);
>  
> -	memset(&config, 0, sizeof(config));
> -	linkmode_copy(supported, phy->supported);
> -	linkmode_copy(config.advertising, phy->advertising);
> -	config.interface = interface;
> +	mutex_lock(&pl->phydev_mutex);
> +	mutex_lock(&phy->lock);
> +	mutex_lock(&pl->state_mutex);
> +
> +	linkmode_copy(pl->phy_advertising, phy->advertising);
>  
> -	ret = phylink_validate_phy(pl, phy, supported, &config);
> +	ret = phylink_phy_update_capabilities(pl, phy, interface);

[Severity: Low]
The PHY-derived state is now written in this locked section:
pl->phy_advertising, pl->supported, pl->advertising,
link_config.advertising and phy->advertising. pl->phydev is published
only later, after all locks have been dropped and phy_eee_rx_clock_stop()
has run:

	mutex_lock(&pl->phydev_mutex);
	mutex_lock(&phy->lock);
	mutex_lock(&pl->state_mutex);
	pl->phydev = phy;

A phylink_update_capabilities() call that runs in that window sees
pl->phydev == NULL. In PHY mode without an SFP it takes the generic
branch:

	/* No media is attached yet. Recalculate the generic capabilities. */
	linkmode_fill(pl->supported);

Doesn't that throw away the PHY and MAC intersection that was just
computed? phylink_update_pause_state() also skips updating
pl->phy_advertising while pl->phydev is NULL.

The old mac-pause path only set the pause bits and revalidated the
existing pl->supported, so the PHY-derived mask mostly survived.

The in-tree drivers that trigger a recompute (r8169 and airoha) connect
the PHY under rtnl, so this doesn't look reachable in-tree today. It could
still happen for a driver that calls phylink_connect_phy() without rtnl
while the fwnode PCS notifier is registered.

>  	if (ret) {

[ ... ]

> @@ -3411,6 +3579,7 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
>  
>  	if (pl->phydev) {
>  		struct ethtool_link_ksettings phy_kset = *kset;
> +		int ret;
>  
>  		linkmode_and(phy_kset.link_modes.advertising,
>  			     phy_kset.link_modes.advertising,

[ ... ]

> @@ -3434,7 +3603,15 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
>  		 *   the presence of a PHY, this should not be changed as that
>  		 *   should be determined from the media side advertisement.
>  		 */
> -		return phy_ethtool_ksettings_set(pl->phydev, &phy_kset);
> +		ret = phy_ethtool_ksettings_set(pl->phydev, &phy_kset);
> +		if (!ret) {
> +			mutex_lock(&pl->state_mutex);
> +			linkmode_copy(pl->phy_advertising,
> +				      phy_kset.link_modes.advertising);
> +			mutex_unlock(&pl->state_mutex);
> +		}

[Severity: Medium]
Does this keep the meaning documented for the new field?

	/* PHY advertisement before restricting it to MAC/PCS capabilities */
	__ETHTOOL_DECLARE_LINK_MODE_MASK(phy_advertising);

phy_kset.link_modes.advertising has already been ANDed with pl->supported
above, and pl->supported is limited to MAC/PCS. It is also the raw
request, not what phylib applied. phy_ethtool_ksettings_set() ANDs it
with phydev->supported and sets the Autoneg bit from base.autoneg.

Later, phylink_phy_update_capabilities() replays this copy and writes the
result into phy->advertising:

	linkmode_copy(config.advertising, pl->phy_advertising);

Can that restore an Autoneg bit while phydev->autoneg is
AUTONEG_DISABLE?

Modes outside pl->supported at the time of the ethtool call are also lost
for good. After a PCS is re-attached they won't be advertised again. The
non-PHY path avoids this because it tracks user-disabled modes.

The copy also goes stale when phylib changes phydev->advertising itself,
for example in phy_speed_down(). The next recompute then silently
overwrites that change.

> +
> +		return ret;
>  	}

[ ... ]

> @@ -4022,19 +4201,34 @@ static void phylink_sfp_detach(void *upstream, struct sfp_bus *bus)

[ ... ]

> +	for (i = 0; i < ARRAY_SIZE(phylink_sfp_interface_preference); i++) {
> +		interface = phylink_sfp_interface_preference[i];
> +		if (!test_bit(interface, intf))
> +			continue;
>  
> -	return interface;
> +		tmp_state = *state;
> +		tmp_state.interface = interface;
> +		linkmode_copy(tmp_supported, supported);
> +		if (phylink_validate(pl, tmp_supported, &tmp_state))
> +			continue;
> +
> +		/* Skip this preferred interface if user-disabled in advertising */
> +		linkmode_andnot(tmp_state.advertising, tmp_state.advertising,
> +				pl->user_disabled_advertising);
> +		if (!phylink_is_empty_linkmode(tmp_state.advertising))
> +			return interface;
> +	}
> +
> +	return PHY_INTERFACE_MODE_NA;

[Severity: Medium]
Is pl->user_disabled_advertising ever cleared?

Its only writer is phylink_update_user_disabled_advertising(), which keeps
restrictions for modes that are absent from the current pl->advertising.
phylink_sfp_module_remove() only zeroes sfp_interfaces and
sfp_module_interfaces. An ethtool restriction made for one SFP module
therefore applies to every module inserted later.

For example, take a dual-rate 1G/10G module running 10GBASE-R. Running
"ethtool -s ... advertise 1000baseX/Full" records 10000baseSR_Full and the
pause bits as user-disabled.

Then a 10G-only module is inserted. This loop validates 10GBASE-R, masks
out the stale disabled modes, and is left with only Autoneg.
phylink_is_empty_linkmode() returns true and PHY_INTERFACE_MODE_NA is
returned. phylink_sfp_config_optical() then fails with "failed to select
SFP interface".

Before this patch, the interface was chosen by preference alone and the
module worked.

There is also a mismatch in phylink_sfp_set_config().
phylink_validate_pcs_inband_autoneg() checks the unmasked
config.advertising, but the masked one is what gets programmed, and it
may have Autoneg removed:

	linkmode_copy(pl->advertising, state->advertising);
	if (!pl->phydev)
		linkmode_andnot(state->advertising, pl->advertising,
				pl->user_disabled_advertising);

The commit message only mentions keeping user rules across PCS removal and
re-attach. Are these restrictions meant to persist across SFP module swaps
and change how the interface is selected?

[ ... ]
