Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683100;
	b=ejT4whjxffVmXnHGeoF4WuDgzzAMt7vXyyM9NusqFQCX9xYbAOhOEM2dLCVLmBBLno2q
	 +DjS6aTNs3oNtTGec3utlNLS1O0Mu2zrOU+kxy7bfTUzm+fHdJ4lMjfbSx2D6SECNcd42
	 eerIlq4MyxQEknZkqYftuakr8yS3chm8s/lsPG0zNtTgNdMQFwIEyeILw/9NQhAoEAMWb
	 UdLxBZEL3/kvw3RQ4RDzQPpoLPqWJ7No0E4ji5KJAp+3E/09/KmQXUKAm+pJttZZzi7nS
	 yn8C9rKowxtclf3wiGekcfdmi1pRzGL/UUcat27kUp5Z+NE9fjsweBhBTwC2bzPSR4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683100;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=RppIeY5vllf2+hf2cp04t1WXDtYA0Vaihax7esewOL0=;
	b=LvrD8W/cpVw0IGDcw5wFfIBOJ/fMatcSiwOwEHBOKW/dtzQ/6Bbe3wWdrnJ9zV4Z9f2c
	 JgY3jgeRvu2SqD+pUDQrhX257sa0XVRsk4/Z5H8dffxpNAhX+8uDJS9jPo+CA19gI8vy3
	 LOr47VXmzzHhTAdZ2e30/c+xGmf6m3EylSWA1CAGFULdRmbsawfB3DXKlIu5zcC0W65Pu
	 4FXGf6Z357NLOUjfZejyYZlwxuMIW6OPMwGouGNnCzkYVFPmjnxFK/zTS3FBotn2gHNyi
	 +INSUhp0r65ybeU2VaKhLLjlfkYqrOXpLNYgnnAdhRw/htlw1wV0NxJR8a0OKnV3Crg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+k3bFOr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AAF606A31C
	for <llvm@lists.linux.dev>; Thu, 26 Nov 2026 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H+k3bFOr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3612F1F000C0;
	Thu, 26 Nov 2026 08:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795683099;
	bh=RppIeY5vllf2+hf2cp04t1WXDtYA0Vaihax7esewOL0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=H+k3bFOrtB+M/y/hsrp5E7jt7ysIBCnOHf8QrKbY6fcqUIHkQFODkA55wASbdu833
	 XnbZdZt7cTgFPknbkPyXFfUdt8LLciVE+H3/JowEfQK3GnzvRyhiaQAYlXsi1uLL3O
	 Fc2P9ZAe/SF9J4xE40bisJmhuIiVG0BqXJdu2a6biWUMRdpe9WPNjQcoAVMrgxC6EH
	 yMoSsOaIZEbeZloft7Wji0yIFcJClkkM32zWc9GQQ/B75/NyUh/aHVTSTsLXGCAFln
	 L6RYRCtypH9CGMd4E3zN7/RvFHTi2RGO+1lFDmREfvrUTeQk/usXhPIwTdGMxzB2gq
	 vffnJFLHnqwKQ==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 83A891980074;
	Thu, 26 Nov 2026 03:51:36 -0500 (EST)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 26 Nov 2026 03:51:36 -0500
X-ME-Sender: <xms:FfMHa0laADlyZP9M-X2_UHSrh236MdICVSgypDwlKXA0SCf0OmTtUg>
    <xme:FfMHa-raHvt7XdxLCzDERzgJTX5XxFgmmoVBTF-3sBgwA0-EWmt-gTJWdnwOrjFzH
    NQ7_-HqieKrcmXvq3oCVMBDwEqBGI8yikb467-7Ip7x8spCYMlto-tC9g>
X-ME-Proxy-Cause: dmFkZTFdXZx5D+wChms5XzfJyMjmRiHcVmSWyeb39LIudyuiUQP+DSckdhBpJ4yf3dQhj+
    zGeszSE2EDJQvCKnVYJmrBB/fxdre/UH26VvWx3g/bXO3btQWPWplkcD/yV9Xmsfh2ZRmO
    Oz7e49MSWqBnPkR0wD/AqDtL4UVXu2tXVDCZoFf0CxOGUHxMTUBZmMjPC7idq7aVAO6/zL
    VKRfVEGTP0jds+z2f2soiTVnz6lxZsB0U1G6lmog627s4DRoEbvOI0bTGdqyQJjfDO6hAj
    +PzGhsdlA+UV06mt5H9wzBE87UJvyKrYxyzDUETfV4U/egMu8ZwnCeOUcB94TSWdO3Y2I9
    LV0M3QK0PD3t4WpZMGPsjcIgA2GATSGpaVmiQgkwNGkRsEQ57DCwr1dZno4DN882EQCu6Y
    URxbKvx8JtMqI4kZzlPB7U0y65GpjbW+8ZQoOCOIuDG2JU/MVQvYvSdeuWXd+weMLaHvTH
    jj3pWKbc1Hoom1YsQ5uodFcJCNxQy5n5/OkkmgSXdwDpDNsrGeGWB8Qxtus5qhXNDDDhQn
    L0z/7/XuOFrr7MNBxxv2P9G5QHrz7OD7ZuI877BTQcwRNuuACNcDhKox/dN1cOhS7ZnW/K
    Y0rKeG9wbRUB0J89SBKKWp8qbG0HOCjp8zfofz8IjSIN2QveWFRLeMIFgL5Q
X-ME-Proxy: <xmx:GPMHa4g-SlUFgZ2cPSt9dtgyZL1bP3nywzHUviRweRroVpMqD-gefg>
    <xmx:GPMHawf0kbWzw20qIA6d8m3B5FMh-e901--sN-xLoVAR14t-oKcIvA>
    <xmx:GPMHaxI2Ag000y8zCdwDStt7yhVRSGT3fB4taL3YwB1AXtZLP8Iedg>
    <xmx:GPMHa9mkxy5VYxKMQAoj9dRdwKZJDFYxkoKIMRWdhcubO2gS5lC0nQ>
    <xmx:GPMHa5eWC9BwrrMrLd1-Q4rLqx6RobETgeAJEGzuouO03tjBJZIf0fWP>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 97628F80093; Thu, 26 Nov 2026 03:51:33 -0500 (EST)
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
Date: Thu, 26 Nov 2026 09:51:12 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nick Desaulniers" <ndesaulniers@google.com>,
 "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org,
 "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
 "Peter Zijlstra" <peterz@infradead.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Nathan Chancellor" <nathan@kernel.org>, "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, llvm@lists.linux.dev,
 x86@kernel.org, "Alexander Potapenko" <glider@google.com>,
 "Marco Elver" <elver@google.com>, "Dmitry Vyukov" <dvyukov@google.com>,
 "Uros Bizjak" <ubizjak@gmail.com>
Message-Id: <38ad4de5-1a41-4fa3-bd73-2f24d5578c41@app.fastmail.com>
In-Reply-To: 
 <CAKwvOd=1u6d2Epp8MgkesknixWcB+JLKfAQq8g9kqYw5sDoLow@mail.gmail.com>
References: <20261125104953.381561-2-ardb+git@google.com>
 <CAKwvOd=1u6d2Epp8MgkesknixWcB+JLKfAQq8g9kqYw5sDoLow@mail.gmail.com>
Subject: Re: [PATCH] x86/percpu: Use address space loads for per-CPU reads when using
 Clang
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Wed, 25 Nov 2026, at 20:05, Nick Desaulniers wrote:
> On Wed, Nov 25, 2026 at 2:50=E2=80=AFAM Ard Biesheuvel <ardb+git@googl=
e.com> wrote:
>>
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> Clang never discards inline asm with memory operands, even if its res=
ult
>> is unused [0]. This means unused per-CPU reads are always emitted,
>
> Ack on this missed optimization.  I _just_ got beers with Bill last
> night, and forgot to bring this up!
>
>> including the load of this_cpu_off by this_cpu_ptr() in cases where t=
he
>> resulting pointer is never dereferenced.
>>
>> Clang's support for the __seg_gs/__seg_fs named address space qualifi=
ers
>> is insufficient for full CONFIG_USE_X86_SEG_SUPPORT, but works well
>> enough [1] for plain loads, and is present in all versions of Clang t=
hat
>> Linux still cares about. So use those to implement __raw_cpu_read() on
>> SMP, permitting the compiler to elide them when the result is unused.
>>
>> On a v7.4-rc1 defconfig build, this gets rid of 174 spurious per-CPU
>> loads, 136 of which are loads of this_cpu_off from this_cpu_ptr().
>>
>> [0] https://github.com/llvm/llvm-project/issues/245738
>> [1] Exclude KMSAN, which ignores the segment base when instrumenting
>>     such loads.
>
> + Maintainers of KMSAN. Ard, can we get a formal bug report about that?
> https://github.com/llvm/llvm-project/issues
> With the report in hand, it would be handy to reference it below.
>

Posted a fix here:
https://github.com/llvm/llvm-project/pull/246269

Will add the reference to v2, and incorporate the rest of your feedback.

Thanks,

