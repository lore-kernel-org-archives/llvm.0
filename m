Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794591103;
	b=QB9it3qJ94WIzzU0iz7i5bAe7s3Rwc+pEAYxCe/yDY6C7UROU9dEhOQQlssgvnk8toWv
	 DbtDCCml/gJvVr85CKEI3WFtUGj3dgX2KN8Q7bzrjrkaVeGM6+RhqvEpblI2NXMm9Hxb+
	 dCsxac4qBjOg9uWhsM05DmQB6egxuh3dKsoDvMr9ezNXcDovQugn5jrUmt+7mTBZOM9oV
	 WEN8azd5uAK4HbS9z3NsWSYFr0MuCJDeCRIVxHT3n+M8BpUYo/sN6eMv6TBfzjtFeEEMD
	 BT8MmjSqn10Yb80mw1KH2O7xm3kB3b39tu8sp7R9y4fIy/sXnd9AeKPq1Vf/dB7HTFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
	b=LBrc4TzYS/ao5WwqxzZr3aRSCQEga7YjAIxTuxe7k6c2axntxQHEup/iHrsKt97X0mpG
	 ul7KOreK8WX8cyUst7OohVvtES3CP//jYkvd42yUsAULhQDerOPIVS99ke5sGXCD3QWB1
	 GU2T69cWsxv+91fplRAJKt/gZsOu0UJl3F5DQvQUZ3yI8icf54bckqViRQzlUCLkaTzDY
	 iLnESa/u7b5LMGVQG7GNjctp5KOYoUCyJ/74rogJ1OXKMFmfTh1D+UluYB0RwguEOGJoM
	 l4362hUzyq8QKnQPzcLTtRLYGDwX8JMAXnKopR1DoLoufJBD7SRSUZ1GF6dw1Eqv9Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vm/JgIwa";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9F7606BD09
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 17:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F9F7606BD09
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vm/JgIwa
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-67be7b9abc8so1004652d50.0
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 09:31:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794591102; cv=none;
        d=google.com; s=arc-20260327;
        b=Pdo8lo7sy7Bedo3iQ/r26RgYZDCO8OVY29vUnzH4+t82s3tI7DRadIc3MS4nUDgUCJ
         FWZe2cG2ldDdB6Pxp6KmTpV6FYCZNcE30l7RuxMuH4hjWNXMBOXZqTAQzDS+RzVJEmqN
         tNjYWXx4nLDTSFOBEGYbFOvlLlx+b6eRD6FzYBlre7gEj0lzmuLSYeRj73qZE2TqTTD6
         LnqTy9i6dzOGcijQhY+W9aE4xtF/Vq1OcW4aNNo2w9RpCDPjmbBnu8IwH39vsIqZENjH
         WKWuc9+D1WcIQ+B3rkZqpa5/FvtiDKiAyjrM8JamQKnCOOfgYCuj60AcvQHJmSNdGsr9
         /b3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        fh=p49NR9HQIaxKJOxgKaBnOwx3Tmv72I00yTbBZi+QRBM=;
        b=CZAkMpiwywUbG3q8L6BBjbzzWJQZLdHH0c1b9qrpZsB/8N+8rNBnr3u5OlYK67/acW
         0KZaTZFtWEnfDea+LiFErm2sP6R+lR8e51hCtCTBbgTQqjz1WLdIFBxPxqHJgNv/qD6F
         v3yUyHl+/eem+9TckfrS/bALflbJ7qqIh65KvQ4rNNq6dnQe6ulxpTC90AFO5VeJGQwz
         FKO4NmT9Zj7tbneZZhoFIHw85ag2Uwjvos7wiNoTlAXgf0a3pvcReK5TiLwKKx0+z4Gd
         8MWs03/qJmGMqhjNnBpMV1FdFfxZ+DO+tpBtJyyqIzLYX+LjFQ2GFMgmqnqfvcaRnFyo
         adiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794591102; x=1795195902; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        b=vm/JgIwaD8ttrSEOwHSNdJuHkN20i75nVJmtFvlYJpdMCr/Zq/IlLxfSSeEdpRViif
         yCRiWrhwAWesAeRY7/2WKy2qZhrpZlFhxBdh9bPrpC8PRCkx9uUqJlneXNbrCBXFd/+v
         tu2LsRShgxrOL9Uqh9CezcVJQLjOQ7ijVHZsC743fczpnv03MBPizfZ8sFO1b/jEnjRI
         WoIumI40lqzFKCrvCg6NcmMqc8ptxKeYhcHx39xL8HgvhQ04h8fGkBBRy5sL2Tbo+ORf
         W/dqdADsLa9yhE68vYJX3HstTaN6PWHjo8v0hUEkBmpOWvMARESzkyocnTpp8rjkTn+H
         YQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794591102; x=1795195902;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EtswxBGyiXS8JSPC03lPz9UgjYYoAr3Fyq32GpLBvdM=;
        b=vPpYYeX30Cb1/eIl5E4CCP6ykWP8c8k10q3LJcCTN23HHOlUu3fYBEYh3q1GrQ0+t5
         rUMouprxOpfSzzJj//ujWt4SvrEy8aAdDsrd9RSGwqBEqLTL4QBq82qvJcaHlRChc6fx
         bb1ce7KDfqrf3kIEX3HRdhUxXaLCQubZwYbYAF3BdcsVAujr6q1O73+kFEFKyxlP5kI7
         dePegwYw9jEu1ilGjtzNnEQt0OYm8aSbYdnegMrMGxd64x0qEcEgyRQvp6pDjh4xNE2D
         jQ5PUrZb6yhi/NAIlBu03x+cwDiLXOMKLMSIpUmjs1u7yKthKgJm0IM96UJcgUmSFsNx
         Wx6Q==
X-Forwarded-Encrypted: i=1; AL+hErHAlUUecRqzSBh0JQTVyBIYYgMXVA+lo3PM5necvog98UMZsIr5gjbVpiojCRIfIeQ5z1NA@lists.linux.dev
X-Gm-Message-State: APuU4Z8tOBLTRlJ7FKIOidWO4tbJ86fXMgmftV1O+P3uQJ8Xow9cwUPE
	wh5P087CNWOuRyK6i1n+WbeA9da20onosEl+N6GMaBMR+teKEy47xW2iN2EmlXk2SInL6exAtWN
	Qbz7pN2O/fOznB9Whp+M8b9Z9vrSx0Kg=
X-Gm-Gg: AYBFou0wv+46vEQL2vCr1aQhc/ruwgksUYNhsROG4OUkqRZPlLVxyLnu8knEFj1HRs1
	oq1gdqkMz1Eg08XUC7Vh6lwcDdCZntvag9luUGdPXpl+z9G6JVOHWrdqhm+gs9uerUHJcGGHOMS
	I9qLzkLoA4z5i+d2G7PrLHrokg2QVeuJQxn4OeRSqQ8TYEQMKHLqaRL6FpW0ALg56aRvgqQqT9I
	5jOmpH8dTVjc8WyBkKCrgKoAXuUZ9aaYIpqgj8JdQ/cRXlmTHo3FEHGgP+2jU3EZeiykCiJbzWr
	uscjzGHl/bsoQJVfdoYWd2gY/UZqzOSB28R6Th+sIVqEb9BM4Lq59vGeYSCCFPetzf6EqBkhic6
	QF4SqmkouhLHh1fhILf/Yhq5xbSOPIOAA8E48tbTXD+FgCMZLCPkDus4IxP104lpDa6SD
X-Received: by 2002:a05:690e:4510:20b0:675:47ba:2183 with SMTP id
 956f58d0204a3-67d89709f2dmr1486987d50.53.1794591102378; Fri, 13 Nov 2026
 09:31:42 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261113003217.197757-1-ansuelsmth@gmail.com> <20261113003217.197757-11-ansuelsmth@gmail.com>
 <737e3c57-9aad-4081-ac75-f79cb2084349@kernel.org>
In-Reply-To: <737e3c57-9aad-4081-ac75-f79cb2084349@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Fri, 13 Nov 2026 18:31:31 +0100
X-Gm-Features: AclHuK_T9pn_LFNwcoFkFSy1mvqcLyRF0a8TMF1gVMEOv5saT-u9fzFGXIXxZrg
Message-ID: <CA+_ehUxzPo--g+Ksd_0xJZo7_bhYZ-B17wG3OyGtU=3aa6B+WA@mail.gmail.com>
Subject: Re: [PATCH net-next v19 10/15] net: Document PCS subsystem
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

Il giorno ven 13 nov 2026 alle ore 11:52 Matthieu Baerts
<matttbe@kernel.org> ha scritto:
>
> Hi Christian,
>
> Thank you for the patch.
>
> On 13/11/2026 01:32, Christian Marangi wrote:
> > Add extensive documentation of the new PCS subsystem and the fwnode
> > implementation with producer/consumer API.
> >
> > Also update the sfp-phylink migration guide.
>
> FYI, the Netdev CI seems to have issues with this patch when building
> the documentation, because a new warning is visible:
>
>
> /srv/nipa-builds-contest/testing/wt-doc-build/Documentation/networking/pcs.rst:3:
> WARNING: Duplicate C declaration, also defined at networking/kapi:486.
>
> When executing:
>
>   https://github.com/linux-netdev/nipa/blob/main/contest/tests/build-doc.sh
>
> Logs:
>
>   https://netdev-ctrl.bots.linux.dev/build/doc-build/results/909345/
>

Hi Matt,

thanks for checking this... Yep I manage to reproduce and I fixed it.

Will be present in v20.
