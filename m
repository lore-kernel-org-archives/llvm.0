Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBBB3C454E
	for <llvm@lists.linux.dev>; Mon, 29 Jun 2026 07:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717492; cv=none; b=uq3Igqe1ym1qf4y6hUzcNpqnk+RyDmAGK4cIJ7Br8mebsYTecEsdbjM7G3A8uKDO1aeOZQDvq0M+eISMAT+rn6qUlWV4dhir+uA4MOPm09Yzy2j6qX97cubvk4+IJw3jGfEtJl3i2ypRV0FFCS5YAEF+PoKFrF4X50kcriNXq8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717492; c=relaxed/simple;
	bh=blN7kUYjZ29Lu9JrwtLJvpjU1Wy8lfqujnHxweqK+8c=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyagHCB/h5ZeF/AFb3agkak2z/MeNNUW/WBHFLUo0JHZJv8XPxUi28SAHAP32XQj7zi/S15a8s2QD1cawOGdVSJEUYmJr5N0jKlcnZm24RjwJlggYWb4vvIzA16fl8tf88oSCJSiD81NOFXnspjDC23kVOBXF3zuC1UMmlZHUcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GACdf3co; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GACdf3co"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47488efcf30so106397f8f.3
        for <llvm@lists.linux.dev>; Mon, 29 Jun 2026 00:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782717487; x=1783322287; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BovyFstc80MYHmYyIZVG50kULX+1YfHlAuIHPTiI6jk=;
        b=GACdf3cosFQt8V77pkBabwpbAxD5Df6DTb5hGE0M2NZFt1/dgGdn5ud6z1T9T1Ju55
         lz1OEyAeeTNqnaqrMnk80hu1+tlEJq1cvBUAOdicjMQUO2bl+RLU5VKHY784CHpIB8kJ
         OPc9bHqoBt1nNlL+hlMc7/VmFZFWZsa++Jxgj9zBTE2FwEGIEtWHTDsY05APs87ASHsu
         lWlU5tgWmW2wJwzB1rFmNKYznYR+B6mF6Ur2r1zcvOJBrq38R1Xni11OPSHulgWiJ5LN
         xshxxztenufrnTD/mises/ztPpYSKY64GDMCdhUFrFiaJyY92Lb6m7euNTYDSCFaZh2c
         7rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782717487; x=1783322287;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BovyFstc80MYHmYyIZVG50kULX+1YfHlAuIHPTiI6jk=;
        b=WtgQ1eFkvfzlRbZLcOCtW/3nBddre28VcsCpBCDDQT1t+mA3zWeewDpB9D3prGUXNP
         eIhzZdQNHXs4nIE9oHFTFFK9WA2JtIuKXfjQ304ERibC0iHOzFWr194hQhyf+J9h8ij+
         4or7AU7Nb9aPViH2OzTqd+lFIEX1BxQar3fV3ozIvulnsxKhjBuW7q4KVybjWwHf37C5
         QU6vu7EFxNzgXtbrmKbi3PfK0I0+g/x8NfO7v7leDTD1kvP7vpg4fND/yM8WnnXKIYVM
         7YKanBdvyzK7/qAmAJC37R7k+t/60l3/Rg2xBoFfLTAvioAe5I4rVgRqzW8TOoaGzfW5
         a00w==
X-Forwarded-Encrypted: i=1; AHgh+Ro6e+oUhvgXxe0DAnMo8HPNMUOmedYgr9peUPrh8tEgvoabNCNLHHgAH2psbP+CRS0QWtSQ@lists.linux.dev
X-Gm-Message-State: AOJu0YxvC4sj8zlk9XbsOu8tq9mGcSIbt9uKAwe+ShkisLYKXdoPf/wR
	kK/OuGNWwJkuFLPLP5uIemzj0eSYaIhJ56YOqNkXy0fLRmZfaeX9NMkE
X-Gm-Gg: AfdE7cnxpuDo7aOR3bNkgjizA5PONg0prW0wZvkU3EWiuYLrs8FuO14rujD8BZ9AUtL
	LpkDeLD6HO7LorLscW1ZcSdT7+AgV97l5xinrYXAYqraNMtS/3s4zCzQD4vNnXI5u8uUDGSuEm0
	De5dL5PiMbGYFjuO83IqOaq102Tojnv0JwfCjuRbPQtTFrJfPAQ5xdouNsJ5K2WBLm4X2ifiilb
	/RZE40QKNNWC8qqr8Qj28rk4YB0I6kPFYWFI2ZOLoLzWNazSyCOnPryKwe9QIt9PUR+pr0jc7NZ
	DIJzbunVsAaKvvZpfwgq+ojQa7TPTIFahJqXjVFvpKY/VaQeLamVdPlyIafuO6qJFeF0dczJSbM
	hvSkGrgREyB/CfQf5aVBK+LZbTWiAHV84RUb6WuXVSau3WMqUMH1fU7g9IgOg6nhTtBVpGdjSIE
	YK3gyj1iFt9qLPJa3cPxgBYlPGUTQcqQpnTRPfvfzEsgMJsl9LH2h0JybXYbuuTOcU8Nw=
X-Received: by 2002:a5d:6a48:0:b0:46d:32:3340 with SMTP id ffacd0b85a97d-46fb8d93892mr12284633f8f.36.1782717486707;
        Mon, 29 Jun 2026 00:18:06 -0700 (PDT)
Received: from Ansuel-XPS. (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47290ed4377sm13297042f8f.37.2026.06.29.00.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 00:18:05 -0700 (PDT)
Message-ID: <6a421c2d.1e0bfc4f.b2eb6.06fb@mx.google.com>
X-Google-Original-Message-ID: <akIcKbA8zsoalq-G@Ansuel-XPS.>
Date: Mon, 29 Jun 2026 09:18:01 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH net-next v8 03/12] net: phylink: add
 phylink_release_pcs() to externally release a PCS
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
 <20260618125752.1223-4-ansuelsmth@gmail.com>
 <a271385e-302d-45c7-a1df-aebd380b427b@bootlin.com>
 <6a3fc312.6161eb1e.3441bb.c0de@mx.google.com>
 <178defc6-8e60-4b0b-b3b0-f0f2a4003b68@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178defc6-8e60-4b0b-b3b0-f0f2a4003b68@bootlin.com>

On Mon, Jun 29, 2026 at 09:04:49AM +0200, Maxime Chevallier wrote:
> Hi Christian,
> 
> On 6/27/26 14:33, Christian Marangi wrote:
> > On Thu, Jun 25, 2026 at 04:13:14PM +0200, Maxime Chevallier wrote:
> >> Hello Christian,
> >>
> >> On 6/18/26 14:57, Christian Marangi wrote:
> >>> Add phylink_release_pcs() to externally release a PCS from a phylink
> >>> instance. This can be used to handle case when a single PCS needs to be
> >>> removed and the phylink instance needs to be refreshed.
> >>>
> >>> On calling phylink_release_pcs(), the PCS will be removed from the
> >>> phylink internal PCS list and the phylink supported_interfaces value is
> >>> reparsed with the remaining PCS interfaces.
> >>>
> >>> Also a phylink resolve is triggered to handle the PCS removal.
> >>>
> >>> The flag force_major_config is set to make phylink resolve reconfigure
> >>> the interface (even if it didn't change).
> >>> This is needed to handle the special case when the current PCS used
> >>> by phylink is removed and a major_config is needed to propagae the
> >>> configuration change. With this option enabled we also force mac_config
> >>> even if the PHY link is not up for the in-band case.
> >>>
> >>> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> >>> ---
> >>>  drivers/net/phy/phylink.c | 56 +++++++++++++++++++++++++++++++++++++++
> >>>  include/linux/phylink.h   |  2 ++
> >>>  2 files changed, 58 insertions(+)
> >>>
> >>> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> >>> index c38bcd43b8c8..064d6f5a06da 100644
> >>> --- a/drivers/net/phy/phylink.c
> >>> +++ b/drivers/net/phy/phylink.c
> >>> @@ -158,6 +158,8 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
> >>>  static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
> >>>  
> >>>  static void phylink_run_resolve(struct phylink *pl);
> >>> +static void phylink_link_down(struct phylink *pl);
> >>> +static void phylink_pcs_disable(struct phylink_pcs *pcs);
> >>>  
> >>>  /**
> >>>   * phylink_set_port_modes() - set the port type modes in the ethtool mask
> >>> @@ -918,6 +920,60 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
> >>>  	}
> >>>  }
> >>>  
> >>> +/**
> >>> + * phylink_release_pcs - Removes a PCS from the phylink PCS available list
> >>> + * @pcs: a pointer to the phylink_pcs struct to be released
> >>> + *
> >>> + * This function release a PCS from the phylink PCS available list if
> >>> + * actually in use. It also refreshes the supported interfaces of the
> >>> + * phylink instance by copying the supported interfaces from the phylink
> >>> + * conf and merging the supported interfaces of the remaining available PCS
> >>> + * in the list and trigger a resolve.
> >>> + */
> >>> +void phylink_release_pcs(struct phylink_pcs *pcs)
> >>> +{
> >>> +	struct phylink *pl;
> >>> +
> >>> +	ASSERT_RTNL();
> >>> +
> >>> +	pl = pcs->phylink;
> >>> +	if (!pl)
> >>> +		return;
> >>> +
> >>> +	mutex_lock(&pl->state_mutex);
> >>> +
> >>> +	list_del(&pcs->list);
> >>> +	pcs->phylink = NULL;
> >>> +
> >>> +	/*
> >>> +	 * Check if we are removing the PCS currently
> >>> +	 * in use by phylink. If this is the case, tear down
> >>> +	 * the link, force phylink resolve to reconfigure the
> >>> +	 * interface mode, disable the current PCS and set the
> >>> +	 * phylink PCS to NULL.
> >>> +	 */
> >>> +	if (pl->pcs == pcs) {
> >>> +		phylink_link_down(pl);
> >>> +		phylink_pcs_disable(pl->pcs);
> >>> +
> >>> +		pl->force_major_config = true;
> >>> +		pl->pcs = NULL;
> >>> +	}
> >>> +
> >>> +	mutex_unlock(&pl->state_mutex);
> >>> +
> >>> +	/* Refresh supported interfaces */
> >>> +	phy_interface_copy(pl->supported_interfaces,
> >>> +			   pl->config->supported_interfaces);
> >>> +	list_for_each_entry(pcs, &pl->pcs_list, list)
> >>> +		phy_interface_or(pl->supported_interfaces,
> >>> +				 pl->supported_interfaces,
> >>> +				 pcs->supported_interfaces);
> >>
> >> I've given more thought to that 'supported_interfaces' thing. This
> >> patchset redefines the meaning of
> >>
> >>   pl->config->supported_interfaces
> >>
> >> Currently, it's filled by the MAC driver and means "Every interface
> >> we can support, including the ones provided by PCSs that we can use
> >> with this MAC".
> >>
> >> It now becomes "Every interface we support without needing a PCS", at
> >> least the way I understand that.
> >>
> > 
> > Wait but with the current code using the OR logic, it still follows
> > "Every interface we can support...". The modes that needs a PCS are
> > specificed with the pcs_interfaces mask in phylink_config.
> 
> you current code is correct, I was mostly concerned about the doc
> that goes along with it :)

Oh yep thanks, I will update also that entry. Also maybe check the .rst
introduced and tell me if something is confusing or badly described.

> 
> So in the end, we'd have something like (simplified):
> 
> pl->config.supported_interfaces = RGMII_xx | SGMII | 1000BaseX
> pl->config.pcs_interfaces = SGMII | 1000BaseX
> 
> pcs->supported_interface = SGMII| 1000BaseX
> 
> correct ?
> 

Correct. phylink_config describing that for SGMII and 1000BaseX a PCS is
required and the related PCS declaring support for those modes.

Code will skip searching for a PCS for RGMII.

> > 
> > The late add and release operates on the phylink supported_interfaces ONLY
> > when the MAC didn't specify support for it (by removing it as only the PCS
> > will declare support for it)
> > 
> > The confusion is present because everything is validated later on
> > major_config so those supported_interfaces are just an HINT that are later
> > verified with get_caps and with the pcs_validate OPs.
> > 
> > Adding the supported_interfaces to phylink is really to keep an original
> > reference of the value. This is to address a pattern I have notice where
> > the MAC driver always OR the interfaces with the one supported by the PCS.
> > (I remember it was pointed out by Russell)
> > 
> > But I'm more than open to discussion as this is something marginal to the
> > whole implementation, I'm also questioning if this OR is actually useful to
> > anything on the nth tought on this.
> > 
> > One thing that I notice is that parsing this early with AND might be
> > problematic at phylink_create, but I still have to evaluate that.
> > 
> > My take is that would be good to have some review also on the other logic
> > as I think I reached a point where Sashiko starts to comments on more or
> > less unreal problem.
> 
> True, TBH all the fwnode part is something I'm a bit less familiar with though
> so maybe someone else can browse through that.
> 
> FWIW, I've tested that whole series on a board that has "legacy" PCS board
> that has mvpp2 and 2 possible PCSs, and it seems to work fine so no regressions
> there :)
> 
> A side note with the "legacy" naming, I'd rather have it called "built-in" or
> something like that, I don't see a clear path to porting the existing code to
> fwnode without breaking DT compat, as it's likely we'll have to remove the PCS
> register ranges out of the MAC's range. 

I think also built-in might be confusing as a SoC might have a PCS built-in
but just as a separate device on a different register map.

A better description might be "externally-managed" but that is very long...

Also the use of fwnode and DT is just to reference them and use the normal
helper but the implementation is liberal on custom implementation for the
current code.

Everything is around the pcs_interface mask, num_possible_pcs and the
fill_available_pcs.

Nobody stops from implementing custom parser in fill_available_pcs and
return a PCS pointer created directly by the MAC. (In such case late and
release won't be needed as everything is present when phylink_create is
called)

On OpenWrt we migrated every SoC that used ""exotic"" pcs reference (Qcom,
Realtek, MTK, Airoha) but I don't have a board that used something like the
'pcs' property.

> 
> Thanks for this work anyway, this is great !
> 
> Maxime

-- 
	Ansuel
