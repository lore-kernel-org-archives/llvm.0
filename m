Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7BC563296
	for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 23:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789602842; cv=pass; b=GhysIwSQUEMnIV/hezrnreMsE0rlfj3seGEN1WW8nYMcn1fSTtmpnxHmbCfDPkyqBAhKX3n6/Ji5luzOcD6USHrJ3rn2pnnA5cu89Ru5G8UfEBG4N2UIfaHOQwSbs98cCrsEhUVFwEen8RExegJRlBIK9j5vBmG+zClZXUAUf7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789602842; c=relaxed/simple;
	bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5Lt4jBKUZuxfWBXDDZWJ2KT4D0WeVKyxDH0JdoNWdy9+WH+gTvG0QB8wdXWeJ/sQ2e82WhOaruRCRaGfhP3998Zz7FQdtfLsSVplSpORVaD927hawI8knDTGLvrfKZ8FkEkqfKF/kjaI8+lT8HP0kDhj2xxANaqCNmvs8kHIM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hpmntoyo; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hpmntoyo"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-91064d2d54fso2390506d6.0
        for <llvm@lists.linux.dev>; Wed, 16 Sep 2026 16:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789602837; cv=none;
        d=google.com; s=arc-20260327;
        b=qnXWv8XjV22Oylt5Rc52Oh0cDqLCiaNc8tCe0Zkikx1vry7PIFb5zHujC/LAdp/Sx7
         XSCdCISzFX1ONkTJRcjQhJvvPDjSUfsr7vvZdJbHi4uiZFbMwktl4z1BynghyeGtzGj6
         8hdOqEUHSoCwFfF6xEscE0Guf8U4zku3bSQ/34TMOgXSWcnXuksSpK5PxIRVzzbr3mPT
         jZ0vRf3S7pLkXyhiCMcTCnQEBD66pdmDCDnN30ZEC58XgZZLG2pTQ2l1FU+TPqmW2/U5
         04nrHK5cw+k0M0zkV2qKL7c/c7Oqbck8AICTv62fTuqDe7U39wxODa1pLMmY3etpormd
         EbsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        fh=/uUPnrrU7nqojq4wE5NLFC/g4nKYGjrRWmfK1cwxGtw=;
        b=GpWGmjrRR2vQGDvCbaBwhvomlzBhxVAdqNOSIWOtOe9XMVhU/5IjT8VKBFzhq5+0L0
         eQNKCurEnpbMcnEo7M4OUM5mv4XI97ppCAbtLIJYRh16qqH4+p53qcsf2SO/d6X1+3Vn
         IuRNXVazohU0ozq//+swwNq9P/QJ6m81FnIdTa+paOhKx22otD8gFBV1AvoS6ZliZleI
         4ACOMOdiK404g6wacXAvcSaJrHkAMJLuetI0ne3tE7xfsK37o+r1vVZmgZrwWrMhS/nV
         SlXO/fEkb6r/uQ0xQbTUKBd/H/y/f3oPeak4h5DqqbUHqXWYZB0oVq2vsBPPOAq5tMfD
         tLzw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602837; x=1790207637; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        b=Hpmntoyo8TVKCt5kuvSlhzmvDjapYhPMyuctFWkDHL5w6RKttLtK9MBvHD3ia/gDzn
         wQkgNmZabuNrSPf/PBAuxQKdVnCy/MaOZu5n3mA+Xfbia6y5E/yRsPdHhzbfknvo2oI2
         hsANHgG9fYE/jSc+dusgDZtbxy1swz1tw8nNBGPHxCXHkLuHd8OLWdgXTr/4rV0X/6ds
         HZFRUHZcqZurzZLgLEyWCXeH0Sw2sRWrrMIfu8SxwE5XoSDsfsBbokgtOpjpn1nT+B7u
         aBTWCY+pWkP0Y3OVX1QyLodiKlKTgjmzLSTrkykmptzjAGPrbhxarr8RfxvsrVLr2IwR
         UKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602837; x=1790207637;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yl8nSjxuwI/LouP4WDHFD4P4zMMIU3JlJ+zSqw0WuNY=;
        b=xO+8azFQ+zWruEa72qoych/rfPkyEKgBMatv5iyeB/QnKYDMx6xtbTyuiTcjOTv7ky
         Vxu26BUXmaMt/2VqK7avJ1OCegXM0TcQwtIULrKIlQDNlaLYNkfD8qgij4G0bPvkVhN1
         2S9i3ViLdRdP8WRSUw19jnxiVT8pnB0aPVvvOXHqYIPKtsq0Fo8hovObsRlSZn4V4txT
         siUs6GOBu0ST8EDuJj6iQcy7xM9GRtymY7oLFvC9Sn0tknUOAU3KrSsJ/aTjtQi8VUI9
         5QVq4bRJLpWQUr/19AxuptI6+NG3n1IlJ6EoiUvRawDAX+ktd7Y9vGJUY5sH4e0YKThM
         V8uw==
X-Forwarded-Encrypted: i=1; AKwUvByy+NDxFSCu8GTwQjFkIf9qbtBiRUHUCVXwuJpNS0ykXcphxKJsXeqY71hlf/yOVpNksPdj@lists.linux.dev
X-Gm-Message-State: AFuF++nwX2JTG0zc44PuQwQMa+kI+0bHZjMvFXXqPwAaniTtqt65rspk
	3o5ye4yjcDs2v1SEUXf/SVtYUGrzojLaIc9GgF8XM1TVtxLg9sjmopFQ2IyOwWPvPtKiD96ud/D
	NUsY5ukRnVA/wekdbb2lP+Xc4DRXfrVA=
X-Gm-Gg: AYBFou2qFUZyRfHkP9NVpBLMW2L4zrX538UVDj8uIabJf1IN6NZL+dWOnnEF5HLRV0z
	wwQheIZuvqHtCcsdxGaqEPCrLXYJSdb7VhwPD+Hn4owST21RMu32ahLmMCUblfe1kb3naJ6ZF5n
	Yp4mJozygUYdt0SvmpMSUJ1luLKX3ovG3tKOttWDslsGQeSvit23j/EX+GQ5Q1sST8+NULCsWjl
	DWzANhEJmm9AgD551I0EnIxp9z63g5qN9mAx83qOJPuf7kxXiD4SjdRxnIEHOySJ6ovYHWRDv1r
	QDQaUOZN4/1ZSlOj1ctsqBUy9ZhFI0zotupV6sIvCGwGMTo3IHiLXXF5CmLruNft/Q==
X-Received: by 2002:a05:6214:cce:b0:910:94c6:2ea1 with SMTP id
 6a1803df08f44-9123d7318a0mr91642006d6.12.1789602836616; Wed, 16 Sep 2026
 16:53:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901083001.8044-1-ansuelsmth@gmail.com> <9609a821-c971-491c-9436-9346c48d2ee5@bootlin.com>
In-Reply-To: <9609a821-c971-491c-9436-9346c48d2ee5@bootlin.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Thu, 17 Sep 2026 01:53:44 +0200
X-Gm-Features: AcwNN1XEi8i0bR0p6V2XML1oNL1EMS0XGZ-YJo8qlzp3ByfRA3buomyIp2Ok6rc
Message-ID: <CA+_ehUw0KK8mHDmaH7UBKxq-By7CvXCaWDUg9NvoMPzSe5cgHw@mail.gmail.com>
Subject: Re: [PATCH net-next v15 00/12] net: pcs: Introduce support for fwnode PCS
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno mer 16 set 2026 alle ore 18:20 Maxime Chevallier
<maxime.chevallier@bootlin.com> ha scritto:
>
> Hi Christian,
>
> On 9/1/26 10:29, Christian Marangi wrote:
> > This series introduce a most awaited feature that is correctly
> > provide PCS with fwnode without having to use specific export symbol
> > and additional handling of PCS in phylink.
>
> I tried to re-rerun the mvpp2 prototype conversion, but it looks like the
> series doesn't apply cleanly on net-next anymore :(
>

Hi Maxime,

yes the conflict was caused by LRO patch on the airoha ethernet driver.
I just sent v16 with the series rebased.

Also Andrew had something to say for the mvpp2 patch so maybe we
can discuss how to improve that.
