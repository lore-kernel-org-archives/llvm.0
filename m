Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8883F9F35
	for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533130; cv=none; b=te/4ktNn9ieSJ3CJKU/KpB9971nk/Cvonl1zoCRAnWSEVQNAi8EFznZ39X6Wmlh8vgPoIPVs+TPIuDTiDqX+rPTO3JiVUYSo63sBtk5J62SXyJNLnEDLz36P3+UcXj2HMuZrsa/xW3RmOtWehH74jVTyjN+3N+M1yoHP5Xr/cOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533130; c=relaxed/simple;
	bh=taTuI/uTOMXjIXPXu667WK4H5vUawgRfjbE0mglsoXM=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzNB2zzX09SC0iySxEh0RGaNIy5aMwHdd6zMZ1Zc352uobi9Qc2Ha5K+26wbFB0dX4sOYRaOgiA7wbcKmFIujIut/xS9TbeYmV6aF5iPh4owJxxpD9vCHO+OwWgSc4LdZlSectPEUZ6T9bdwjrIVVvbzy1NbqcVf66j3hWVvL5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dt/Xwmwo; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dt/Xwmwo"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490c1915793so30222605e9.2
        for <llvm@lists.linux.dev>; Mon, 15 Jun 2026 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781533123; x=1782137923; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hkIb+b4xA4Dtv3ljZrlwMo9RpQWTNWYQCjFJM6rj18U=;
        b=Dt/XwmworuwuZQQjjhK7FtkH5w0OFgtb4RAifyI9kuMam6Tkjpgq8sFxmWnhAT0lsP
         U06uY/p7uOyaiz/UYUdO3e7OGVCzQFNSx4s9JPjo3oPX1rK8VU/PN0VLkCYGSN9GzEPr
         8Wb1cyV/CQOZU+7yyG69mn/9cTYA8A4DqhFpGzb6IWvBMQylRx6RHXPbXtl3jRz1MhgJ
         dVLkjlI4CDgsCTGaFX4Z3xFH0vPF0Ec/pHOIa3xecdu8WugvKug21ioio4L9AGT56S+7
         FYirPoACMIljrP9PDRG4A8Zk0zsTNFfnb1FDYhmFf6mySqhpGtv6Shj6VMWRPOXVR9X7
         po0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533123; x=1782137923;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkIb+b4xA4Dtv3ljZrlwMo9RpQWTNWYQCjFJM6rj18U=;
        b=TnhTM0PzdUKWSh32Qf2q+fvh8cbgIG/o0Af8tt07xoG97TtvGqmwgAZrrRR8pQ5ekj
         wUk09WlQUj+FoZrYi09WEVe3BVxxDygCw9I2MBe0rFaF0m8q4zlv9Pcs0k4kDoaTDzmp
         cj05HwrSQt3EALDxKk2bDmnwvKjR7gRJHFmU4kKyFvmCx2nU0q4kRebZ92/gD5acf78M
         EcIOHGfPhg4IGiQ1lcgBNXbs+BMd/93jupmpCy/sl8jToQb/WL5RRoEzYL1lkgFys/8E
         gQwyqYtDDClokveJb8LmWLtKigI2Psm9dEyd70hUI+D/r+VWbpvOQjXbInNC0i7ihaPS
         oFDg==
X-Forwarded-Encrypted: i=1; AFNElJ9ZFIuLbPWANgEex1dYSy6U2L372Z4p1YcROHCX781owgLpOtAsMioUJ9AewVflGJcNE4EV@lists.linux.dev
X-Gm-Message-State: AOJu0YzCDVDVgLd8QSwEIA6YSAr/ZorzQzE8vFngjsjThSP+Ee8o+1WK
	yGj58629bEOVbCc8yDpQNLjzjLWtUU2uy7iTwxXh96VKvKNNvwdjDfca
X-Gm-Gg: Acq92OGHQ/brvNK+d0jdzpgn38actzqrQwhjOvvBG93qmNbKZTDPrHJpu97Vvsu/zlI
	gKkZs+7afFIvKzzGqIPOAyNuBoukiyctjqgMEmXIzsFhMLRYGxlshFQt+XuSBT/Z52GJ75RgseC
	USGBJAyd+OkoCTDHxU62fNG4jJ9Lf8tGRgudlnMmruSzTc07sgf6iWg7gyHW6Jz04YIxpJu86e2
	li2zYZUnBjjjAi3xOQ4+wvOFqBSEw5Y8vCYuLv87dkkzOfWYm9FMDi+Vgm8yH8mIm0L2mY1aCVp
	AFU9/UpYu+guKKfhfq/6jHOBZlCwBuXQ51VRc7n0wYzm5IpfUIkuHA/vnxvD1KgVcdA107b4EjI
	iW2HFEPNGWr/awjxX5WdoCeaiwRq3AFp2YaWyhdCiAPpgEjo3mxjZUl2PXGN28Y6inFMCjb7ehT
	J/AzUpsVzp/Awn1O5FTa9MR0nDVqkB506o1Gcni0ddAIlVndFU1W0q5A==
X-Received: by 2002:a05:600c:3153:b0:490:e5c1:b897 with SMTP id 5b1f17b1804b1-490ec4fe7c2mr195111285e9.20.1781533122746;
        Mon, 15 Jun 2026 07:18:42 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edec6sm283566035e9.3.2026.06.15.07.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:18:42 -0700 (PDT)
Message-ID: <6a3009c2.561280e1.2acd9f.2f06@mx.google.com>
X-Google-Original-Message-ID: <ajAJvXT9R7UrMqQA@Ansuel-XPS.>
Date: Mon, 15 Jun 2026 16:18:37 +0200
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
Subject: Re: [PATCH net-next v7 01/12] net: phylink: keep and use MAC
 supported_interfaces in phylink struct
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
 <20260615122950.22281-2-ansuelsmth@gmail.com>
 <371a1df7-084c-4431-bd00-0045298e3212@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <371a1df7-084c-4431-bd00-0045298e3212@bootlin.com>

On Mon, Jun 15, 2026 at 03:33:34PM +0200, Maxime Chevallier wrote:
> Hello Christian,
> 
> On 6/15/26 14:29, Christian Marangi wrote:
> > Add in phylink struct a copy of supported_interfaces from phylink_config
> > and make use of that instead of relying on phylink_config value.
> > 
> > This in preparation for support of PCS handling internally to phylink
> > where a PCS can be removed or added after the phylink is created and we
> > need both a reference of the supported_interfaces value from
> > phylink_config and an internal value that can be updated with the new
> > PCS info.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/net/phy/phylink.c | 22 +++++++++++++++-------
> >  1 file changed, 15 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index 087ac63f9193..4d59c0dd78db 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> > @@ -60,6 +60,11 @@ struct phylink {
> >  	/* The link configuration settings */
> >  	struct phylink_link_state link_config;
> >  
> > +	/* What interface are supported by the current link.
> > +	 * Can change on removal or addition of new PCS.
> > +	 */
> > +	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
> 
> Can you clarify a bit what you mean here ? Is that the combination of the
> interfaces the MAC supports AND the currently in-use PCS ?
> 

Combination of interface the MAC supports and the currently attached PCS
(not the current one in use)

The fact that it can change is due to the fact that PCS can be attached
later and supported_interfaces can be updated accordingly.

-- 
	Ansuel
