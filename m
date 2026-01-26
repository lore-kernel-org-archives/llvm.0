Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04FC311960
	for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 07:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769414217; cv=none; b=FFR4cAt+rxA2B9ND2+gZg71spN5FXQFjtXrOjRCWehT4/8vKXChiSiIqKUR2WieBw6gKuEJU+fYOsRymRTBzd2rZSRKFkt1NsBsvF/yas+cJakXl5LdViQbW8bvhAYRMO2wLnUYPnOBeYkjKj7TpybuqjRQZcTsr24srpOpuZ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769414217; c=relaxed/simple;
	bh=+LrPioRNF54S72TjY1H1JjQU7/f9iPy8u2q0PAqC468=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UelcYPRdH6go7LAbRaXh+5WzmCAQeYcL0XE54A0fygJeq4i5HVPAVRIMdfm7ZXRe0F1jXB5edWi7hbaADak0OYB6tLzbRxdBYo50PmOYfDo2cLgARHtahr0xzK0syQxqP9iHW6JoOmELs5UPs7eN/VVVQ4TsBl1CRK2ly3OPDVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=eDOHAvbf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W3fx2I7+; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="eDOHAvbf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W3fx2I7+"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EE9AF1400133;
	Mon, 26 Jan 2026 02:56:52 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 26 Jan 2026 02:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769414212;
	 x=1769500612; bh=3IfPvmYKcPzCTIR9O8n/ZZl1J7ESmm5QMdaDtE3F9Ak=; b=
	eDOHAvbfe67c7eNr6nvfZediiLLte7005PrRqlu0iOJYtnxgkYz8ahsKixtMWmuD
	u8u8nGO1QkjwNaktsBNh2CV5c+9vSXwE4p0INN+HMcT61A1rtud2mCDy2LUIuaaS
	mG7qawiTbA6SBlvFMx4B5MjlsBQ9hkpApdV6pksVN44LVf2NDjdgrnq+oXw4cKTu
	Eda9a2eXauZCaA0oJCQQ30By2P3Bawit66b+1DgGCEqNAzUK6wTbLYnjVygmPTtL
	e1cqM4Y93GWBjzGAh/p1xZA7oFWvRyW/fCvq4Cks2Z/e5OUQdufbB4hLLVv5326K
	M3NxG9mJ2mScK+XkgXhkhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769414212; x=
	1769500612; bh=3IfPvmYKcPzCTIR9O8n/ZZl1J7ESmm5QMdaDtE3F9Ak=; b=W
	3fx2I7+Tr3U/oGqVC8/FrPV/NMfI3Cy8wmbcKoMJ4yMyysqKEdx1Dv0JWlON72n3
	NW/N8kpdDewTu/Ld03jpDt0mTYMXFy+qVOV+x928f2Aw/7qsK/+5mr6NhYzK2NWt
	ZtxkaZVbty9gKQpYkOaQY3Uu6gQ9AI59N+OOvL1clClFURNjw4Rf5E+AcNtL2cTl
	ajRffZ8guBUhV57QGkQ6gQzfpOC3S8MN1o0QLH77PNmaXBsJLDm/5lTpe1BTr3Ye
	M7oAzYxYCGQeBbz+td+Pdh2AtaP8/WFH9A3ht3kZYbw7Wem0WOrajZJFBdFjcVH/
	e7HOsm5c8lvji14tfgEsQ==
X-ME-Sender: <xms:RB53adg4XV3YLrQwjKUTfLbpfRx-xYDDm43MvU6zuE2ok_iyZaWZvA>
    <xme:RB53ac0XchSpGcx1Vhll0YcisS3D8rMC31psmJm4eDWDwL3Ot7sEzlKR9lGABVtEJ
    1o_zH0UQYwPvKgBi-ZDdiA7iWnBuNUArkmJ4SRM7a6IFGD6DEQkQrM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduheejudefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsvhgrnhgrshhstghhvgesrggtmhdrohhrghdprhgtphhtthhope
    gtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepsghoqhhu
    nhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepvghlvhgvrhesghhoohhglh
    gvrdgtohhmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhr
    tghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtghhlgieslhhinhhuthhrohhnihigrdgu
    vgdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfh
    hrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:RB53aReo68kLo8Q1IJCChvRmKN-3htxlI-nXrn6R5155lU1DAyOEzw>
    <xmx:RB53aVm6-evyg8KFJbFCbA2umpHntC9GhAPNbn3962Rs2sCPDehgTQ>
    <xmx:RB53aWxvvEu_mZ49ut_QBMH9nYXstucdc__dd9-N53eNV8C0M_RVTQ>
    <xmx:RB53aYwYVFAceK9En2bDONpgdSB5BKx7v13o8NcOATLXSbVwLVH0tw>
    <xmx:RB53abOVjjg5sh8HqUZ3KEB_tzykmn2fdXpbJmsUeO3-psbeH5fcgbBp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2B7E8700069; Mon, 26 Jan 2026 02:56:52 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: ArrhcHX-7EeF
Date: Mon, 26 Jan 2026 08:56:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Marco Elver" <elver@google.com>, "Peter Zijlstra" <peterz@infradead.org>,
 "Will Deacon" <will@kernel.org>
Cc: "Ingo Molnar" <mingo@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Waiman Long" <longman@redhat.com>,
 "Bart Van Assche" <bvanassche@acm.org>, llvm@lists.linux.dev,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <d3295c84-da15-4695-8110-7e04cfaf1419@app.fastmail.com>
In-Reply-To: <20260126002936.2676435-3-elver@google.com>
References: <20260126002936.2676435-1-elver@google.com>
 <20260126002936.2676435-3-elver@google.com>
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Jan 26, 2026, at 01:25, Marco Elver wrote:
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index fc0fb42b0b64..9963948f4b44 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -32,8 +32,7 @@
>  #define __READ_ONCE(x)							\
>  ({									\
>  	typeof(&(x)) __x = &(x);					\
> -	int atomic = 1;							\
> -	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
> +	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
>  	switch (sizeof(x)) {						\
>  	case 1:								\
>  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\

How does this work with CC_HAS_TYPEOF_UNQUAL=false?

As far as I can tell, TYPEOF_UNQUAL() falls back to __typeof__
on gcc-13, clang-18 and earlier, and not strip out qualifiers.

With fd69b2f7d5f4 ("compiler: Use __typeof_unqual__() for
__unqual_scalar_typeof()"), I would expect __unqual_scalar_typeof()
to do the right thing already.

     Arnd
