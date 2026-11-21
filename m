Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303613;
	b=z7uFgDPpiTIWH8PFpyzQt7rM4U7E9FLgZzISrvsx9X8KNYJpmscuzQstbAnsODmsqJBY
	 vtfbtAJ5peWuyx7wvXvKc8/no32uJLzXFRE1d5tLHmRP5d9+YNPtWQiMH6o3g+buva9Tr
	 Qyx+MwSCzQ2XpVqO3G4am/RxSugi37bQ0N3QxG+afxuHglISn2Z2Qcp2cjc5tr18auxq2
	 8kdFHSjECmDRCT8+/dvWRvTN+G6AFjnHbFQv+9zR0ib5t2OkrVmYLOWQCxyz0kiXu21/p
	 xE2uDcLiTIkvZyYbiMHPj1loKB1VRi1wAVLX1Ownm+q12YGFzptOs5kk4oQAfUMEd3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303613;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=OOpwGb6iiRpdbvFji5HfQ31pzcfgzMGcOtAI0T14btY=;
	b=dYDppuSojvCGOMMbGAjymQQuU5xJnsyQpQBnXBO4UegK/IwK5S8KJ1INDgUObXfxPmdo
	 P2krb7b5+sPpKarBTkLB0RyefJ+7vHxozixSVxk1d5JLzbX0lbYQ5dbNo0GZgqVw6V624
	 wDwBPvnOAxIQeoZLET2pdPTshwQkC4/N5MVvEXdiC1BfVxsOSOp9m3OY9vXcvOvDFIcQH
	 tERLqWkEfKm+9baAkRPVnWtGK9n32eW3+MkgfQAkygJc/z6LI8SDiz3h3cLYJ+dbJktO1
	 k1ZcPrgX+KuvImQcLbOWl5NaUnu8pxOe376dZ5u3bLkRasKwvER2naC0aXeovXMJ6LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aRyetPek;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D340606A32A;
	Sat, 21 Nov 2026 23:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aRyetPek
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0426B1F000EE;
	Sat, 21 Nov 2026 23:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795303612;
	bh=OOpwGb6iiRpdbvFji5HfQ31pzcfgzMGcOtAI0T14btY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aRyetPekwe4RbB8YSlDry+M3TnERMsNfNHzSgTEHZFZ8cjWkZYT3JrkUbQmbB1wzh
	 Jd2/64UeFsUvVok/W7mZP3n31quR4OV0eeEBbuKToz1XNX926hfI/+XWQff8ylbb88
	 ZbawQ3F00Xi6u4NvkC/19IsXQ1a0O8Qdc/iYuBzwSKMdDXGvs2ifdDxRxgruXuWwSB
	 MiyV3xHSoir7BgHfrPQ5757bnAaPRWwDBiVAH8X5a7LpogHOGqYj0LVVwJo6P27VnJ
	 MbHY1QrIdTMlPkZEGLvcfJfCA5OmCHadD7cvIJan60nyEAXPToTxgvlSKdNmL/F4FL
	 z+oMRsP790Qlw==
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
Subject: Re: [PATCH net-next v22 09/15] net: phylink: support late PCS provider attach
Date: Sat, 21 Nov 2026 15:26:50 -0800
Message-ID: <20261121232650.1365455-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117123956.11981-10-ansuelsmth@gmail.com>
References: <20261117123956.11981-10-ansuelsmth@gmail.com>
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
net: phylink: support late PCS provider attach

This adds a FWNODE_PCS_PROVIDER_ADD notifier event, emitted from
fwnode_pcs_add_provider(), so that a PCS provider registered after
phylink_create() can be attached to an existing phylink instance.
pcs_provider_notify() adds the matching PCSs through the new
phylink_add_pcs() and fwnode_pcs_get_from_provider() helpers, refreshes
supported interfaces and capabilities, and forces a major reconfig if the
previous one failed. The patch also adds pl->sfp_module_interfaces to keep
the SFP module's raw interface mask.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 094a15f3dbcd0..8768d8220a134 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -112,6 +112,7 @@ struct phylink {
>  
>  	struct sfp_bus *sfp_bus;
>  	bool sfp_may_have_phy;
> +	DECLARE_PHY_INTERFACE_MASK(sfp_module_interfaces);
>  	DECLARE_PHY_INTERFACE_MASK(sfp_interfaces);
>  	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
>  	u8 sfp_port;

[Severity: Low]
The commit message only describes the FWNODE_PCS_PROVIDER_ADD event and
the late attach. The patch also reworks the generic SFP handling.

The new pl->sfp_module_interfaces is set in phylink_sfp_module_insert()
and cleared in phylink_sfp_module_remove() and phylink_sfp_config_phy().
phylink_sfp_config_optical() now intersects with sfp_module_interfaces
instead of narrowing pl->sfp_interfaces in place.

The SFP branch of phylink_update_capabilities() is now selected by
sfp_module_interfaces. It rebuilds pl->sfp_interfaces on every call, and
zeroes pl->supported, pl->advertising and config->advertising when the
intersection is empty.

The patch also moves rcu_assign_pointer(pcs->phylink, pl) out of
phylink_create() into the new phylink_add_pcs(), and adds a check that
skips a PCS already on pcs_list.

These changes also alter how the FWNODE_PCS_PROVIDER_DEL path from
"net: phylink: support PCS provider release" recomputes SFP capabilities.
They appear to be what makes that path restore them correctly.

Could the commit message describe these changes as well?

> @@ -2140,6 +2141,35 @@ int phylink_set_fixed_link(struct phylink *pl,
>  }
>  EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
>  
> +static bool phylink_add_pcs(struct phylink *pl, struct phylink_pcs *pcs)
> +{
> +	struct phylink_pcs *tmp;
> +
> +	/*
> +	 * Make sure state mutex is locked to protect concurrent
> +	 * access to phylink instance PCS list from
> +	 * initial fill_available_pcs and late PCS attach
> +	 */
> +	lockdep_assert_held(&pl->state_mutex);
> +
> +	/* Make sure PCS is not already in the list */
> +	list_for_each_entry(tmp, &pl->pcs_list, list)
> +		if (tmp == pcs)
> +			return false;
> +
> +	if (WARN(rcu_access_pointer(pcs->phylink),
> +		 "%s: PCS already attached to a phylink instance\n",
> +		 __func__))
> +		return false;
> +
> +	list_add_tail(&pcs->list, &pl->pcs_list);
> +
> +	/* Link PCS to phylink */
> +	rcu_assign_pointer(pcs->phylink, pl);

[Severity: Low]
Is the pcs->phylink check plus list_add_tail() atomic across phylink
instances? The only lock held here is the per-instance pl->state_mutex.

With this patch, a new provider's PCS is offered to every registered
phylink instance:

instance A
fwnode_pcs_add_provider()
  blocking_notifier_call_chain()
    pcs_provider_notify()          /* holds A's state_mutex */
      phylink_add_pcs()

This can run at the same time as another instance is being created:

instance B
phylink_create()
  phylink_fill_available_pcs()     /* holds B's state_mutex */
    phylink_add_pcs()

B's fill_available_pcs callback can find the same provider through
fwnode_pcs_get(). The provider is already on fwnode_pcs_providers before
the notifier is called.

Suppose firmware describes two MACs whose pcs-handle entries resolve to
the same PCS, which is the case this WARN is meant to catch. Can both
threads pass the NULL check and link the single embedded pcs->list into
both pcs_list heads?

The comment above lockdep_assert_held() says state_mutex protects against
concurrent access from fill_available_pcs and late PCS attach. That only
seems to hold within one instance.

> +
> +	return true;
> +}

[ ... ]

> @@ -2358,11 +2383,24 @@ static void phylink_update_capabilities(struct phylink *pl,
>  		goto exit;
>  	}
>  
> -	/* Revalidate the SFP module modes against every available interface. */
> +	/* Revalidate SFP modes against interfaces currently supported by the
> +	 * MAC and PCS. Keep the module's interface list intact so a later PCS
> +	 * addition can make an interface usable again.
> +	 */

[Severity: Medium]
Does a later PCS addition actually make a rejected SFP module usable
again?

Suppose an optical module is inserted while the PCS provider is absent.
That can happen during phylink_create()->phylink_register_sfp(), or after
a FWNODE_PCS_PROVIDER_DEL. If the MAC driver leaves PCS-only interfaces
out of config->supported_interfaces, phylink_sfp_config_optical() fails:

	phy_interface_and(pl->sfp_interfaces, pl->supported_interfaces,
			  pl->sfp_module_interfaces);
	if (phy_interface_empty(pl->sfp_interfaces)) {
		phylink_err(pl, "unsupported SFP module: no common interface modes\n");
		return -EINVAL;
	}

sfp_sm_module() in drivers/net/phy/sfp.c then moves the module to
SFP_MOD_ERROR, which is a terminal state:

		err = sfp_module_insert(sfp->sfp_bus, &sfp->id,
					sfp->quirk);
		if (err < 0) {
			sfp_sm_mod_next(sfp, SFP_MOD_ERROR, 0);
			break;
		}

When the provider registers later, the FWNODE_PCS_PROVIDER_ADD branch of
pcs_provider_notify() only adds the PCS and refreshes
supported_interfaces. It then calls phylink_update_capabilities() with the
existing link_config.interface.

Nothing re-runs phylink_sfp_config_optical() or phylink_sfp_set_config(),
so req_link_an_mode and link_config.interface are never switched to the
module's interface. major_config_failed is not set either, because no
major config was attempted for the module.

Would the link stay down until the module is physically re-inserted?

[ ... ]

> @@ -2506,16 +2545,44 @@ static int pcs_provider_notify(struct notifier_block *self,
>  	if (pl->pcs_state == PCS_STATE_DETACHING)
>  		goto exit;
>  
> -	/*
> -	 * Loop all the PCS for phylink instance and check if
> -	 * this notification is relevant for some of them.
> -	 */
> -	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
> -		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
> -			continue;
> +	switch (val) {
> +	case FWNODE_PCS_PROVIDER_ADD:
> +		count = fwnode_phylink_pcs_count(pl->fwnode);
> +		for (i = 0; i < count; i++) {
> +			pcs = fwnode_pcs_get_from_provider(pp, pl->fwnode, i);
> +			if (IS_ERR_OR_NULL(pcs))
> +				continue;
> +
> +			/* Trigger a resolve only if a PCS is actually added */
> +			if (phylink_add_pcs(pl, pcs))
> +				resolve = true;
> +		}

[Severity: Low]
This fills pl->pcs_list differently from phylink_fill_available_pcs().

The phylink_config kernel-doc describes @fill_available_pcs as the MAC
driver's callback that fills the available PCS up to num_possible_pcs.
This path ignores config->fill_available_pcs and config->num_possible_pcs.
It parses pcs-handle on pl->fwnode directly instead.

A driver's callback might use a different fwnode, or filter or limit the
PCS set. Could such a driver end up with PCSs on pcs_list that its own
callback would never have returned?

Also, phylink_create() only rejects num_possible_pcs combined with
mac_select_pcs. It registers this notifier whenever
config->pcs_interfaces is non-empty.

For a mac_select_pcs driver that sets pcs_interfaces, this path would add
PCSs to pcs_list and OR their supported_interfaces into
pl->supported_interfaces. Meanwhile phylink_major_config() changes
pcs->phylink without touching pcs_list:

		if (pl->mac_ops->mac_select_pcs) {
			if (pl->pcs)
				rcu_assign_pointer(pl->pcs->phylink, NULL);

			if (pcs)
				rcu_assign_pointer(pcs->phylink, pl);
		}

Does that conflict with the list and back-pointer assumptions in
phylink_add_pcs()?

The only in-series user (airoha) parses the same fwnode, and no
mac_select_pcs driver currently sets pcs_interfaces. So this looks latent
for now.

> +
> +		/*
> +		 * Force an interface reconfig if major config failed.
> +		 * Configure link_failed to retrigger a resolve a
> +		 * second time to reevaluate AN mode with the new
> +		 * PCS if selected.
> +		 */
> +		if (resolve && pl->major_config_failed) {
> +			pl->force_major_config = true;
> +			pl->link_failed = true;
> +		}

[Severity: Low]
Should this be guarded by pl->phylink_disable_state, the way
phylink_del_pcs() is?

		if (!pl->phylink_disable_state)
			pl->force_major_config = true;

If the instance is stopped with major_config_failed left over from its
last run, phylink_run_resolve() won't queue any work. However,
force_major_config and link_failed stay set.

On the next phylink_start(), the call to
phylink_mac_initial_config()->phylink_major_config() clears
major_config_failed but not force_major_config. phylink_resolve() then
still sees the flag:

	if ((mac_config && link_state.interface != pl->link_config.interface) ||
	    pl->force_major_config) {

It runs a second mac_prepare/mac_config/pcs_config/mac_finish sequence,
followed by another resolve. Is that extra reconfiguration intended?

> +
> +		break;
> +	case FWNODE_PCS_PROVIDER_DEL:

[ ... ]

> +		break;
>  	}
>  
>  	/* Exit early if nothing has changed */

[Severity: Medium]
Suppose the ADD branch adds a PCS while the link is up and working
(major_config_failed is false). The code after this point still
recomputes the advertisement, but does not reconfigure the PCS:

	/* Recalculate capabilities */
	phylink_update_capabilities(pl, &pl->link_config);

For MLO_AN_INBAND without a PHY, phylink_parse_inband_capabilities() sets
Pause and Asym_Pause in pl->supported and copies that into
link_config.advertising. The SFP branch rebuilds it from pl->sfp_support.
The exit label only masks out pl->user_disabled_advertising.

A pause setting from ethtool -A is only recorded by
phylink_update_pause_state(), in config->pause and here:

	linkmode_set_pause(config->advertising, tx_pause,
			   rx_pause);

Can this silently re-enable a user-disabled pause advertisement in
link_config.advertising?

phylink_update_mac_pause_capabilities() re-applies the pause state with
phylink_update_pause_state() after phylink_update_capabilities().
pcs_provider_notify() does not.

No pcs_config() or phylink_change_inband_advert() call is made, so the
PCS hardware keeps advertising the old pause bits. Meanwhile ethtool and
phylink_mac_pcs_get_state() use the recomputed link_config.advertising.
The next pcs_config() would then program the re-enabled pause
advertisement.

[ ... ]

> @@ -4556,6 +4620,7 @@ static int phylink_sfp_module_insert(void *upstream,
>  	ASSERT_RTNL();
>  
>  	caps = sfp_get_module_caps(pl->sfp_bus);
> +	phy_interface_copy(pl->sfp_module_interfaces, caps->interfaces);
>  	phy_interface_copy(pl->sfp_interfaces, caps->interfaces);
>  	linkmode_copy(pl->sfp_support, caps->link_modes);
>  	pl->sfp_may_have_phy = caps->may_have_phy;

[Severity: Medium]
Can pl->sfp_module_interfaces stay set after the module has been rejected
or removed?

It is copied here before phylink_sfp_config_optical() runs. Nothing clears
it when that call fails with "no common interface modes", which is what
happens while the needed PCS is still missing.

sfp.c then moves the module to SFP_MOD_ERROR. On physical removal,
sfp_sm_mod_remove() skips the upstream module_remove callback for that
state:

static void sfp_sm_mod_remove(struct sfp *sfp)
{
	if (sfp->sm_mod_state > SFP_MOD_WAITDEV)
		sfp_module_remove(sfp->sfp_bus);

SFP_MOD_ERROR is below SFP_MOD_WAITDEV. So phylink_sfp_module_remove() is
never called, and sfp_module_interfaces is never zeroed.

phylink_update_capabilities() now selects its SFP branch with
!phy_interface_empty(pl->sfp_module_interfaces). As a result, these calls
rebuild pl->supported, pl->advertising and pl->link_config.advertising
from the stale module data:

  every later PCS ADD or DEL notification
  every call to phylink_update_mac_pause_capabilities()

If there is no interface overlap, all three are zeroed. Otherwise the
stale module's link modes are installed.

Before this patch, the same failure left pl->sfp_interfaces empty. That
meant phylink_update_capabilities() fell through to the generic "no
media" path instead.

[ ... ]

> diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
> index 83e0a2ad4b099..a6fe9f71174ab 100644
> --- a/include/linux/pcs/pcs.h
> +++ b/include/linux/pcs/pcs.h

[ ... ]

> @@ -50,6 +51,28 @@ int unregister_fwnode_pcs_notifier(struct notifier_block *nb);

[ ... ]

> + * Returns: a pointer to the phylink_pcs, NULL or a negative error pointer. Can
> + * return -EINVAL if the PCS provider firmware node doesn't match the referenced
> + * firmware node or a negative error pointer (or NULL) from the PCS provider
> + * xlate function for the relevant firmware node and PCS handle index.
> + */
> +struct phylink_pcs *fwnode_pcs_get_from_provider(struct fwnode_pcs_provider *provider,
> +						 const struct fwnode_handle *fwnode,
> +						 int index);

[Severity: Low]
The Returns: section doesn't seem to cover every case. The implementation
also returns errors from fwnode_parse_pcsspec() before the provider match
is checked:

	ret = fwnode_parse_pcsspec(fwnode, index, NULL, &pcsspec);
	if (ret)
		return ERR_PTR(ret);

Examples are -ENOENT for an out-of-range index and -EINVAL for a NULL
fwnode. The stub used when PCS support is disabled returns
ERR_PTR(-ENOENT). Could these be documented as well?

This isn't a bug, but there is a type mismatch. The new helper takes an
int index, while fwnode_pcs_get() and fwnode_phylink_pcs_count() use
unsigned int. pcs_provider_notify() also stores the unsigned count in an
int.
