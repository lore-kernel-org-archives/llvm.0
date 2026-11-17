Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907030;
	b=BDOj1E5hg0d16hqL8McLq5ZEB3yYvdgbjN6DaB3LngK1oWb4UOHlKDCY+VZ3bFL33y2O
	 jbTDlIE2fLLJhBGJCEZ5BdrpFy0StftYHydlOkE7kQDGzO51YFUKLp56BH4TuW0H4RMnS
	 UJyHy/mUgLPRJoRktWjcZ2ubmqEkup4FEMAgSQvP2qLw+lYXeqr6K14f3XwixTd65NZPv
	 PVY+2AzQmPLd1SjtXlyRrjWZnmKgwb8ucgN6Kw9WUDI7PnLMW6jBbwy1BLDxisJ2TvsrI
	 ifBnvo1ykC3o9v9n0OEbgdO8OZYJQ1HUq4ycHFFZH6fNpAKJbJA/G0VdusPSTP7JjTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907030;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=ylxYAdRJbN2+nc71qafuBh5CUEHqWV7dF5BSNuKNgSQ=;
	b=5DEsP6rbQ7RdaegDz/HBVKUJJnw2J1+js9j/Clw7AOVfsBmYLId/0P/pDZCA2OpgLbfn
	 M8+xvRSeBKwPGkjBNr4dCD6zhNL+04G8+JaVUEUhoZ2ADSWTHkvyXEMSZ+8t0eSf814oX
	 7jWg9mBZh+sqGRa2tuEz76J1XKFdw4A4It2ONOmTLlJK23CeZKRz743e+OWxB5M+SVten
	 JFT/0uxglA0LKPMmAgLjDU69aqzad5x1SxesysXZTOjCTbzvMLvhu35Ze8Rg8SmDZbffg
	 ybczNbSSvjoMeZ70b5J4EXUJl//OuYYtFWUsEY6PoMo+SLnypgo3ENzyf1yzyrbXGEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=hA+RuZCt;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tGdAx7tr;
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56BA606A31C
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 09:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C56BA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=hA+RuZCt;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tGdAx7tr
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EA9FA7A016A
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 04:17:08 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 17 Nov 2026 04:17:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794907026;
	 x=1794993426; bh=ylxYAdRJbN2+nc71qafuBh5CUEHqWV7dF5BSNuKNgSQ=; b=
	hA+RuZCtBlroKaHaa4om9KunlkijfGP3m5Jg3UQaLOMRXDqT9Gs088GRQLPFbqAp
	PLYGf0mgpszIM4ns3teOJrWdgFX8RKIcwRmJAYU02GLXIrIl6l26ya2PInTL7blf
	H18Z1ZEAunH3hXdRLkKbqKKw9MQNcbtDbl0nRFjjNM7IeO/7Nxw5Oi8R8mAGsDWD
	//zAPISaT0eUicCjkV6R6jEZ6sAby/yv4NQFIfSooUR4GbZ+RYmjo7brwSO0M05W
	JyRdnoQpGqYp0lOe7F5mXst+BW06gHPKfdEC7HgcBZLKBQUjXaV+KOeMA38FXWAW
	GqInLtpn37TDqL7sKdvBVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794907026; x=
	1794993426; bh=ylxYAdRJbN2+nc71qafuBh5CUEHqWV7dF5BSNuKNgSQ=; b=t
	GdAx7tr9oaHRUfB2MalZ7Rcqu8PJHKMZ0TovI/NdIFtDVHadNoSkmAnv5HPpm7py
	N+y3Jm/fHIlx1qXJXdTLQWhtTKzPt5UD+SgNPrPF/cFTAJs6WeK3+VjPmFnxQ4Xp
	dDcVsSTe6l0+cqBdjhMu0GvucYh03pCIKPwgdntGLIZrxuh7VH+T4omYBTCPQoR1
	q3W2+OWbD73rvSqHqKLBvENeZTVYHPlngd4VjfqTUGaIUdDtH39wvWnupnpC0JE9
	Gj6tYCPzoZpn/Fy8ykQD+Vr18dwHuLZM0PE5R8jwtP5lMiyLKluayuT0oww8YfFT
	uC35KTMhFTO/Nk6c98KIQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794907026; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PGxsdm1AbGlzdHMubGludXguZGV2Pg==;
	s=fm2:rsa-sha256:R7PQ5jgQQwnlRcsRkZ7Y3y2aNIgfuTVcdyHveDEicEaI3xB
	+IAQaFI/TXF/YIojPHE5h3vxltCsWKVRs9jPWF/5cHUhOx0OU+hb1EbeJJ0lA826
	WtDItD5GvLmSppxEIDLV4vQsSMFpyyKNSBzMnLdWgjz2nfJw2ygyzTDGe3E6UsWG
	Tp+NxpUd/fN01ylK8uk8dD/IrehOKt/I02rMyAG0S0Dwd5zsbk2ONtw25Bla5oO/
	+fqaPuHlpjpZTvTdcOsKFW8McXHPEc9nNFSzazD1dL6iQTytmkHbaRE3t9/PeuBd
	7ox42hMnvGHGvJ5p9B/UCPGAlMcHuJWGcT/vCgQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:jamKSb1Mh9FEr48BCkl4zyWu3uo82vTju/A5t7S0N3o=:Am9tGrLXliDCWvBTMVenTyCZ+J+acKj5XOpZg9kpzA0=;
X-ME-Sender: <xms:jxv8ataRDI4zM32UHdMoX2iu9LO8TbuwtWBlTB7U9_easuRFnU66PA>
    <xme:jxv8avMvN6f3VMD2YAbeGbnZ6_3oESrJUuctc98tRLRcVNxlZxFf7iBzJKRGJwT72
    UeH4877VjllIHcWEnqRZYlLT4tHkbpV8VdCVj-ZbW2d4KigKX5slILy>
X-ME-Proxy-Cause: dmFkZTGJ09n7RVGHDV+ONr1e6D6IsZ0OG2CaZWAlS0KX6cFRTpTdKWBLQznxcKq+EUmVLy
    xTDzG57fCSXaPatrWJcBUkG+Jy+VGW/J+CB0ROjg/czGo/wyNP2F0XrHSQ4KDngDLwhKV9
    vfX4fmjtlUIlJrfXFRaYjinenkPyGvje6EjPNpP6ZY2MeXyFc4enM4lwwnq4GuNwjf4jXv
    YfhsclJmzs80W+OD/6MC5Nvp5Eev+p1S/y8dSaThGCIo1yYxlj1DvjtJzY0tgahVmJr8N0
    4oorMqXlGtcf3UX3+zV/7z48yK3cg9GsOkDkSn3RA6vTqMabBbheejxq0hJPj7h3+uoGfC
    vNLWgkMlDvHY3A6q7TFxeCYWTM9ujVa1LW4rA3nk5SU5gC37ACwmm2M8niJPb4IvTBbRwS
    U/ISeA4SuqlTaRer0izpEesK1qCd0Bu546ul3XTLjNdsuyYYtfh8LCIrmTJILPZUbvibeB
    m/vd3/wMd8aCRdcvWUm8xBqe2burW+f1pzW2UjNOJcfYFVJKb8OLGA7wnK7mD56ckfw/OI
    chvVxH6pT0X/CS73c/5ixlgzzbPf/29K6w6HaPz0vKIKHvPm7QCC64vflUrWCDDe4dcuL0
    cLewWZYgiwMzBowumquS4ecSuaHRGbhbwAQ3B2rav/FsD++5URTm+AMIBHUw
X-ME-Proxy: <xmx:kBv8agWcQvQmiaKxfascFJyX1-YfoU-OA8gjbQaMAqtMTMtkvjKisw>
    <xmx:kBv8apihsRAHcejL5K-uj7qrnCBP2gONMAlOkTLIvCdbsoYuxoSAcA>
    <xmx:kBv8aoqNcPyk-E6xnAilMfOVzIkaMYIeHEaIrZW17ofJ1dsbumoEnw>
    <xmx:kBv8avH179OmU-I7pGjIwffLIVWDEUQKrhz_o91mRaKnrU7GJc07HQ>
    <xmx:khv8aqY258t0zwwHyVJ4WFNGcx1vfkoZvRwX0-DLqfpiqQAeZDSUopUb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id E21D832A009C; Tue, 17 Nov 2026 04:17:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AzjZfwey9aPB
Date: Tue, 17 Nov 2026 10:16:42 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tzu-Ching Yang" <shingekinocore@gmail.com>,
 "Brian Cain" <bcain@kernel.org>, linux-hexagon@vger.kernel.org
Cc: "Yury Norov" <yury.norov@gmail.com>,
 "Rasmus Villemoes" <linux@rasmusvillemoes.dk>,
 Linux-Arch <linux-arch@vger.kernel.org>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Message-Id: <e79e581e-3038-449d-a637-34389f3e9b97@app.fastmail.com>
In-Reply-To: <20261117054939.2126980-1-shingekinocore@gmail.com>
References: <20261117054939.2126980-1-shingekinocore@gmail.com>
Subject: Re: [PATCH] hexagon: bitops: use the compiler builtins for ffs(), fls() and
 ffz()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 17, 2026, at 06:49, Tzu-Ching Yang wrote:
> The hexagon inline asm for ffs(), __ffs(), fls(), __fls() and ffz() is
> not needed: Clang, the only compiler that builds hexagon kernels, emits
> the same ct0, cl0 and ct1 instructions for the compiler builtins, and
> unlike the asm, the builtins fold constant arguments. The asm dates
> from the 2011 port (a86a7ce30ac0, "Hexagon: Add bitops support"),
> before the builtin-based asm-generic helpers existed (048fa2df92c3,
> "generic: Implement generic ffs/fls using __builtin_* functions").
>
> Replace the asm with the asm-generic builtin helpers, and ffz() with
> the generic __ffs(~x), as arm64 does.
>
> ffs(0) and fls(0) still return 0. __ffs() and __fls() now return
> unsigned int, which is as wide as unsigned long on hexagon, and ffz()
> returns unsigned int instead of long. __ffs(0), __fls(0) and ffz(~0)
> remain undefined.
>
> With Clang 17 to 23, the functions of a defconfig vmlinux shrink by 1972
> to 6068 bytes in total (scripts/bloat-o-meter -t). One helper in
> lib/find_bit.c gets worse: _find_last_bit() executes one instruction
> more per call that finds a bit, because LLVM rewrites 31 - clz as 31 ^
> clz once it knows clz < 32, and the hexagon backend keeps the xor, which
> needs the 31 in a register, instead of sub(#31, Rs) [1]. A few 1 <<
> ffz() sites also grow by a few instructions, as LLVM rewrites that
> expression too [2]. __find_nth_bit() executes two fewer, and the other
> helpers that find_bit_benchmark calls the same number.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: 
> https://lore.kernel.org/all/affe7da1-41aa-4710-bee0-5e3c2b8a8dfc@app.fastmail.com/
> Link: https://github.com/llvm/llvm-project/issues/236764 [1]
> Link: https://github.com/llvm/llvm-project/issues/236765 [2]
> Signed-off-by: Tzu-Ching Yang <shingekinocore@gmail.com>

LGTM,

Acked-by: Arnd Bergmann <arnd@arndb.de>
