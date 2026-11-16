Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847073;
	b=Lp2TnQCkTZ5Y2jx0YJeNePuBzwZO6eSDWZAOFetm4gfgHzAP+Cjo99axZNhSwhTxneOl
	 FkqnzNhdu0s/4LKElKb+NaE2Kx3kutToxn3+fJOA07g4YeIetf9NQVT2Gu4n5dUUAmaEx
	 WDetJr6OU3zTBPouWWjBFKBTT69U3HC5XfzTsjLE1vnxK9Y69ToH5BUYCiCUGvlInSFWn
	 Def4j8Rq1kREPBOFcatKW7fGsg2Z7ZMmIe23byAklWiFOUEc4/cBIHlBzRO/Pt0it/pPK
	 keZShdImEXkFputJdRGRy/sSCYBgf6dbHozW0WMij1RbMkSZcgLdQOMXTJhApI42lag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
	b=DCU1mAvR1Do57idm7zu17XMiPtoRjrEwU3rbZPj3iyeuzHdaYXjmFA0Lmddynvv15gWz
	 pMosh26AAuOEQ3UOyKh3u3IPGPjntoCnnQDwwiQRqClLpa3aNmc8nfv5iJNhH4INjSFep
	 pFYGKakUxcAn+i1fqwKsHMabQl2lUzfqKe4CTmePsaUu8ji869z/9FKtPYNhcjY5gprZP
	 9YB3jbynsAr0wxzJuxnjiGmHJwGHWP0tjVZe8REB+KOdTQefmS2Rw6ZKIkNvpMY/WDbx1
	 k7N9g1CKe1LQgDP9yPhzY+ZizKljS2l7T+7DCvAkP5OHun3dTXt37lVdGN3yP7QyFRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YkkTamDS;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935D9606A31C
	for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 16:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 935D9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YkkTamDS
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1943281f8f.3
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 08:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847072; x=1795451872; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
        b=YkkTamDSmIpAkpn/i0bZJ6/Amu5SRMZvtIyj25/KU92giAzb2Z8r+czKxDTxtWU1bn
         p/dE/Q0zu7Nhahx8I+AN94fgn2ruH3O89bcEKa7uSTWOiZp0pEE5auxaHabBxj5+KReW
         pxcQLfI7H423JQJRBLBHhyM3o7za6aCyjBaLVbh2b8WcQa2WrRrcAhBTtDDm5MBcjjZN
         bWlJ3HaCiuaYU5XUK8dnYu9RJfSi7p1OrY+JLWYqygO06ZgWcrVoUGwYtSG9EkMkail9
         +uBEucQD0fcQxpTX4/eC11joO8JDdfLZLynzWpRQ8AlTOo5kTsKXbTckINbJY8IKhFOu
         Y1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847072; x=1795451872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
        b=aOv34K96wX2tT/iYzwr3u3Gp4QlbooQi4hkSEswA8Lv+VpcP2q1t47oKKXmVXNau6B
         /NvPcU1vohfahx/CPLFzXk1pmIcBXfcHXfPKTi/mvjGnlf5A4ogFgJHcUE6vvaxOgVWA
         iXIm+95uqG9wF8ZBoMpWQB55bXWpiejIozBcLarPxbLXPIWQ2wUxpRx0PAlmtVJLXfXX
         05clv3oab65OPhWUSzc/QG2muqO8hkRSvVqbnB23bsD+4tFwPfIrk8RKDQ7wfj2YQ02s
         mwVOyqlLgwZY9rhsan9FIz22u8+cuJFzAz9iaU37iMdb9OTSYJDmcCb7kPZZx8Nt9puE
         iR+Q==
X-Forwarded-Encrypted: i=1; AL+hErFLODEL9KiIL4RxApq8D5VOMqle0K0vn6TngpfbD+wcZJDlubVRWBbkeeCqJIQbrYglGBKj@lists.linux.dev
X-Gm-Message-State: APuU4Z8l7VpcisAhiQu/bYIyig9AUI0mJ209QUKxeOH+EJtDImby8yuf
	SNav7EN0FM78J6FILDxxaKKN9bNr3Fmcl3ZsFnIBDkZbe+vdWhWjaWxb
X-Gm-Gg: AZFdTZcWNmlrN0BVSm9zhB63oUxuWqv4kviFvQoPHC9RrOQ2kZNd7WoPJtcJq3x+Dsv
	5MgoxayMJQTgnqZ7ykKX2nSPAYaHrAqjxnMi23b6Fo0bfaTOIb2AcVn30hRtwQS2GdClh5s63zK
	p40XT1Xhe2yT4pOlw3x38FdLfmuMCmge6tdNt77bVET9VHJpmBcX5YL+QcT7Tio07gO0ofEKe7a
	T2lx4RiTqQflSv5Ycb4VDxMh2LI0yGNyOGIUy2FCzCWId0JMRG9dBukP2Mba0oVgA5sL40+apJd
	+/naxkTsD0EwUY7PQXwLRmRm6q2CMKjRtOQOIb4p/VlfgO8TI9Wir9jMsAQroGzAjRQ10O3sl3e
	CitQAo9A4nR+cT3/vqRHeztSKArdZd3us+Qq3itnUjhVuBDWiQ80qak8qjtVqAlXhbVaaUMgNx6
	VrjKCu9G2BAbB7luvVR6wEhHtHDIeAbooOxGdaxhmWFkJHSt8+fvgYvuBMUgQQmBx/wSAKA4AYt
	tmWTrhbCvTMFbROsPbHkzOKuNfID0wmBXiRS8Ola1FuaI6VcyMu5prDKrXWYf7RhkW0zLGT3eWR
	rfUeWpjIv0vyDxa7sPc2kNbfg4/SWf4DmZxbQKi8t6R6e0tPldHUZ3RA5JfgRsf0DkmCSe917/V
	INBURmryYYOvjCMH9
X-Received: by 2002:a05:6000:4289:b0:492:b221:ac38 with SMTP id ffacd0b85a97d-49c7381b4e2mr22865762f8f.26.1794847071978;
        Mon, 16 Nov 2026 08:37:51 -0800 (PST)
Received: from Ansuel-XPS. (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm25103969f8f.0.2026.11.16.08.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:37:51 -0800 (PST)
Message-ID: <6afb315f.7f974077.2e08bb.6940@mx.google.com>
X-Google-Original-Message-ID: <avsxW86_xeNrm6Dz@Ansuel-XPS.>
Date: Mon, 16 Nov 2026 17:37:47 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v21 07/15] net: phylink: add capabilities helper
 and track modified advertising
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
 <20261116163412.551438-8-ansuelsmth@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116163412.551438-8-ansuelsmth@gmail.com>

On Mon, Nov 16, 2026 at 05:33:50PM +0100, Christian Marangi wrote:
> In preparation for PCS release/late attach, it's needed to introduce an
> helper to calculate the capabilities after a PCS is removed/added and it's
> needed to track the advertising in link_config changed by the user compared
> to the originally one calculated in phylink_create().
> 
> To archieve this, introduce dedicated advertising variables in phylink
> struct and update it when the new phylink_update_capabilities() is called
> or advertise is updated in link_config.
> 
> In phylink struct the new advertising will contain the full advertising
> bits right after a phylink_validate and the new user_disabled_advertising
> will be the mask of modes that were disabled from an ethtool ksettings
> (with the parsing done in phylink_update_user_disabled_advertising()).
> 
> This double reference is needed to account case when a PCS gets removed and
> attached again to preserve user-defined advertising rules.
> 
> phylink_update_capabilities() will calculate the new supported modes and
> the new capabilities, update the full advertising in phylink and restore
> the user-disabled modes.
> 
> phylink_create() is also updated to init the phylink advertising and
> link_config advertising.
> 
> phylink_update_mac_pause_capabilities() is updated to use the new
> phylink_update_capabilities() to account for user-disabled advertising
> modes and update the full advertising in phylink.
> 
> phylink_sfp_set_config() and phylink_choose_sfp_interface() are updated to
> account for the user-disabled modes, first in the
> phylink_sfp_interface_preference loop and then on updating the link_config
> advertising.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

This is a leftover from the title rename... Please ignore.

-- 
	Ansuel
