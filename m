Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795303607;
	b=MF8xrYXaHroHzA+TIv6pDT3aM3gv+syCVvHtQr8JnLoaUJ3iyFUVDM8Jsd7KVIbRKYKs
	 OGbqW8j5MyoMaGsaQSV+lbmRzWd4yl5DsRrD2DEw/oPTgv8RJtysr6DhPnOF23uAY6aMV
	 lRGur7WXnwTMZ60wNXvO0TeefRECNtUDNFYOqpeafso3wjMWe6Hxb0LJw+pee7X0FXlGz
	 8u4HFrrbYLilB+HyqiaEtCLnL+pJVjsdtH45Agr0JwpHVl4/eyTINSLApWByf4TgeqmR5
	 UJdZu7Q/28Jz02SxgqZX8wjSt4N3ow/5QwKdkY/zU5h/taojmWcTMzXC8wAkMs8vd6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795303607;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=fM/qA6/4U7l7719+XpQdyjrMAl2GxPV3Jko7fpcHllc=;
	b=oK5BnQptaXWlh4nG8E4wldbJopC20bHN56ufrjJiuTNlY5AQYdNszDHWV3m9tB+i3mAx
	 SG/eqtF1vQqPGfB+si7NHH511Ia58SqWIFxbQ1nNLEIe8ByACj3gkxPZrZk8kB+JkwlmQ
	 Dhvq775a+gkw4BnSmbBO25yLqDN8Jxd6WYWPuGOqTmgBP1RGla+LcPFUrsoQ/w8Vb0Rfn
	 EsGrDCIvVPKdKWWLP4IHSflYbW4qyWMYiwE1F8jMmKCCazkTsj/Stq057273n9OvjydUq
	 ZYoiaoOVCnGhALkAadv1Ni7ajcvQE+BY3q8gvHYseLr4lXb/A2bblCOZhKellwNjQow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Igh8pVAZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7615606A330;
	Sat, 21 Nov 2026 23:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Igh8pVAZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BC71F000CF;
	Sat, 21 Nov 2026 23:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795303607;
	bh=fM/qA6/4U7l7719+XpQdyjrMAl2GxPV3Jko7fpcHllc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Igh8pVAZZm5rdiOR9KwRNVyTpTIf0iPk/SmyuhzdzS4PWrLqcA4mf3lAshs0dGXv4
	 qIEG3zxFmac4IuESiWfOEn+zL0CljFNxEzdokWeoAbHw+8cBg/L1UmXkcVytlSNlZx
	 BM4/D5qEE2lQ8JFXHAn3RiCgB/jCjiH8Eks08ia3CVIJ5AmjiZdul+z14sew2TSeRI
	 u5jwPAPgIu8hOfBv2MfNHUqj4NGh/Rpu8kCiJqPW/wLXxTr1cigP+jVZ0Pk6KWR7Jv
	 RcN/y6ydFTxOWS4aLEJ5lZVhZ6TGB6JiggF7croio+2iH6td/ULJduKBQ/DC+aDrWE
	 ytQdfaAjIOCPA==
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
Subject: Re: [PATCH net-next v22 03/15] net: phylink: introduce internal phylink PCS handling
Date: Sat, 21 Nov 2026 15:26:43 -0800
Message-ID: <20261121232643.1365333-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117123956.11981-4-ansuelsmth@gmail.com>
References: <20261117123956.11981-4-ansuelsmth@gmail.com>
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
net: phylink: introduce internal phylink PCS handling

This adds an alternative to .mac_select_pcs. The MAC hands phylink a list
of PCS through .fill_available_pcs and .num_possible_pcs, and phylink
picks a PCS by matching the interface against each PCS's
supported_interfaces. A new pcs_interfaces mask in phylink_config marks
the modes that need a dedicated PCS, and phylink_create() widens
pl->supported_interfaces with the supported_interfaces of every listed
PCS.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index f482dc6088102..e8ba906cfba68 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c

[ ... ]

> @@ -2096,16 +2220,31 @@ struct phylink *phylink_create(struct phylink_config *config,
>  	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
>  	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
>  
> +	/* Fill the PCS list with available PCS from phylink config */
> +	ret = phylink_fill_available_pcs(pl, config);
> +	if (ret < 0)
> +		goto free_pl;
> +
> +	/* Link available PCS to phylink */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		rcu_assign_pointer(pcs->phylink, pl);
> +
>  	phy_interface_copy(pl->supported_interfaces,
>  			   pl->config->supported_interfaces);
>  
> +	/* Update supported interfaces */
> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> +		phy_interface_or(pl->supported_interfaces,
> +				 pl->supported_interfaces,
> +				 pcs->supported_interfaces);
> +

[Severity: Medium]

Can this OR put modes into pl->supported_interfaces that phylink will
never select a PCS for?

The PCS modes are not masked with config->pcs_interfaces. However, the
PCS lookup this patch adds only runs when the interface is in
pcs_interfaces. The check in phylink_validate_mac_and_pcs(),
phylink_inband_caps() and phylink_major_config() is:

	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {

Suppose a listed PCS advertises a mode that is not in pcs_interfaces.
__phylink_validate() accepts that mode after checking only the MAC
capabilities.

SFP interface selection uses the same widened mask. It also ends up in
the SFP PHY's host_interfaces through phylink_sfp_connect_phy():

	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
			  pl->supported_interfaces);

If that mode is then picked, phylink_major_config() skips the PCS list
branch and pcs stays NULL:

	pcs_changed = pl->pcs != pcs;
	...
	if (pcs_changed) {
		phylink_pcs_disable(pl->pcs);
		...
		WRITE_ONCE(pl->pcs, pcs);
	}

So the active PCS is disabled and pl->pcs becomes NULL. mac_config() is
then called for a mode the MAC never listed in
config->supported_interfaces. No PCS is programmed for that mode.

The "couldn't find a PCS for %s" error is not printed either, because it
is only reached inside the pcs_interfaces branch.

The Documentation/networking/pcs.rst added later in the series describes
supported_interfaces as holding every MAC mode. It describes
pcs_interfaces as the subset that needs a PCS ("PCS required only for
USXGMII").

Under that model the OR either adds nothing new, or it adds modes outside
pcs_interfaces that never get a PCS. One example is a USXGMII PCS that
also supports 10GBASER, 2500BASEX and 1000BASEX, such as the Airoha PCS
added later in the series.

The airoha user in the series does not hit this, because it copies
supported_interfaces into pcs_interfaces. The final state of the series
still has the unmasked OR in both phylink_create() and
pcs_provider_notify().

Should the OR be limited to config->pcs_interfaces? Alternatively, should
phylink_create() reject a PCS mode that is not in pcs_interfaces?

phylink_create() also does not check that the new fields are consistent:

- It accepts num_possible_pcs with an empty pcs_interfaces. In that case
  the listed PCS are never selected.
- It accepts pcs_interfaces together with .mac_select_pcs. In that case
  pcs_interfaces is silently ignored.

Would it make sense to reject these combinations here?

Separately, the kernel-doc for @supported_interfaces ("supported by the
MAC/PCS") and @pcs_interfaces ("dedicated PCS is required") in
include/linux/phylink.h does not match how phylink combines the two
masks.
