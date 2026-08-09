Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216703D88F2
	for <llvm@lists.linux.dev>; Sun,  9 Aug 2026 20:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786309184; cv=none; b=ZvxBfAGirujy5cfXQFKSqEPQvtrQuj9rL3RgI6b0RLeFh35LW5DO5IHKgpBRpFwgjpQz8che9tcaRLh364s0UILqw4GTyIbPNX1XRwJWLIufzt3lcIdgg7PoSLoZp4SUeWgQ2JzZVTY+ckq2beNsBMmx6Jp4nlHxWh3sixqoBq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786309184; c=relaxed/simple;
	bh=yP48NfBQNo4R0PchtDbozjKoJ2iHh4aYKSNN83OczTE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtVPZ7nEQvNRgrvBEdBWVCoREhDiYoWKk+yT7CinToAtTS2kxj9pAwEGQ1mGiK/X4/4nVydiXrr1qwn9pT2z/yClHlKJVDqg6KS18Ro2CC6CXqlgO1yQG608sc6rdNp+L8tZnypf79L9M1NSaUib6v3Cb1TFsueaLSHTFe1uZo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Swvd6bbW; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Swvd6bbW"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47fd4531020so643984f8f.3
        for <llvm@lists.linux.dev>; Sun, 09 Aug 2026 13:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786309181; x=1786913981; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vO4zsqd6+CKiqzXBlsgszWemmLXQdGd/m+GIX3H8Vzs=;
        b=Swvd6bbWPRPP+hflm/1n6lZOaL4jTFpCXeiG7/v/NOpaD1nHDg5c06/DUz3ZR3nMH7
         LSpPkoQ+31sxImAnQXXuqG+zxAaWIKy4hi+v2kuedE17By9nApa1rAh6ADGhGLLyd19P
         9oQZ6K0NKZrMMt3emDlVGwqnxjKWJwXlZxbh4KzhYn/RkCem3RXqHDddTbKapi0uvBMV
         978wr/Pa92CNEVutDmWkS+rybC2LvITv1/cZA/6RvV7Sfev7fhxXa8Dkf+/dbo7f9yW6
         OEFayzlEyLl9scoeyM9JyW+nyJvavR4LqXm64nmovR1ylrmCG/n27jDpSnAkEe0VVYpI
         +BMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786309181; x=1786913981;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vO4zsqd6+CKiqzXBlsgszWemmLXQdGd/m+GIX3H8Vzs=;
        b=jpCNnv9Qvo1LeVkh1kZszSz0xB/mmu991wsNkZmRMPv1iK3JDWgrYYOTTViny7+lbI
         peeYGAskGVttba4Ud1lU/l/Fhl6mwhRzreyJHOFnC++KN1nSJGqNS+9UZJJFNT99tNan
         TYgrRNtq0ninvYC+rN7wsIIqRAu038c02n7sL+xOAa6d3C/hWsPnF2eeNP0Jh+Kh749a
         EgPhg7CX4T+dr6RJ2IzFCT9pfUrTtigwkFOzMBLul4sdFjFQctkbcpbjzweOzltzaKAd
         f1Mh7Ga2kj9IY19/9kboPnlx4OCtUMGglpfSWyYDV8O+jSCX8YoLa5Q2dxFC6PLlmaIg
         c+aQ==
X-Forwarded-Encrypted: i=1; AHgh+Rql69tkR9RihKeKIso5go4M5laSX4OU6Yx3YYNQggZ90GxB77f9lgNEB9tbH12ZD2nrv7A6@lists.linux.dev
X-Gm-Message-State: AOJu0Yzelmr6t9vwrJ4V/9nzaFNWf6vcNv8O+UclFJJaMmbP8IeAbGf4
	zlsvmdy6vMm81BLN+rDIrSCSVCqR9SbUNvfV3fMb4IMq1AkhHpnAjF4A
X-Gm-Gg: AR+sD13QIxL7VD6KwQJ8r+XD3/ax+9w+SVY+cnTtmg/Zq9OixeDu+VEJO/AS49yKiwG
	1htWhPtxzM+8vksk1wpuQBcmJqhtS2Npd6MGI7znQfv1BLFxk1xMnTuWFyWHc40rm3KrMsw0iSn
	Opji2uRMKPnU66JPAWj81arxW5gvIDh1wfOwoWjo07DdDNc3k6e/iiddw6MWt9/mEvr4OyUWhKN
	w2P+OCJc2idRSVrcnUByJEsXmQ1JUok9tBdWkO9j21oEuSz88KOzc4ArpsWhSw0wwHhCywm1sD/
	6WtgdafvkT2ESsbI6+aEGZY0Y/RNjVm2jrT1wlKXyBp+GJo2YkRm2TbJzxy1NIzofqw138sKntJ
	FlQciRSxz5W1isgLWeto0jaZYmB3QqdubS2J7uGmpePIxsur3H/YlNZf8IZdR26P88RSqf5xHB5
	WWvZO6nBwtYXL6jEcmJEvmFf3Iu+w9QSWNCGFTOMEP1nsQ+Kc8Rg+gSgLf0FY2yYBUEo9WUBE/Z
	q+aiSzQAKG6fxOp6C92Fvuc0+OGqqM=
X-Received: by 2002:a05:6000:2006:b0:480:c5:d635 with SMTP id ffacd0b85a97d-48000c5d6d9mr30371840f8f.0.1786309181299;
        Sun, 09 Aug 2026 13:59:41 -0700 (PDT)
Received: from Ansuel-XPS. (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800220a6d9sm30149581f8f.34.2026.08.09.13.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:59:40 -0700 (PDT)
Message-ID: <6a78ea3c.be490abf.cfd7.7505@mx.google.com>
X-Google-Original-Message-ID: <anjqOJWkUJvo6Wsi@Ansuel-XPS.>
Date: Sun, 9 Aug 2026 22:59:36 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v11 00/12] net: pcs: Introduce support for
 fwnode PCS
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
 <4c595c15-17d9-4c23-bb44-344c48d36e9a@lunn.ch>
 <6a78bdc6.89544747.3fcae.b8e0@mx.google.com>
 <f9151481-7dcf-4c9e-9507-7eb0c217851d@lunn.ch>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9151481-7dcf-4c9e-9507-7eb0c217851d@lunn.ch>

On Sun, Aug 09, 2026 at 10:43:27PM +0200, Andrew Lunn wrote:
> > I think the most annoying one will be stmmac with the 3 different PCS
> > implementation but we already handled that in a upcoming ipq50xx driver
> > currently present in OpenWrt mainline.
> 
> stmmac is always annoying :-(
> 
> If this can make it more uniform, make internal and external PCS look
> the same, that would be great.
> 
>

I posted v12 that should smooth stuff even more. I think I found a good way
with the notifier approach.
 
> > @@ -6808,7 +6792,10 @@ static void mvpp2_acpi_start(struct mvpp2_port *port)
> >         };
> >         struct phylink_pcs *pcs;
> > 
> > -       pcs = mvpp2_select_pcs(&port->phylink_config, port->phy_interface);
> > +       if (mvpp2_is_xlg(port->phy_interface))
> > +               pcs = &port->pcs_xlg;
> > +       else
> > +               pcs = &port->pcs_gmac;
> 
> I thought the point of new API was that phylink picked the PCS. Why
> this if? Why not register both and let phylink pick?
> 

Yep I'm not sure of this... If they expose different interface mode then
both can be provided at the same time. I think it was done to reduce the
logic difference and patch delta to the minimum.

> > +static int mvpp2_port_fill_pcs(struct phylink_config *config,
> > +                              struct phylink_pcs **available_pcs,
> > +                              unsigned int num_possible_pcs)
> > +{
> > +       struct mvpp2_port *port = mvpp2_phylink_to_port(config);
> > +
> > +       available_pcs[0] = &port->pcs_gmac;
> > +
> > +       if (mvpp2_port_supports_xlg(port)) {
> > +               if (num_possible_pcs < 2)
> > +                       return -EINVAL;
> 
> This seems like defensive programming. If we said there was two, we
> should assume available_pcs has room for two. I would not even pass
> int num_possible_pcs as a parameter.
> 

Yes the if is redundant. The phylink core code ALWAYS allocate based on the
phylink_config value. The num_possible is just as a validation value of
what the space allocated in available_pcs.

If everyone is ok I can change and include this in the series.

-- 
	Ansuel
