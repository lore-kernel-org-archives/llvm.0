Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794755933;
	b=nu19wyg0k4GPELVJOzkkEKUCiQKVYjc80P9KTGgxrf31I4P4cuMPvuCuU9kzEbOtwaZT
	 GD+DPo3R0WY8NWcfo5buI9oYMShb1z+kqT5rou5cHtBEmYd6pEvl/ejNnIQtnfw77UyzC
	 Lu+Y/zd9V4NapTw/FkSVF/nWlU1B6XNE5W0eIgbLKYeCGCtQe1GL6P8QgmNyl2OCBPBI+
	 zV/gVB9SrCKa6cdH+b3UwTYsmakWz8slWpGJ7pFYnLu0BYmDV2dYI5L2OdBKnBH2QyYN7
	 mOkLmEcgVv+TrEWamB2LeQvYdWERDrRf5OUcBDi9trvv0NOk7fS7UKcouFssamWdmhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794755933;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=jXL3awY87I7bqCpFDm1wxAqeA5Al9Z5LUc/nPR+6gxs=;
	b=XeYGV7CkJl9v86wjIrTzVRleXfRkXLKjBdBX8YauF93cXK2Ri3XuO+3UDaEsCDKSsA/y
	 BnFE2JxcoUY8904pYHS3hI4+IN8blgG4cORzr+iW+Wx81SI9v2i+mhyzBODZRGNM0Dd8f
	 8d8uUdhspHkJOoAivWqpCSm3oOsXTn9z5NZA8ZNmQoO4BqQXpkA6C4y7Pc+oaTtVZ+ZMi
	 z9xGkr0M83nY3yqnRoFOG9jw3W6iWD8Ep/xdDlyEP/S8gZZhiYg0eD1wXgCHCgBYQqsy8
	 BctMDssWNBqgnSi5oP9Ky4Wy6epy42ZyBRxuDnokT2BJ6mxBAoi+6NtmZhFMXR73ZzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=X3fyl0AE;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LN+XwsJg;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067E6606A31D
	for <llvm@lists.linux.dev>; Sun, 15 Nov 2026 15:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 067E6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=X3fyl0AE;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LN+XwsJg
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id DEC6F7A007A
	for <llvm@lists.linux.dev>; Sun, 15 Nov 2026 10:18:51 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sun, 15 Nov 2026 10:18:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794755929;
	 x=1794842329; bh=jXL3awY87I7bqCpFDm1wxAqeA5Al9Z5LUc/nPR+6gxs=; b=
	X3fyl0AEfeBvHFst5Q0V1UEsQeby1BM81HLqcTKPmAuriRvCkJtvXMNqjk3o21zv
	tRZTqOGdm041GVhK72a39b/+gfrMUE98uXp4FKhaSjZZV8oiFStFk3YJoUx30HFu
	emCd5JhI4WFKRIwA0vTUqrxqf7llJjPNxk8UNRXyPYXOGmwjzoGCK/AVELeqyA1T
	Mf3+GebDYnpJmA8POXM/TzFfW6cYecKlX9syieJT3Fc/T/Pfi/I/VHV1QIetjC/K
	ngKqz1MHdYO9Wot9lKt5+xBAcbRSb6bfwcUppMqESa6XU/J/ngZvm1xn67zg7zlH
	CqSBjwTZpNagioRE6sbHXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794755929; x=
	1794842329; bh=jXL3awY87I7bqCpFDm1wxAqeA5Al9Z5LUc/nPR+6gxs=; b=L
	N+XwsJgSy6unJDUxVhbAN9jjR4ChGLpK09UWox0eeTi3aau0ZlGYyDgSYisfeo6H
	V0NpLW6Wt0EJ7sWWpm7PoXWnfTsm6X7EAaLlF2pdx6Hv6tBfS406PDbg7DqMSX9e
	pX20y1bpyPyRZEb+MLH/aF1FGcYJSvyuQMNb+5+S0ZXXSMhvoqIvLWjE7OI18ZOJ
	FXewkwQADJnGK1i8pVgotICZYo1BGU7w/2XVhokJKwC8EzlpkX+pzpVfrN5CrhEq
	aRem9s9O2dN16nywVapYeU0fUkXegPHJ6YXhVJ1yEfu9weCAN/BYB0d3rQtw37zH
	OqGoGoEgun05KfNlkXs2w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794755929; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PGxsdm1AbGlzdHMubGludXguZGV2Pg==;
	s=fm2:rsa-sha256:Crn53s49OtF9oir8swUxFibqZooZroh+BcIRYVQcxTMFIpr
	vct8fQjoiQGFVpU+X2bW3VEjFDYZQCR9glcHBmmzZtz4ESSnyPPCvPTyozvjNV55
	UoUpdQLCKHDbfBYkIcywMLaSZ5LRNDJlQtPL3LvNmLVZZW4cHW4OxPRYrF38v03U
	WsQCTcAZaoT/Aer7hrdqBK6UyMZ1ZtM8pJKEOQ0ykPNdv35wZMbc7Uohg0w2ZUry
	VWjuf+GSHUHBOVkQPg3m5F4B7FaW8ySoInIKylQITuQAUB2HxGO1x2iBr/5w1Guy
	p1b98YMXVcBBdNwBSDI4htCGWv/tpVJP2xUgJdQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:RPRGmgdxnBnNv5uquxYy8MBAVAddXarUAKannPbarMQ=:LPIofgvPCh59qWtpBBu3/xvmkCvTHB5eJOFqs6HnklQ=;
X-ME-Sender: <xms:Vs35auF3ZKeoxzwOsUYqSkStVskbs4R-NGUIdeyhfyeixyyk9EN3ZA>
    <xme:Vs35aqIEdga0nfRUy1jvgxGicKyLl7wz4lxqhsowM6MD8fEPuqveb7hRDmyeV22hw
    eqH_O14ewKa36SMvMq3UQGHhWn8C5qo0Qy9uxzoAAV37KTnw9Vp-1Hs>
X-ME-Proxy-Cause: dmFkZTG0KPJjbF0MaYzlr1rMKbFVKZccD29mlx5DJ2nDT7gsDYCCpAPlozFsGDxohcC0/r
    rBNTGt6QIyhi+iHgRSTHcMZwGyMov7EYB/dRho9I5EtscXX8S47EQ95GzVnNrVZ7/87yQl
    W+t2L/rmREhnML0NmZgivhr89fiMdi0TupTTBVSxjvICnNewjWK5RL/9Aauzl1KonQ6Nxe
    NEWqX4k3HjKJETMzrTNMg238sNyGliWAM3YNCpjFRAvg+11+z0nJt6eJjlFMdihuPNbgIm
    oYg+mzbAvXGVjFYQFNtth3taHKaeWEkuhsGKNyHHNPiZcPoe08V914VpI6+MtAPh2X17cw
    FuBgm7wf7JfRdStmmfKL1GwGzkX4/BxT6+huZ7YIOqNgCkcHUAVroQ0OnY222fxJk82r9S
    UouzJSAmkJtqWmfeYCPE7yv5BfOT00gCZ9RF/HnUOSO2cSH4QXPDYMPsFB1melKmKAd5DE
    U8ZEMFMDe3MXzPL0Bf060i9FZ/du702JWrVBV7M8iUjqjTFwJk2g2RT2y3wMmwXo2p31BO
    TS/nfxaAXtBzKxURMxws+YH3t11fQ7Sj2TFX0JKgypZhMZtveSU2ZgNCOA9Z3ygn7G4BG7
    imxonf/MrJU+NVTafWwmyXTbOjFMBCs94nvQjGLiLz4+9S7XgAPqgyQWVsGg
X-ME-Proxy: <xmx:V835ahrv4y2-PQDiHSsLS0XYo1QHdz5R1BdqX1MXkUm-FttaFVZsxg>
    <xmx:V835al4upEkIi7RJYjYyJk2fjijUGXxBNFBHDXaCSkP3X5EicHxwUg>
    <xmx:V835agcOfApQazsMJguSEf37x-hfOcQn58VFpyTCxaMteRTE03SfOw>
    <xmx:V835ai6xj3oYcT99JabivV--4v_uh8k8TdJQfAbpvVX23n2U379t3g>
    <xmx:Wc35amsAonV99wwPoCZRTnv44dyVVUBYx-zoO6bdqCvwHDlfQyhY36aI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 5C25C32A009C; Sun, 15 Nov 2026 10:18:46 -0500 (EST)
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
X-ThreadId: A4hrlnFi848o
Date: Sun, 15 Nov 2026 16:18:26 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>, "Kees Cook" <kees@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Message-Id: <dbf6e2a3-ac52-4d0f-a2df-b78163e9d57a@app.fastmail.com>
In-Reply-To: 
 <20261114-lkdtm-usercopy-wunsequenced-v1-1-d9f288701932@kernel.org>
References: 
 <20261114-lkdtm-usercopy-wunsequenced-v1-1-d9f288701932@kernel.org>
Subject: Re: [PATCH] lkdtm/usercopy: Avoid unsequenced accesses to cache_size in
 lkdtm_usercopy_init()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Nov 15, 2026, at 05:37, Nathan Chancellor wrote:
> After a recent improvement in clang to warn on unsequenced accesses to
> volatile variables [1], an instance appears in lkdtm_usercopy_init(),
> which can break the build with CONFIG_WERROR=y / W=e:
>
> drivers/misc/lkdtm/usercopy.c:431:9: error: unsequenced accesses to 
> volatile qualified 'cache_size' [-Werror,-Wunsequenced]
>   429 |                 kmem_cache_create_usercopy("lkdtm-usercopy", 
> cache_size,
>       |                                                              
> ~~~~~~~~~~
>   430 |                                            0, 0,
>   431 |                                            cache_size / 4,
>       |                                            ^
>
> Per C11 5.1.2.3.2, accessing a volatile object is a side effect. Per C11
> 6.5.2, unsequenced side effects on the same scalar object are undefined
> behavior.  Per C11 6.5.2.2.10/12, the evaluation of arguments in a
> function call is indeterminately sequenced, meaning any side effects in
> the arguments are unsequenced.
>
> cache_size is marked as volatile to hide its value from the compile time
> constant checks in the hardened usercopy routines. Refactor the
> calculations based on cache_size into their own volatile variables to
> keep the values hidden while avoiding unsequenced accesses on the same
> object.
>
> Cc: stable@vger.kernel.org
> Fixes: e47e311843de ("lkdtm: Update usercopy tests for whitelisting")
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2195
> Link: 
> https://github.com/llvm/llvm-project/commit/955715460eaf9188c241c74750637fc82dfcc423 
> [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

lgtm,

Acked-by: Arnd Bergmann <arnd@arndb.de>
