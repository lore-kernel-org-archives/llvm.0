Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB676388E7A
	for <llvm@lists.linux.dev>; Sat, 27 Jun 2026 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782563606; cv=none; b=KaRikuouFutPorKJHrHwWNk4t7S8LYT23ICLlE9SMKT+vusMCTvFQ/0PXM+znoreVGvv8gywJFC+XVkFx0wE+ViIivCXeorLN9rvewEyUannQRDP+zOtACCvcA8D+twC8eWzNj8gLwXuh8xC8a5CseWF2lP426lTgPQK8vRuApQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782563606; c=relaxed/simple;
	bh=xbxEDsydXJAiVLZ5Cf6Ao9KnDZgjCNf+AXTfOmlvxNE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uzd3PCnFV0mP+Fj984zyIImLyDv1Mqpn967UJgf1m3YXWxmODOOmRpWNf1OOcxKeHkqHI69Xq04RbqSZmg1nHLoUKal1VenFnqBW3b/5R8Wx7ZL+TM1dPr/ZIdGVSef8ixFFIdbLFOjd938UvvjlREvb4lO/4bxxiEsk+jVvwrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T1vpTnBS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T1vpTnBS"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso9013045e9.1
        for <llvm@lists.linux.dev>; Sat, 27 Jun 2026 05:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782563603; x=1783168403; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3PtIUvxIw7trdusrNOr6fjoOoHqmRqU46S4I9pGH/As=;
        b=T1vpTnBSdKSKTHFAYiv/kXy2vvmHCVuXb3dl9pdtSmuQsog+Hm3gH9eESHiDtqiwv4
         AxUL+f6f49RvdOKE7a3h+WomCeNXU6DCL5/oc5HoCWUKjZY6eA35gS0utqv7cfYqAo0E
         i5xDRU5G7Cp1K1t6ZpTlXAUeWsD7jmLKuYnj2s7rOWHgdT58TysSr5grvOme4Fe6ZqqM
         ZBln204Dnu4AT28Op7hKAgpOlC4YHtoAm0B+hVFH4o7nLYDy/K6jVzZgreJsz0DF5jRe
         kxuuFResitTe86DOG9RDz4Gbygq9NCFFg//lrttc4T5IqoIafyHSiQoLfqBHiAn87hlb
         fLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782563603; x=1783168403;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PtIUvxIw7trdusrNOr6fjoOoHqmRqU46S4I9pGH/As=;
        b=PvEneXPiZyuaXcWyvMXJ2VNt4EBSXlFWAEYXT4zYjY6ZWJPwIy0wGcINWu4+Oqn698
         8FXf1/xxRzFa8mli4jMx8pXpZZ890flDhya3+1hGN7hjWRbt3hHLYXSuYZn4bFdW8Dam
         OwILoaa9jeAyvJNTeiSG5REIV8kFtMi3l6PIVZliZ9429xYxCCIeMC8xtGJBKbqzxPsF
         NccqKF9b+LtFgJaY+6K3SWVJvebQoHuupQSHGmMyEh3LPbNELFwAQ4kgASAUyA5HSHny
         OsH2e7tj2hPeSt2FYxiWVFr+af8R982QzfMa5Q9y13E9vPeqJ6GbQs6eMwl06fgfUOLD
         Zllw==
X-Forwarded-Encrypted: i=1; AFNElJ+T7QkcyGow/V0LcAzy40ElZI6FPcBVuGKyCtOjchPl8wtzPVtAnTUU1xbfTrOVF2bw1fXQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9aOePYFxCw5hgmr74oEaPgrRpE8Cl4o2cYa/a8WEkx9If3Cjd
	kvgyVF/yLDDAvkVVAeyeeEcOB265mL5TZ5IgHdpnopuMKHDTElMb99oz
X-Gm-Gg: AfdE7cn3mVuZAtXFUUWe//ONd67yiFoyWSLDVAXMz4KjCQAtXzX12QXI/shDBRLRzSi
	+yAbAm1zEySjcxNOrEEKBOUPVkfom0Lv0g8TpsxRh2kzndFycije8y+rkIBETjhdh4Slt0KOev1
	AsAl6q/aqoSnuksGKDZKowBuz5ihLKk+UGAN/gFA0/4RLpnBdKA0+jFoZkS194tLX1NbzFvZRtH
	tCQDy0s18XnqijjptcjqyL6FmZzmF70YXanF+rzw3s7Z+uA09ASB5I54S1rManklpunLpbv4f+J
	/Y7JADVbQAL8NTe6gl6kNuiiK8xUnIu53Vve+Xt8T1uQ2LQRRZZVwq1CM/bEyx5N+dI5xgVAQHq
	/Hq6D7FFzu4PV/hjmcP/W1kNJW0bNp7Z2w6gTQZ+GWgmdN4oia6BI/uys6BChP2KENocWkTZr5/
	lAXR2IRDUfhftKIZ3CNLCB+3DzB71fK2Z6bzsH9dHS2Ecz
X-Received: by 2002:a05:600c:81c5:b0:492:4ff5:fb9e with SMTP id 5b1f17b1804b1-4926fcade65mr62722535e9.37.1782563603146;
        Sat, 27 Jun 2026 05:33:23 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-89-195.ip49.fastwebnet.it. [93.34.89.195])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492690a1a85sm271536875e9.15.2026.06.27.05.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:33:22 -0700 (PDT)
Message-ID: <6a3fc312.6161eb1e.3441bb.c0de@mx.google.com>
X-Google-Original-Message-ID: <aj_DD_djHkw7CLZ4@Ansuel-XPS.>
Date: Sat, 27 Jun 2026 14:33:19 +0200
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
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a271385e-302d-45c7-a1df-aebd380b427b@bootlin.com>

On Thu, Jun 25, 2026 at 04:13:14PM +0200, Maxime Chevallier wrote:
> Hello Christian,
> 
> On 6/18/26 14:57, Christian Marangi wrote:
> > Add phylink_release_pcs() to externally release a PCS from a phylink
> > instance. This can be used to handle case when a single PCS needs to be
> > removed and the phylink instance needs to be refreshed.
> > 
> > On calling phylink_release_pcs(), the PCS will be removed from the
> > phylink internal PCS list and the phylink supported_interfaces value is
> > reparsed with the remaining PCS interfaces.
> > 
> > Also a phylink resolve is triggered to handle the PCS removal.
> > 
> > The flag force_major_config is set to make phylink resolve reconfigure
> > the interface (even if it didn't change).
> > This is needed to handle the special case when the current PCS used
> > by phylink is removed and a major_config is needed to propagae the
> > configuration change. With this option enabled we also force mac_config
> > even if the PHY link is not up for the in-band case.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/phy/phylink.c | 56 +++++++++++++++++++++++++++++++++++++++
> >  include/linux/phylink.h   |  2 ++
> >  2 files changed, 58 insertions(+)
> > 
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index c38bcd43b8c8..064d6f5a06da 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> > @@ -158,6 +158,8 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
> >  static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
> >  
> >  static void phylink_run_resolve(struct phylink *pl);
> > +static void phylink_link_down(struct phylink *pl);
> > +static void phylink_pcs_disable(struct phylink_pcs *pcs);
> >  
> >  /**
> >   * phylink_set_port_modes() - set the port type modes in the ethtool mask
> > @@ -918,6 +920,60 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
> >  	}
> >  }
> >  
> > +/**
> > + * phylink_release_pcs - Removes a PCS from the phylink PCS available list
> > + * @pcs: a pointer to the phylink_pcs struct to be released
> > + *
> > + * This function release a PCS from the phylink PCS available list if
> > + * actually in use. It also refreshes the supported interfaces of the
> > + * phylink instance by copying the supported interfaces from the phylink
> > + * conf and merging the supported interfaces of the remaining available PCS
> > + * in the list and trigger a resolve.
> > + */
> > +void phylink_release_pcs(struct phylink_pcs *pcs)
> > +{
> > +	struct phylink *pl;
> > +
> > +	ASSERT_RTNL();
> > +
> > +	pl = pcs->phylink;
> > +	if (!pl)
> > +		return;
> > +
> > +	mutex_lock(&pl->state_mutex);
> > +
> > +	list_del(&pcs->list);
> > +	pcs->phylink = NULL;
> > +
> > +	/*
> > +	 * Check if we are removing the PCS currently
> > +	 * in use by phylink. If this is the case, tear down
> > +	 * the link, force phylink resolve to reconfigure the
> > +	 * interface mode, disable the current PCS and set the
> > +	 * phylink PCS to NULL.
> > +	 */
> > +	if (pl->pcs == pcs) {
> > +		phylink_link_down(pl);
> > +		phylink_pcs_disable(pl->pcs);
> > +
> > +		pl->force_major_config = true;
> > +		pl->pcs = NULL;
> > +	}
> > +
> > +	mutex_unlock(&pl->state_mutex);
> > +
> > +	/* Refresh supported interfaces */
> > +	phy_interface_copy(pl->supported_interfaces,
> > +			   pl->config->supported_interfaces);
> > +	list_for_each_entry(pcs, &pl->pcs_list, list)
> > +		phy_interface_or(pl->supported_interfaces,
> > +				 pl->supported_interfaces,
> > +				 pcs->supported_interfaces);
> 
> I've given more thought to that 'supported_interfaces' thing. This
> patchset redefines the meaning of
> 
>   pl->config->supported_interfaces
> 
> Currently, it's filled by the MAC driver and means "Every interface
> we can support, including the ones provided by PCSs that we can use
> with this MAC".
> 
> It now becomes "Every interface we support without needing a PCS", at
> least the way I understand that.
>

Wait but with the current code using the OR logic, it still follows
"Every interface we can support...". The modes that needs a PCS are
specificed with the pcs_interfaces mask in phylink_config.

The late add and release operates on the phylink supported_interfaces ONLY
when the MAC didn't specify support for it (by removing it as only the PCS
will declare support for it)

The confusion is present because everything is validated later on
major_config so those supported_interfaces are just an HINT that are later
verified with get_caps and with the pcs_validate OPs.

Adding the supported_interfaces to phylink is really to keep an original
reference of the value. This is to address a pattern I have notice where
the MAC driver always OR the interfaces with the one supported by the PCS.
(I remember it was pointed out by Russell)

But I'm more than open to discussion as this is something marginal to the
whole implementation, I'm also questioning if this OR is actually useful to
anything on the nth tought on this.

One thing that I notice is that parsing this early with AND might be
problematic at phylink_create, but I still have to evaluate that.

My take is that would be good to have some review also on the other logic
as I think I reached a point where Sashiko starts to comments on more or
less unreal problem.

> It's not an error in your code, but I think this is worth documenting
> somewhere as this changes one the things that's already fairly
> error-prone in new drivers.
> 
> I don't know to what extent people use that, be we have a porting guide
> that explains how to use phylink in a MAC driver, maybe an update in there
> would be nice as well :
> 
> https://docs.kernel.org/networking/sfp-phylink.html#rough-guide-to-converting-a-network-driver-to-sfp-phylink
> 
> Maxime
> 
> 

-- 
	Ansuel
