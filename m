Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349CA22256F
	for <llvm@lists.linux.dev>; Fri, 16 Jan 2026 13:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569101; cv=none; b=EGqkW4RQPlIZkKU+7IiFTlLTDYdavOhk6lFzLQLHPHq6RNFhfaeGro0SBNxMSYh8UjpfdkXAbKF+Pe4yU5LCSakS2eMTOeChRxfD6hP6o7AE6yBeAfAA8ObUEZ2Hy3eVsHfRy9p3cl9Z/E2ZZpYxuPnYrIIghoOBwrNw4zeNqq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569101; c=relaxed/simple;
	bh=gA5Gcwjt++Ugz1oA1ig1zUCPtcY1thD7Vg+WwWrpi54=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cndDOQU5IFxILaxaK8xeISc5rxpU5yeCkETLlqaYEKv+0hy7ox56TGwkb4Bb6GOIIQnofm42OzsRqT3fXTzQOAKAW/MRrY3WJa3pNud0MG6ibrUfYYqa0VFkOJADnCjKBrosgyZEuh9OJqiJKpStdF4ZrrT1sB5j1hNsshLcNvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=NsW4vNWI; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="NsW4vNWI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768569098; x=1768828298;
	bh=VUy6Z0nl3UN06uLRlgqbdTzfRq3/0KilXmceKHyT+FA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NsW4vNWI+sy+jtCwGEepBnQnhkRgbVqOJ8bQNyN7XOu/Bmiv5eUFHRTgDUqIkkZCL
	 3+CCEPXQsQCOIr68mCMChffW/v/xa4NXARE65ARAC1tUdbbVCR0YM/VVD87fT5Hnf4
	 g7uTiInwCUmOnfHiNaRH18bYdqK3XZUA8thcmHVBaNFZ6vrtQYXmnYyJGmjtUTL/eI
	 FeJuldGwl9Kv2xapCx8JUTWPf6JHyDRUjGnR9+bb0IaoSyvCU0fdqXQw8ZvrndtD8c
	 iztvGbaWNit1drtUSc0hgFnX7xkOB7r9nmg0mEFIctA/zk1M/dLih3b+MPcDkmHT6E
	 fi3T+X+l0xZ7Q==
Date: Fri, 16 Jan 2026 13:11:32 +0000
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Samuel Holland <samuel.holland@sifive.com>, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH v8 01/14] kasan: sw_tags: Use arithmetic shift for shadow computation
Message-ID: <aWo31aytvelldfiE@wieczorr-mobl1.localdomain>
In-Reply-To: <2592f303-05f5-4646-b59f-38cb7549834e@gmail.com>
References: <cover.1768233085.git.m.wieczorretman@pm.me> <4f31939d55d886f21c91272398fe43a32ea36b3f.1768233085.git.m.wieczorretman@pm.me> <2592f303-05f5-4646-b59f-38cb7549834e@gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 3ed341666d06b561ea7c217cda5b5d4311dd5d20
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for looking at the patches :)

On 2026-01-15 at 23:42:02 +0100, Andrey Ryabinin wrote:
>
>
>On 1/12/26 6:27 PM, Maciej Wieczor-Retman wrote:
> =20
>> diff --git a/mm/kasan/report.c b/mm/kasan/report.c
>> index 62c01b4527eb..b5beb1b10bd2 100644
>> --- a/mm/kasan/report.c
>> +++ b/mm/kasan/report.c
>> @@ -642,11 +642,39 @@ void kasan_non_canonical_hook(unsigned long addr)
>>  =09const char *bug_type;
>> =20
>>  =09/*
>> -=09 * All addresses that came as a result of the memory-to-shadow mappi=
ng
>> -=09 * (even for bogus pointers) must be >=3D KASAN_SHADOW_OFFSET.
>> +=09 * For Generic KASAN, kasan_mem_to_shadow() uses the logical right s=
hift
>> +=09 * and never overflows with the chosen KASAN_SHADOW_OFFSET values (o=
n
>> +=09 * both x86 and arm64). Thus, the possible shadow addresses (even fo=
r
>> +=09 * bogus pointers) belong to a single contiguous region that is the
>> +=09 * result of kasan_mem_to_shadow() applied to the whole address spac=
e.
>>  =09 */
>> -=09if (addr < KASAN_SHADOW_OFFSET)
>> -=09=09return;
>> +=09if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
>> +=09=09if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0ULL)) ||
>> +=09=09    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
>> +=09=09=09return;
>> +=09}
>> +
>> +=09/*
>> +=09 * For Software Tag-Based KASAN, kasan_mem_to_shadow() uses the
>> +=09 * arithmetic shift. Normally, this would make checking for a possib=
le
>> +=09 * shadow address complicated, as the shadow address computation
>> +=09 * operation would overflow only for some memory addresses. However,=
 due
>> +=09 * to the chosen KASAN_SHADOW_OFFSET values and the fact the
>> +=09 * kasan_mem_to_shadow() only operates on pointers with the tag rese=
t,
>> +=09 * the overflow always happens.
>> +=09 *
>> +=09 * For arm64, the top byte of the pointer gets reset to 0xFF. Thus, =
the
>> +=09 * possible shadow addresses belong to a region that is the result o=
f
>> +=09 * kasan_mem_to_shadow() applied to the memory range
>> +=09 * [0xFF000000000000, 0xFFFFFFFFFFFFFFFF]. Despite the overflow, the
>                  ^ Missing couple 00 here
>
>> +=09 * resulting possible shadow region is contiguous, as the overflow
>> +=09 * happens for both 0xFF000000000000 and 0xFFFFFFFFFFFFFFFF.
>                                  ^ same as above

Hah, right, thank you!

>
>> +=09 */
>> +=09if (IS_ENABLED(CONFIG_KASAN_SW_TAGS) && IS_ENABLED(CONFIG_ARM64)) {
>> +=09=09if (addr < (unsigned long)kasan_mem_to_shadow((void *)(0xFFULL <<=
 56)) ||
>
>This will not work for inline mode because compiler uses logical shift.
>Consider NULL-ptr derefernce. Compiler will calculate shadow address for 0=
 as:
>      (((0x0 | 0xffULL) << 56) >> 4)+0xffff800000000000ULL =3D 0x0fef8000.=
...0
>Which is less than ((0xFF00...00LL) >> 4) +  0xffff800000000000ULL =3D 0xf=
fff800...0
>So we will bail out here.
>Perhaps we could do addr |=3D 0xFFLL to fix this

I suppose it should work; tried it in a python script by shoving various
addresses into this check. Pushing addresses through a logical shift
memory_to_shadow normally would return early as you noticed, and after 'add=
r |=3D
0xFFLL' it seems to work as expected. And I didn't really catch any incorre=
ct
address slipping by this scheme either. Thanks, I'll correct it.

>
>> +=09=09    addr > (unsigned long)kasan_mem_to_shadow((void *)(~0ULL)))
>> +=09=09=09return;
>> +=09}
>> =20
>>  =09orig_addr =3D (unsigned long)kasan_shadow_to_mem((void *)addr);
>> =20

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman

