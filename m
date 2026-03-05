Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBDB32ABCA
	for <llvm@lists.linux.dev>; Thu,  5 Mar 2026 20:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772741940; cv=none; b=KHQS0rrpStwzOhdaJ2xwrqvnl2GhEnriEdzBCCUiNP2qSmPQWlDhtukXYhc8k7aHtKH+7E4p7Q4+woNWuoHss68JLpWHnuu7XEUEEvRQ4YulWNTn+k8bBoAZgicSwrQ6WRXkqWxgipZjMhM/w1OJTM66znWDIBwp4IFP/gyCgcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772741940; c=relaxed/simple;
	bh=WoGxPTpl582Hvxdb9noJ7KVlLf4+8/SXA7XD6G9PZVU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E9QZ8CtHkO5Is1e/xel4TJHznx15fK7QW+qf2j/Jx63xU6N9xqOWE9Wy48GMVgjGUbDb7SjtB0yLly7CvnTiliv0Tmhxe4HHtj17agaOpyN15URj0tRR5ZgL3DYV+Fmd3Jm6A4pxFz6Sv4IC6YFNFHFyjVyI7qMEmYCgnUpwmJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=dNz8L5X6; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="dNz8L5X6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1772741935; x=1773001135;
	bh=cjzFn4m2KpajID2eW6dWgmxkcxpNABzXQGduS9dF8ns=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dNz8L5X63nDoQARcDMQxpm32vzIVI1W+y1jCcus19DIdSagIgv54Z7QznvUpUW+yf
	 Ciu2kOkw8iuNDo96EOYRcaD4l4WA34pkf+9a+qhClIk6Q0MRDajnOcXgwrxA+sHYy6
	 A0390rDNYyQDd1ZlTQ+4KUwH0Yt+Plc+nPjyssLGMI3D4lM+7Cqo0cy1L9qLp8ASd/
	 uYPsnoiKCnWWH+YitCnxAFJcUF7oUg3AYn5s4Zzsprbjt9cPa7hBqkJy4scquF8Fbu
	 n2sZk2mskLaGN7p2BUJWMj1gbJJuRbe8DHh9IAbzo8TDHdnDReoAyqPIx3BkuO9M+6
	 /fNj+9wDGGWhg==
Date: Thu, 05 Mar 2026 20:18:49 +0000
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Samuel Holland <samuel.holland@sifive.com>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, workflows@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH v10 01/13] kasan: sw_tags: Use arithmetic shift for shadow computation
Message-ID: <aanievpHCv0Sz3Bf@wieczorr-mobl1.localdomain>
In-Reply-To: <CAPAsAGxpHBqzppoKCrqvH0mfhEn6p0aEHR30ZifB3uv81v68EA@mail.gmail.com>
References: <cover.1770232424.git.m.wieczorretman@pm.me> <bd935d83b2fe3ddfedff052323a2b84e85061042.1770232424.git.m.wieczorretman@pm.me> <CAPAsAGxpHBqzppoKCrqvH0mfhEn6p0aEHR30ZifB3uv81v68EA@mail.gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 5b2989690457c011b9b0d41c90461138ce83d507
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks, that looks really neat! I should've thought of that instead of maki=
ng
separate arch versions :)

Do you want me to attach the code you posted here to this patchset or do yo=
u
intend to post it yourself? I'm working out Dave's comments on the x86 part=
s and
I wanted to post v11 sometime next week.

Kind regards
Maciej Wiecz=C3=B3r-Retman

On 2026-03-05 at 13:05:48 -0600, Andrey Ryabinin wrote:
>Maciej Wieczor-Retman <m.wieczorretman@pm.me> writes:
>
>> --- a/mm/kasan/kasan.h
>> +++ b/mm/kasan/kasan.h
>> @@ -558,6 +558,13 @@ static inline bool kasan_arch_is_ready(void)=09{ re=
turn true; }
>>  #error kasan_arch_is_ready only works in KASAN generic outline mode!
>>  #endif
>>
>> +#ifndef arch_kasan_non_canonical_hook
>> +static inline bool arch_kasan_non_canonical_hook(unsigned long addr)
>> +{
>> +=09return false;
>> +}
>> +#endif
>> +
>>  #if IS_ENABLED(CONFIG_KASAN_KUNIT_TEST)
>>
>>  void kasan_kunit_test_suite_start(void);
>> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
>> index 62c01b4527eb..53152d148deb 100644
>> --- a/mm/kasan/report.c
>> +++ b/mm/kasan/report.c
>> @@ -642,10 +642,19 @@ void kasan_non_canonical_hook(unsigned long addr)
>>  =09const char *bug_type;
>>
>>  =09/*
>> -=09 * All addresses that came as a result of the memory-to-shadow mappi=
ng
>> -=09 * (even for bogus pointers) must be >=3D KASAN_SHADOW_OFFSET.
>> +=09 * For Generic KASAN, kasan_mem_to_shadow() uses the logical right s=
hift
>> +=09 * and never overflows with the chosen KASAN_SHADOW_OFFSET values. T=
hus,
>> +=09 * the possible shadow addresses (even for bogus pointers) belong to=
 a
>> +=09 * single contiguous region that is the result of kasan_mem_to_shado=
w()
>> +=09 * applied to the whole address space.
>>  =09 */
>> -=09if (addr < KASAN_SHADOW_OFFSET)
>> +=09if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
>> +=09=09if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0ULL)) ||
>> +=09=09    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
>> +=09=09=09return;
>> +=09}
>> +
>> +=09if (arch_kasan_non_canonical_hook(addr))
>>  =09=09return;
>>
>
>I've noticed that we currently classify bugs incorrectly in SW_TAGS
>mode. I've sent the fix for it [1] :
> [1] https://lkml.kernel.org/r/20260305185659.20807-1-ryabinin.a.a@gmail.c=
om
>
>While at it, I was thinking whether we can make the logic above more
>arch/mode agnotstic and without per-arch hooks, so I've ended up with
>the following patch (it is on top of [1] fix).
>I think it should work with any arch or mode and both with signed or
>unsigned shifting.
>
>diff --git a/mm/kasan/report.c b/mm/kasan/report.c
>index e804b1e1f886..1e4521b5ef14 100644
>--- a/mm/kasan/report.c
>+++ b/mm/kasan/report.c
>@@ -640,12 +640,20 @@ void kasan_non_canonical_hook(unsigned long addr)
> {
> =09unsigned long orig_addr, user_orig_addr;
> =09const char *bug_type;
>+=09void *tagged_null =3D set_tag(NULL, KASAN_TAG_KERNEL);
>+=09void *tagged_addr =3D set_tag((void *)addr, KASAN_TAG_KERNEL);
>
> =09/*
>-=09 * All addresses that came as a result of the memory-to-shadow mapping
>-=09 * (even for bogus pointers) must be >=3D KASAN_SHADOW_OFFSET.
>+=09 * Filter out addresses that cannot be shadow memory accesses generate=
d
>+=09 * by the compiler.
>+=09 *
>+=09 * In SW_TAGS mode, when computing a shadow address, the compiler alwa=
ys
>+=09 * sets the kernel tag (some top bits) on the pointer *before* computi=
ng
>+=09 * the memory-to-shadow mapping. As a result, valid shadow addresses
>+=09 * are derived from tagged kernel pointers.
> =09 */
>-=09if (addr < KASAN_SHADOW_OFFSET)
>+=09if (tagged_addr < kasan_mem_to_shadow(tagged_null) ||
>+=09    tagged_addr > kasan_mem_to_shadow((void *)(~0ULL)))
> =09=09return;
>
> =09orig_addr =3D (unsigned long)kasan_shadow_to_mem((void *)addr);
>@@ -670,7 +678,7 @@ void kasan_non_canonical_hook(unsigned long addr)
> =09} else if (user_orig_addr < TASK_SIZE) {
> =09=09bug_type =3D "probably user-memory-access";
> =09=09orig_addr =3D user_orig_addr;
>-=09} else if (addr_in_shadow((void *)addr))
>+=09} else if (addr_in_shadow(tagged_addr))
> =09=09bug_type =3D "probably wild-memory-access";
> =09else
> =09=09bug_type =3D "maybe wild-memory-access";
>--
>2.52.0

