Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919658;
	b=a8XxKMdFsvmgrNCZB4jSe2jt9KQoDP3qNRyOPgpkax3e51asyti16KAnBR4uCLVScdhv
	 8mP9l4lY+DMnr5tOEk7Y0F1c8tqln0leKEfts6a8L2X5N+WgmqxF5XK3PHbKa1TQYcjNB
	 Gc5sUBRb8qIuFUDaaYtM/4LLQywMub9WCGdot68Xy0dEth+uWd0yT/Dwiz7fZd2PmjwTl
	 5loWtueYvxhXKlHbY6AQIwfVk3utw6TDqQbR/R7xPnsJGH1E60+Gd924SAse61OdR+AzK
	 XOZxfHivquoIKbDeV/G6nAEQL8FFxrN54tpl1dyFFX6tjJG41FIprbalytyXjte6NlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IDaAvYVXZ58edhDcqT25CtUAFfFh9zrLMuk/nutn9Sg=;
	b=aAp1RUOR6Skr+5U6Tze3F2GKQCoSFvs3qo+vRu/ZzGc960BocEQyBjomvs7aZUQQI7WV
	 bnyQAMSu9K1PvHLGsRsGVs9DGYZKJkOS3Cs0FvSq1Gbs/hOxZa9Axyt1acgdyYbBG2JUw
	 do1Wc2mrBVS2S/fjXNhmmg5IWiTmRgG2xN3lX9tnyt7C9drZbQM/p+HgY22ODEmKSV2f2
	 BLCWOG/ACSRkaJBdwXSw+Gh9IJwzi2r1Wol/TM5aEKS1l9UV8+l3LEWYACz0ktDakeLY6
	 xSyK0430NXIZqEcul30wpqRupqQqqho9VMmaDRoFN7hb3F6k6/plkL4lcfACxqm3Kvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zdNNZqCi;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C63606A336
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 12:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06C63606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zdNNZqCi
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso474136a12.3
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 04:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919656; x=1795524456; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IDaAvYVXZ58edhDcqT25CtUAFfFh9zrLMuk/nutn9Sg=;
        b=zdNNZqCi+BwNrCXDV1Wr4vPg2pjw/PLjm9YeYsCOj3Ej2d0dBxj1BspgzeaUfLx5yM
         ZnoDWJKkoSDc+AIwuz/TGNtSL8E+qp+K1lhkqVfU6ig8MNesSCOr2Nl5LcVkOqxo0Hq4
         OxBE61c42m5qYE22gqqhevroa00YWYtDYHWf6++qWClDjPQ/flr1bCEoPIc9mB9NM8Ih
         mCwV7cKnMvM91CSR3E6Tww34Rm3mYHdMtnzVFzb107zOL00E/x3Xq2ryFR14VTrYYP5K
         GHRDgal2xsnalSmacs1IudNJQTtIs4MMjqeWYOawH4x/jQGlNPq4AYPHmdzxgnWfxPBX
         tvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919656; x=1795524456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IDaAvYVXZ58edhDcqT25CtUAFfFh9zrLMuk/nutn9Sg=;
        b=HMQ/yFkjT+OUf58TJjIrM2XeeNiVDN19cU5q8Up+St5rGGJD3l344WGrGl+dT0dlWL
         XD5CNu8Bj/WgLE/QRM0YvAfiv3wPS4nRKNOHThOigGUmXinxZcl5npxAbNwgLoRAwwIb
         ZifuaRdlOFcLh0XcFTeSgLnfvm59RlIlpScH2KW4nybdbDHsDCHsTW3dJuuva3o3GI+7
         0odQ3xQuUe1YZ9vgF3JsA+EQjduDQrnjGyry8HFmhszlM19PwBPznHsBfuELMCGNRV1i
         dItf/0XtY36jBcQlMYyrPnbjePznEzCwJyeZU49XAzHQywqDI6+KHVyonjBPeYYBjqBS
         izcQ==
X-Forwarded-Encrypted: i=1; AL+hErG4GcyrehNwMW1IXaHx4FQL9zWXoEoI5rocVBliBRRrydNRFzDF4uIyPVjTyksKKdlWqJQV@lists.linux.dev
X-Gm-Message-State: APuU4Z/r8eLADVY+E7XhFaLQgaYniayp0WNVl8xZV1Q4WCiHD4V1+KqB
	KFgXLIdZHZnUdUJtyFlO3yd2w0MYwG2tWWw6GZT/exdd1BPWkKa/5Dgk
X-Gm-Gg: AYBFou1RZzQFsFD44gibcrp/9PfNEPPluF5tKMC/Ail6gCNdxtX02VuVXqjd9tVDmpI
	nyTX9W9LSt2BVDJJuMA7/MiKSw/mAqcb0M8Y5k1XI/mZUeMVAnrYComqcItL06jjUqd8oVii3M7
	Pf8V0MQ/9QM4/jQVVJd4wTivDHSECCDOjKgeEhERRFPuhkSsnrisVFWN/3zwL1xLiKfNwEYqXYZ
	1KNp2QuYU//qqsFVEHlB6wYGjjYO2E6GOvMDSKABtPN/lOAITzsB1W9/wFjvwSUzDjP2mitwyp/
	FkDKe3IitUCi7e/9gSBbwa8XZUk0Z43U9KM3l8sBzVeiPVsPUPVgHK+FaBwaMdE4rTu0WctjpYg
	WzPnjvdYMUOPWxMscK8lNLvHHt+7WIBV5vwK7VZBnX+Zv0IfHx38IaYG6608kBCZMCNQdERuLzQ
	AYm+3nHDMRQ9/6lt+u1qAnJ8FWQRQmMIqnxFto6E6JBOcqvWQi6Ul2FyUoCuZUNehnrOg7ntYzn
	J4Jk9u3qRfM9iIFe4r/fgB7X9ZayxT23THfYhNGUoewGVomOmBnsjdDJUP9tmrVn/SqStnhxYBo
	kAF8RFuhcRZA8hBhuAJrORfotBxrt4Dum4O7t3tv8arQBEFsIM8GQieOI6ImzdhIM/FuxzwWU2F
	712c8pqFR5n3TnY8N
X-Received: by 2002:a05:6402:2347:b0:6b8:7d2b:4dcb with SMTP id 4fb4d7f45d1cf-6b87d2b5390mr750722a12.14.1794919656177;
        Tue, 17 Nov 2026 04:47:36 -0800 (PST)
Received: from Ansuel-XPS. (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b87368c70fsm430430a12.23.2026.11.17.04.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:47:35 -0800 (PST)
Message-ID: <6afc4ce7.4b925a68.31e7c.7768@mx.google.com>
X-Google-Original-Message-ID: <avxM5Ldccuc6TgM_@Ansuel-XPS.>
Date: Tue, 17 Nov 2026 13:47:32 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
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
Subject: Re: [PATCH net-next v22 00/15] net: pcs: Introduce support for
 fwnode PCS
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
 <179491941687.3291.11313796890436002644@kernel.org>
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
In-Reply-To: <179491941687.3291.11313796890436002644@kernel.org>

On Tue, Nov 17, 2026 at 12:43:36PM +0000, netdev-bot+sinfo@kernel.org wrote:
> Hi!
> 
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
> 
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
> 
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
> 
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
> 
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> -- 
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

The RCU """bug""" was found while evaluating the code. It's hardly possible
to have such bug on real world scenario since PCS and MAC are currently
tightly coupled. Nonetheless with VERY BAD PROGRAMMING it's still possible
to trigger it.

It's both a fix and a prerequisite for having standalone PCS support.

(hope I don't have to repeat this message for the next gozillion revision
of this series...)

-- 
	Ansuel
