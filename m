Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F75B302CC6
	for <llvm@lists.linux.dev>; Tue, 18 Nov 2025 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763465834; cv=none; b=tj/TQlxGQTBKF/rixXqX0mHctMG9OwejlsPPM9ZmaB0ZULF1V5OlXkIVkU2/xJof5dO4ZKWYbwPQAVRpltWjJSc6KFGf/X6TvLyhd3VmQlpD7Y7fSZzB7yqI/YxYi8N0l1arK8Klfv2X/r4P5AT+z/fMkT1/wjJz/OEChh5q2Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763465834; c=relaxed/simple;
	bh=oIEKShPj8LhZa0LzPnG+pc1whx8d811sljdY12ZVdWg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bBdSdOkU4Mlx+6WLUIlqSQQnqj7L/lTP6khoqRVPvgZZnTwW3tI9LgAwNwu+Deqess7qXK3toNwfkla6dHk1ej+19UBPHTMJbEo5nBz4boxj6I8pXnmhj7BMx9pVALF/O7s0DeQkwuLXw/MAwYSvI55kU9Cm85LYgOfHoZLYl9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=A62qJ3HV; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="A62qJ3HV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1763465822; x=1763725022;
	bh=DE/tg0nJoToaNRa0UqK6uA3/ue+ZalTDQdxOe/ZUB5I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=A62qJ3HVc/QcFo3EtY8f3xbhHwUHHS73FKrm5NfXWUzkSzKMpPSlwVVOHMs992Ntn
	 TcokQ5u/tjEK627OMqjj1qaY5+gMYz7abk+5IQtsTR5DpJNASN32IN8GYdQFZXhy0a
	 smfh1qEFWDrtY7OlyebMVnAL+/VMy8ImKJ0FQo1No/NbT/jAQge7GNBbsmuIBua3Fk
	 PGJaIMpARX4R4JEW8jciC+zf0IJqnbjhtwItFaSaJl1JYRXvtNbWPPHsQf1MxD4yLR
	 TuRDUrxA0XL2uIIrSikjiLnz8S4JKgtyCgzLxEoQVqgZh5/J/YPxSzVSiUDoEzwexX
	 2rOnoL0lhYHzQ==
Date: Tue, 18 Nov 2025 11:36:54 +0000
To: Alexander Potapenko <glider@google.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, ardb@kernel.org,
	Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 14/18] x86: Minimal SLAB alignment
Message-ID: <wzxmteswfsj3idgwyai7m3ou7kulfmxerxkq56xfhoqhvpz3tq@omy5z7eb3esp>
In-Reply-To: <CAG_fn=W033hGM7_jnj0irwW0gc6McLw2nbhfZROWfieqKTxVdQ@mail.gmail.com>
References: <cover.1761763681.git.m.wieczorretman@pm.me> <0ca5d46e292e5074c119c7c58e6ec9901fb0ed73.1761763681.git.m.wieczorretman@pm.me> <CAG_fn=W033hGM7_jnj0irwW0gc6McLw2nbhfZROWfieqKTxVdQ@mail.gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 91807d56d4653d1f85cedcda318ac58c40da2783
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-11-10 at 18:48:35 +0100, Alexander Potapenko wrote:
>> diff --git a/arch/x86/include/asm/cache.h b/arch/x86/include/asm/cache.h
>> index 69404eae9983..3232583b5487 100644
>> --- a/arch/x86/include/asm/cache.h
>> +++ b/arch/x86/include/asm/cache.h
>> @@ -21,4 +21,8 @@
>>  #endif
>>  #endif
>>
>> +#ifdef CONFIG_KASAN_SW_TAGS
>> +#define ARCH_SLAB_MINALIGN (1ULL << KASAN_SHADOW_SCALE_SHIFT)
>
>I don't think linux/linkage.h (the only header included here) defines
>KASAN_SHADOW_SCALE_SHIFT, does it?

I revised all the x86 and non-arch places where ARCH_SLAB_MINALIGN is used =
and
all these places also include linux/slab.h which does include
KASAN_SHADOW_SCALE_SHIFT. So there are no cases where it's undefined.

The minalign makes sense defined here but including kasan headers causes
compilation errors all over the place. And I don't think moving
KASAN_SHADOW_SCALE_SHIFT here makes much sense?

