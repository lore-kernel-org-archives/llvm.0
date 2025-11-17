Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E4129D268
	for <llvm@lists.linux.dev>; Mon, 17 Nov 2025 18:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763404548; cv=none; b=EJFEzPh8cy96G1qFIcQ/77lvkJN//ib9AbtoKtg2zsv2tQStBJlvuoBa224kx1KEUSwh9aZpQiFutApjnJ2xmkfEBdoL0upIFn9VArxwkKnIAYrSpqNHN1PFGMY5kmlhjpm5YNKNp4MTmHRn3z8jJf9ZO3pZsUgcZfqXufigIJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763404548; c=relaxed/simple;
	bh=cjOZijZfv+gCL+Wryb9wI/c0+cE3KEtDjZPAz76nomk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RLEabpT1dRCQh2YrHPKWGSiaHVQvplAFF5N9AA+lEzptHY8RNgPPWjoIDt2+bFQWHxhoL4OpMfN9ERBrWhdaL6VvULikVzXRGsoitCyAgJcTvc9YxGOI3jXUeTuZTRaV6AWxRLQ62FkwknmUmIWnIqbTaU9H4z0jeHoWOoLJlO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Ow9517Gl; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Ow9517Gl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1763404543; x=1763663743;
	bh=zH5WVIO3cxOwoV7JqKcP1ToXH/X437vo+cbBXaQZW1Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ow9517GlVkdXb0QK4zjYxuQOHLNlXBQV1cDfbfieA47R/oZppYFaXLUldJ1Tsq5ih
	 cSQWOVBUEIXNRzU9Z0PwoISODUhBmTaVt175wXQkO+pXpKxbHzlR9FcwRIpzz9Tqw+
	 IR2AUVjxkUQt58ykh1SuYyNEC2vg9WKSs0zAWb2vchX/qb4b2aj56AuCLDjILSWJKR
	 y7thVVzmNLOKb57GussgLz8hjrzaxtGyskBAQgEksXSAQcDYFI0X/MRtnGpRX/UsQ8
	 0/Q9NgRR+AM3VtjauiR5MqSjMmNx7MddjrniFxSo0IFFpcXYNxvJBOr2L2aXvHBWr7
	 wsuBdyxI2rtlA==
Date: Mon, 17 Nov 2025 18:35:38 +0000
To: Alexander Potapenko <glider@google.com>
From: =?utf-8?Q?Maciej_Wiecz=C3=B3r-Retman?= <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, ardb@kernel.org,
	Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 04/18] kasan: sw_tags: Support tag widths less than 8 bits
Message-ID: <6rh6ynwrmh7afqkfyfphiy6rv2xjpdpcotzooqfye6lg7rddhe@betrc4geghsk>
In-Reply-To: <CAG_fn=VUx7GkcjuYO3oRH7ptgKVtzQNChW1xKL+1SPfJ=XvWwQ@mail.gmail.com>
References: <cover.1761763681.git.m.wieczorretman@pm.me> <8319582016f3e433bf7cd1c88ce7858c4a3c60fa.1761763681.git.m.wieczorretman@pm.me> <CAG_fn=VUx7GkcjuYO3oRH7ptgKVtzQNChW1xKL+1SPfJ=XvWwQ@mail.gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 89bdc726c809a41792e2e4dd98d31d2c2e8b87c5
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-11-10 at 18:37:59 +0100, Alexander Potapenko wrote:
>> +++ b/include/linux/kasan-tags.h
>> @@ -2,13 +2,16 @@
>>  #ifndef _LINUX_KASAN_TAGS_H
>>  #define _LINUX_KASAN_TAGS_H
>>
>> +#include <asm/kasan.h>
>
>In Patch 07, this is changed to `#include <asm/kasan-tags.h>` what is
>the point of doing that?
>Wouldn't it be better to move the addition of kasan-tags.h for
>different arches to this patch from Patch 07?

I wanted to keep the split between adding the generalized definitions
that Samuel did here, and my arch specific changes. Thought it'd be
easier to review for people if it was kept this way. But maybe it's a
good idea to just move the asm/kasan-tags changes here too, I'll
rearange the code a bit between these two patches.

