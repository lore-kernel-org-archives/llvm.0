Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303611;
	b=I91HfKXL2WfI+HaTyoRIYjimNm/FnkANtr+RFp/A1kaqfjarKNkLXPB6sn+/AGzA3IKs
	 gQkRtBqvOA8veYoZyOt2JpEdw02G+KKXXDzfO/Ar46BDqbh7fsgTryzyCZtiMw9eTa0JG
	 +flU7gWkaRJWpIzZtUkuJIY3Gq9p7EBYthOSg6ggjjeP9eG2vFXzCC9rrdc5Tyj5M7OYH
	 moRszAlfkyldviyNmAnJ2IF51bQW1bXMisnc2n+ezhK38fi1AoYvhgJ6qVuq8tiPN3lAA
	 Fa1IZHdKR9Qpm7hGjWL50za+vogqRJBab/J66Hv4ARfJqTTgf9uDzpC++21f7GWT4QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303611;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wFFvFbbLMs38KGcTgUre1HFll8uBafUzffFq5U1w/eY=;
	b=fWeUjxwOomgB6j9STZOEWAAYdsJPFkehmNQ1pqdGYyxexltZ+dLOyQACJycWkzmBZkLP
	 GCdwAGViaxVHWj6hHvi1xky0mf1M1S8PRTXfIE7Nhpohf8ir/6pe77MXM1kKZrFWAdHKA
	 A46FveeLDHyYfF+r4d1kBl4qTV7pgc0AGAiTwekmWNHhMzLW4uymD39uNuCcKi7HTmJGf
	 vaB5X5EaM2nQb4CM95lmioEIChylwVXwIDTKNI0RzLhenhiXNubrkqH8GuNvHCenX2GV0
	 Kv/kBpWKLMszPilhAX50E/HMhfivC7OFQM9wVd0oW9/InfFL+Qa0GOERuo/pzlyA/9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dhDIwKyJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355BF606A33E;
	Sat, 21 Nov 2026 23:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dhDIwKyJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3511A1F000C6;
	Sat, 21 Nov 2026 23:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795303611;
	bh=wFFvFbbLMs38KGcTgUre1HFll8uBafUzffFq5U1w/eY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dhDIwKyJ9ApPr2UQORDdzdrke1gTAhL/V3SachheG8l/zkbhvJUuXxPmdYSQ3IpR1
	 d79ybBtxpUzBem1B7/51IiXf8SX4VgWZ4wjWaStNmerIRN9DHkuWqV2IyuABcN4Ba1
	 N0Lf+7g6yy6rjKoZ4Unv7RkqHAOpwaOH0LuatMVeyMslFBkIdCVFzmGJQ1pW7cptSu
	 0Vq18q+KGFG3fb+RYC2jIWNaEJjGWHDKQKGZVR3SLbpTZ52XPsbPRM10ne/ebJeEj8
	 aSMJClSWie6y7K5Czwoc1lPax48v/FogkYLkB3rAMnSsUVpS1O1NCNWOWccjEfIoyO
	 nCzLkUITCtC7Q==
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
Subject: Re: [PATCH net-next v22 08/15] net: phylink: support PCS provider release
Date: Sat, 21 Nov 2026 15:26:49 -0800
Message-ID: <20261121232649.1365412-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117123956.11981-9-ansuelsmth@gmail.com>
References: <20261117123956.11981-9-ansuelsmth@gmail.com>
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
net: phylink: support PCS provider release

This adds a blocking notifier chain to the fwnode PCS layer.
fwnode_pcs_del_provider() uses it to emit FWNODE_PCS_PROVIDER_DEL. Each
phylink instance with pcs_interfaces subscribes, drops the matching PCS from
pl->pcs_list on that event, recalculates its capabilities, and accesses
pcs_list under state_mutex.

> diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
> index b1d48f6eee7f1..f234a46354176 100644
> --- a/drivers/net/pcs/pcs.c
> +++ b/drivers/net/pcs/pcs.c

[ ... ]

> @@ -74,6 +87,11 @@ void fwnode_pcs_del_provider(struct fwnode_pcs_provider *pp)
>  
>  	mutex_unlock(&fwnode_pcs_mutex);
>  
> +	/* Signal phylink to release any PCS from this provider */
> +	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
> +				     FWNODE_PCS_PROVIDER_DEL,
> +				     pp);
> +

[Severity: Medium]
Can this notifier call into PCS hardware that the provider has already
powered down?

pcs_provider_notify()->phylink_del_pcs() calls phylink_pcs_disable(), which
calls pcs->ops->pcs_disable(). If the link is up it also calls
phylink_link_down(), and later in the series that calls
pcs->ops->pcs_link_down() too.

With devm_fwnode_pcs_add_provider(), devm_fwnode_pcs_del() runs during devres
release. That happens after the driver's .remove(), and in reverse order of
registration.

A provider might gate clocks, drop runtime PM or assert reset in .remove().
It might also get devm clocks or resets after it registers the provider.
Either way, these PCS register accesses would hit unpowered hardware.

For example, pcs-rzn1-miic calls pm_runtime_put() in .remove(). If it were
converted to a devm fwnode provider, the del would run after that.

The airoha PCS in this series registers its devm provider last and has no
.remove(), so it is not affected.

Neither pcs-provider.h nor pcs.rst says the hardware must stay accessible
until fwnode_pcs_del_provider() returns. Should that be documented, or
should the notifier avoid touching the departing PCS hardware?

>  	fwnode_handle_put(pp->fwnode);
>  	kfree(pp);
>  }

[ ... ]

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 921c227a5b3c0..094a15f3dbcd0 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -2425,6 +2451,133 @@ void phylink_update_mac_pause_capabilities(struct phylink *pl, unsigned long mac
>  }
>  EXPORT_SYMBOL_GPL(phylink_update_mac_pause_capabilities);
>  
> +static void phylink_del_pcs(struct phylink *pl, struct phylink_pcs *pcs)
> +{
> +	ASSERT_RTNL();
> +
> +	lockdep_assert_held(&pl->state_mutex);
> +
> +	rcu_assign_pointer(pcs->phylink, NULL);
> +	synchronize_rcu();
> +	list_del(&pcs->list);

[Severity: Low]
Is a full grace period needed for every PCS while RTNL is held?

pcs_provider_notify() calls phylink_del_pcs() in a loop. It holds
rtnl_lock(), pl->phydev_mutex, phydev->lock and pl->state_mutex the whole
time, inside the notifier rwsem read section.

So each phylink subscribed to the departing provider holds RTNL for one
normal grace period per removed PCS. The instances run one after another.

phylink_detach_pcss() in this same patch clears all the pointers first and
then calls synchronize_rcu() once. Could pcs_provider_notify() do the same,
or use synchronize_net()?

> +
> +	/*
> +	 * Check if we are removing the PCS currently

[ ... ]

> +	if (pl->pcs == pcs) {
> +		if (pl->old_link_state) {
> +			phylink_link_down(pl);
> +			pl->old_link_state = false;
> +		}
> +		if (pl->cfg_link_an_mode == MLO_AN_INBAND)
> +			timer_delete_sync(&pl->link_poll);
> +
> +		if (pl->pcs_state != PCS_STATE_DOWN)
> +			phylink_pcs_disable(pl->pcs);
> +
> +		if (!pl->phylink_disable_state)
> +			pl->force_major_config = true;
> +
> +		WRITE_ONCE(pl->pcs, NULL);
> +	}
> +}

[Severity: Medium]
Can the link stay down for good if the active PCS is removed while
PHYLINK_DISABLE_LINK is set?

On SFP loss of signal, phylink_sfp_link_down() sets PHYLINK_DISABLE_LINK
and pcs_state stays PCS_STATE_STARTED.

Suppose the active PCS's provider goes away during LOS.
phylink_pcs_disable() powers the PCS down and pl->pcs becomes NULL.
force_major_config is not set, because phylink_disable_state is non-zero.

When LOS clears:

phylink_sfp_link_up()
  phylink_enable_and_run_resolve(pl, PHYLINK_DISABLE_LINK)
    phylink_resolve()
        if ((mac_config && link_state.interface != pl->link_config.interface) ||
            pl->force_major_config) {

Neither condition holds, so phylink_major_config() is skipped and no PCS is
picked from pl->pcs_list again.

In in-band mode, phylink_mac_pcs_get_state() then sees pl->pcs == NULL and
reports link = 0.

That stays true even if another PCS in pcs_list supports the interface. It
also stays true after the provider is re-added, because the late attach
path only forces a major config when major_config_failed is set.

In MLO_AN_PHY mode, phylink_link_up() would call mac_link_up() and
netif_carrier_on() while the PCS is disabled.

The STOPPED, MAC_WOL and REPLAY bits each recover through
phylink_mac_initial_config() or force_major_config, but DISABLE_LINK does
not. Should force_major_config be set here whatever phylink_disable_state
is?

> +
> +static int pcs_provider_notify(struct notifier_block *self,
> +			       unsigned long val, void *data)
> +{
> +	struct phylink *pl = container_of(self, struct phylink, fwnode_pcs_nb);
> +	struct fwnode_pcs_provider *pp = data;
> +	struct phylink_pcs *pcs, *tmp;
> +	struct phy_device *phydev;
> +	bool resolve = false;
> +
> +	rtnl_lock();
> +	mutex_lock(&pl->phydev_mutex);
> +	phydev = pl->phydev;
> +	if (phydev)
> +		mutex_lock(&phydev->lock);
> +	mutex_lock(&pl->state_mutex);

[Severity: Medium]
Does this give fwnode_pcs_del_provider() a hidden "must not hold RTNL"
requirement?

fwnode_pcs_del_provider() used to take only fwnode_pcs_mutex. It now calls
blocking_notifier_call_chain(), which holds the chain rwsem for read. While
that is held, this callback takes rtnl_lock(), pl->phydev_mutex,
phydev->lock and pl->state_mutex.

A provider removed from a path that already holds RTNL, or any of those
locks, would deadlock here.

The rwsem-read -> rtnl ordering could also cause an ABBA deadlock with
register_fwnode_pcs_notifier() and unregister_fwnode_pcs_notifier(), which
take the same rwsem with down_write. That would happen if a MAC with
non-empty pcs_interfaces called phylink_create() or phylink_destroy() under
RTNL while another provider is being removed.

No current in-tree path does this. The airoha PCS deletes through devres at
unbind without RTNL, and airoha_eth creates and destroys phylink outside
RTNL.

But pcs-provider.h and pcs.rst do not mention this rule, and nothing
asserts it. Would a lockdep_assert_not_held() or a note in the API
documentation help?

> +
> +	/* phylink instance is being destroyed, ignore any event */
> +	if (pl->pcs_state == PCS_STATE_DETACHING)
> +		goto exit;
> +
> +	/*
> +	 * Loop all the PCS for phylink instance and check if
> +	 * this notification is relevant for some of them.
> +	 */
> +	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
> +		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
> +			continue;
> +
> +		phylink_del_pcs(pl, pcs);
> +		resolve = true;
> +	}

[Severity: Medium]
What happens when a PCS in pl->pcs_list did not come from the pcs-handle
property of pl->fwnode?

fwnode_pcs_matches_provider() works out ownership again at teardown. It
re-parses "pcs-handle" from the fwnode it is given and calls
provider->fwnode_xlate() again.

phylink does not record where each PCS came from when fill_available_pcs()
hands it over. The fill_available_pcs() contract in
include/linux/phylink.h does not require the PCS to come from the fwnode
passed to phylink_create().

The earlier patch "net: phylink: save phylink instance fwnode on
phylink_create" notes that pl->fwnode can differ from the fwnode of
config->dev. The pcs.rst example in "net: Document PCS subsystem" calls
fwnode_phylink_pcs_parse(dev_fwnode(config->dev), ...) from
fill_available_pcs.

For such a MAC, every check here returns false and phylink_del_pcs() is
never called. The PCS stays on pl->pcs_list, pcs->phylink stays set, and
the PCS may still be pl->pcs.

fwnode_pcs_del_provider() then returns, and the provider frees its
phylink_pcs (for example, a devm-allocated priv). After that,
phylink_resolve(), phylink_major_config() and phylink_mac_pcs_get_state()
would call pcs->ops through freed memory, and phylink_detach_pcss() would
write to it.

airoha_eth passes the same node to both, so it is not affected today. Would
it be more robust to record the provider, or the source fwnode, for each
PCS when it is added?

[ ... ]

> @@ -2515,10 +2668,18 @@ struct phylink *phylink_create(struct phylink_config *config,
>  	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
>  	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
>  
> +	/* First register notifier for hotplug PCS events */
> +	if (!phy_interface_empty(config->pcs_interfaces)) {
> +		pl->fwnode_pcs_nb.notifier_call = pcs_provider_notify;
> +		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
> +	}

[Severity: Medium]
Can pcs_provider_notify() run against a partly initialized phylink here?

The notifier goes live, and pl->pcs_list is filled, before
phylink_parse_mode(), phylink_parse_fixedlink() and phylink_register_sfp()
run.

If a provider for one of the filled PCS is unbound at the same moment (for
example via sysfs), pcs_provider_notify() takes state_mutex and runs
phylink_update_capabilities(). That reads and writes pl->cfg_link_an_mode,
pl->sfp_bus, pl->link_config, pl->supported and pl->advertising.

Meanwhile phylink_create() writes the same fields without state_mutex.
phylink_parse_mode() sets pl->cfg_link_an_mode. phylink_parse_fixedlink()
sets link_config.speed and duplex, and does this before it takes
state_mutex:

	__set_bit(ETHTOOL_LINK_MODE_Pause_BIT,
		  pl->link_config.lp_advertising);

pl->req_link_an_mode and pl->sfp_bus are also written without the lock.

On a fixed-link port, once cfg_link_an_mode == MLO_AN_FIXED, the notifier
goes through phylink_parse_fixedlink_capabilities(). That function does a
read-modify-write linkmode_or() on config->lp_advertising, which could
overwrite the Pause bit phylink_parse_fixedlink() just set.

The later locked recalculation only ORs in match, so the link partner pause
ability from DT would be lost for good.

This also seems to conflict with the commit message:

  Protect every access of phylink pcs_list with state_mutex to handle async
  PCS provider release and capabilities recalculation.

Could the registration move to the end of phylink_create(), or could the
notifier ignore events until initialization is complete?

>  
>  	/* Fill the PCS list with available PCS from phylink config */
>  	ret = phylink_fill_available_pcs(pl, config);

[ ... ]
