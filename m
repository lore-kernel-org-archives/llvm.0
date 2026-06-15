Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B203FA5CE
	for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 14:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533037; cv=none; b=eF4ozhc6A0WcNJ8NMSrwZFUQ28RS4RbHSev8EfEGJXrH2923Dp9YWvjj+J3G1yjcRmksayOX4ZbKCdUaOqJMpenHe9/Hmomiah3AH0H/bwVMFVGwlSkbVJZqNqvoxzKPo4HHRN7UqLSEP4QfINeGcRH3nkZFijRHju1ms3dgBVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533037; c=relaxed/simple;
	bh=f61WmIx+hm1+/2AxbT2xxwh9RLHb5jUbD7RVIZwXnTc=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/4HZTo74FEvsqVNapD3DGAVx2alnD/3idsFSDxcvyZtxKeiIBW/XXwdObWlgHuq+6tee9VFXYwvih/qB/NKmfpiy40eLfwP5Mdv7OimwJtbHULJ53iYNpNAyWPiJXWw/v69myPMUpeWYbbtFyIcvAGx2/l/fYNOiFXgIqy8B/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5hGpwSv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5hGpwSv"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-46013161068so1680082f8f.2
        for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 07:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533033; x=1782137833; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3UfvMLnftnG86sZpVtOaAoiC3x6zQGxcuXN2h4bzNvU=;
        b=E5hGpwSvXAwcFokEvjS4mQCJJMCRVOJ/MiAdDMQPK3G5HH8hOrF6HJCFbRyT9iPups
         M/1TSGM0rE7QwKQNLlygxIHoO4l2LbrtSrViiptsPSH2PyknQIqRyUfHMFp+Hw9D28O7
         J8Cfa/26r+qSMQFBUc0jHon4eA9dppHzTV3AIbvZMifa+qKDJ6wnPwrREV/cv89MW3F0
         MaLlbA4I08YIOt0VdIH7aRCJcB54ewA2qCpj0VzB+27t3Z8LleBStp+xdgPKShHbbnrJ
         TRmVArnFmlpOpJuftE2xylfdaugUJpDfScpr9F6TdQTa9mhYq+P0EBfLquTDz9IIKaTX
         FrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533033; x=1782137833;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UfvMLnftnG86sZpVtOaAoiC3x6zQGxcuXN2h4bzNvU=;
        b=H9dSgtJeOCguzZOjDkii8MumQgatN8wAC1IASbKN5KhC9zYbzVEN/Rs5K65YeVT41M
         LG1bg6GgcIXJRCq5GCHYzCSVdoI/m+53f7cIt+OomSCab2vbeWjG2Xg2q14Nk5H1p0Qs
         vzmSrc21Zb3MxSAPM8923g3bhVqEuQrL6dmMhZ9F4e4o6ht9sOD7M8sDDHw9JUqrRk2G
         a6ijS1Z48ZYzqmOQTK5I3D4R65E6UgmxOhoKqbPJPQWmSbk3GGyPuY6FRoQzIKBkL8w8
         pavGFFri5aOm3sYv8np6vD6m76rOBYdahleSlgboRUw7W1WJVPXt4V8W9KxiexZdAHhp
         TVjA==
X-Forwarded-Encrypted: i=1; AFNElJ9RVgwZeVs5SsaekOjiVa21hZt0UBzHTck2GaF/E0M/a1YVVcc36GhedlwKQuMo3yBCdBBw@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2xtY+XdF595j3k3XMRuIDj4MFuKAh7SCL2Xgr825ze0PAbszy
	gcZvg9JhwlmemzF3Rvmahuz1I/tKy68DCkVV4XtwGQuPDmiK1a/yr4HZ
X-Gm-Gg: Acq92OGpwIMfGnejKyUZ5t3lN7xsJ4mTne3KZ2D0q1w+IWWfjlsbekfW/VP6mMhjmDU
	XHcwQAJ+i25h6qieOyUqSPN49No1QVxxLTw358Z1UUsZNV/eAcSK70q6uqm5MiZMVvto4VKZD1j
	giF9SFJuVl1cpZTTOGqaQPnfOowur0musHKHrsak5aKz+cQ0k76gXHrT1B9WOfHc13De3qYYQBo
	hupPPhtU6ZFsFaW/q8KmCqefq7CfL8/lJ8XzxKWkZluiUGNzxZc1Rg9cCj4VAee4/lHUM1OaToz
	4W6m/ATOro+vycTD6uy5ILVyuwsiFi/JMwY5yk0x9oWOTsmukDvn4xGBzP1GA3BbNpUZbWW1J5n
	K0wZIttnSAJRJcqfgn69ELeJLGoGIZpa+UwXItgLKpdvGrjYDGTXse+Yp1U08pI1NYB+f2k6//V
	hP1nSes73ckma1aXz+gDnhdh0tEc792SHOs7nzNYm8Xt+AFxMmtd7oKA==
X-Received: by 2002:a5d:5e8c:0:b0:460:51f6:6248 with SMTP id ffacd0b85a97d-4606dbc695bmr19385571f8f.27.1781533032304;
        Mon, 15 Jun 2026 07:17:12 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263923sm35293507f8f.2.2026.06.15.07.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:17:11 -0700 (PDT)
Message-ID: <6a300967.379593d1.36e868.4f67@mx.google.com>
X-Google-Original-Message-ID: <ajAJY92mipEgxdlA@Ansuel-XPS.>
Date: Mon, 15 Jun 2026 16:17:07 +0200
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
Subject: Re: [PATCH net-next v7 02/12] net: phylink: introduce internal
 phylink PCS handling
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
 <20260615122950.22281-3-ansuelsmth@gmail.com>
 <3bbacda3-4225-4536-a4b4-3aa31a47a3aa@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bbacda3-4225-4536-a4b4-3aa31a47a3aa@bootlin.com>

On Mon, Jun 15, 2026 at 03:31:20PM +0200, Maxime Chevallier wrote:
> Hi Christian,
> 
> On 6/15/26 14:29, Christian Marangi wrote:
> > Introduce internal handling of PCS for phylink. This is an alternative
> > way to .mac_select_pcs that moves the selection logic of the PCS entirely
> > to phylink with the usage of the supported_interface value in the PCS
> > struct.
> > 
> > MAC should now provide a callback to fill the available PCS in
> > phylink_config in .fill_available_pcs and fill the .num_possible_pcs with
> > the number of elements in the array. MAC should also define a new bitmap,
> > pcs_interfaces, in phylink_config to define for what interface mode a
> > dedicated PCS is required.
> > 
> > On phylink_create(), an array of PCS pointer is allocated of size
> > .num_possible_pcs from phylink_config and .fill_available_pcs from
> > phylink_config is called passing as args the just allocated array and
> > the number of possible element in it.
> > 
> > MAC will fill this passed array with all the available PCS.
> > 
> > This array is then parsed and a linked list of PCS is created based on
> > the allocated PCS array filled by MAC via .fill_available_pcs().
> > 
> > Every PCS in phylink PCS list gets then linked to the phylink instance
> > by setting the phylink value in phylink_pcs struct to the phylink instance.
> > Also the supported_interface value in phylink struct is updated with
> > the new supported_interface from the provided PCS.
> > 
> > On phylink_destroy(), every PCS in phylink PCS list is unlinked from the
> > phylink instance by setting the phylink value in phylink_pcs struct to NULL
> > and removed from the PCS list.
> > 
> > phylink_validate_mac_and_pcs(), phylink_major_config() and
> > phylink_inband_caps() are updated to support this new implementation
> > with the PCS list stored in phylink.
> > 
> > They will make use of phylink_validate_pcs_interface() that will loop
> > for every PCS in the phylink PCS available list and find one that supports
> > the passed interface.
> > 
> > phylink_validate_pcs_interface() applies the same logic of .mac_select_pcs
> > where if a supported_interface value is not set for the PCS struct, then
> > it's assumed every interface is supported.
> > 
> > A MAC is required to implement either a .mac_select_pcs or make use of
> > the PCS list implementation. Implementing both will result in a fail
> > on phylink_create().
> > 
> > A MAC defining .num_possible_pcs in phylink_config MUST also define a
> > .fill_available_pcs or phylink_create() will fail with an negative error.
> > 
> > phylink value in phylink_pcs struct with this implementation is used to
> > track from PCS side when it's attached to a phylink instance. PCS driver
> > will make use of this information to correctly detach from a phylink
> > instance if needed.
> > 
> > phylink_pcs_change() is also changed to verify that the PCS that triggered
> > a link change is the one that is currently used by the phylink instance.
> > 
> > The .mac_select_pcs implementation is not changed but it's expected that
> > every MAC driver migrates to the new implementation to later deprecate
> > and remove .mac_select_pcs.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> 
> [...]
> 
> > @@ -1872,10 +1993,28 @@ struct phylink *phylink_create(struct phylink_config *config,
> >  	mutex_init(&pl->phydev_mutex);
> >  	mutex_init(&pl->state_mutex);
> >  	INIT_WORK(&pl->resolve, phylink_resolve);
> > +	INIT_LIST_HEAD(&pl->pcs_list);
> > +
> > +	/* Fill the PCS list with available PCS from phylink config */
> > +	ret = phylink_fill_available_pcs(pl, config);
> > +	if (ret < 0) {
> > +		kfree(pl);
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	/* Link available PCS to phylink */
> > +	list_for_each_entry(pcs, &pl->pcs_list, list)
> > +		pcs->phylink = pl;
> >  
> >  	phy_interface_copy(pl->supported_interfaces,
> >  			   config->supported_interfaces);
> >  
> > +	/* Update supported interfaces */
> > +	list_for_each_entry(pcs, &pl->pcs_list, list)
> > +		phy_interface_or(pl->supported_interfaces,
> > +				 pl->supported_interfaces,
> > +				 pcs->supported_interfaces);
> > +
> 
> I'm not entirely sure about that, we may need to restrict the supported_interfaces
> from the MAC.
> 
> As an example, take mvpp2. We have 2 PCSs, one for BaseX/SGMII, one for BaseR. But
> if we don't have a comphy (generic PHY) device, then we can't use all the
> combination of modes our PCSs can provide :
> 
> https://elixir.bootlin.com/linux/v7.1-rc7/source/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c#L7074
> 
> These aren't external PCS IPs, but from what I understand you'd like to
> handle these the same way as purely external PCSs, right ?
> 
> I'd say the MAC driver utltimately has the knowledge of all possible interfaces.
> 
> The way I see it, it's probably safer to let the MAC give a wide range of interfaces,
> and filter that down with what the PCSs can provide (i.e. turn that or into an and,
> while handling the case where the pcs supported interfaces is empty).
> 
> What do you think ?
>

The idea is that supported_interface is a mask of every possible interface
from MAC and PCS. Then it's phylink_validate_mac_and_pcs that actually use
that mask and validates it on both MAC and PCS.

This is why the OR was used instead of AND. The idea is to have the PCS as
external standalone entry (even if they are internal to the MAC). So each
entry should have they own set of supported mask.

The previous patch and this try to address this problem where phylink is
actually clueless of what is actually supported exactly because it's has
been given MAC too much freedom of modelling limitation internally.

I feel limitation should be handled by their dedicated function with
.pcs_validate and .mac_get_caps.

Just my idea on this, if needed it's totally ok to simplify this and let
MAC entirely handle the mask. (but I feel the current idea of phylink code
was to have a generic mask in supported_interfaces and then verify MAC and
PCS in phylink_validate_mac_and_pcs())

But by thinking on it more, following your case of mvpp2, with this new
PCS:

- You need a PCS for the .get_state.
- And such PCS will have the supported interface set 1000baseX and
  2500BaseX (as that is what is actually supported in HW)

Either some magic is done in .pcs_validate to deny changing the interface
that was initially configured or this gets limited at the
supported_interface configured by the MAC.

I need to check if this might be problematic for the other driver where
this is being used on OpenWrt but maybe changing the logic to an AND might
be sensible for these kind of case.

(for the other it shouldn't change anything)

-- 
	Ansuel
