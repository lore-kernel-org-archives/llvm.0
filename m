Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E4619DF8C
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 18:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865688; cv=none; b=IYLvSHSk+K29W1X27fWQiD6bBw7rGLei+7fR/yhATm6Dw1Jnuo3os6Jm0n8OrNQsUYwAStL3p5VqWasMrd9DbNHQrIolDgFmqMlxL6xxB6wegzrbYknIiCiXllDVWe0Nfyc7yAceTfRJs4+BkFl1yW9Ue6wr9trpz1wrkBUtmKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865688; c=relaxed/simple;
	bh=wTbbT4CsuJ/iXGmiqeOEuQTztaWXsApJ6CIEHLfEbjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fuqsLE7Gl2bMVGt2HJdN1Q5vB6QWqwunXmVVSeqjIdqyN0qYsRZNJas9We0SKz+tfqg3ppp+4q+04lubv0CZQvyyPgryTF9euZx5/eewi05ouMKt4YtPk+N9c5ypdKrclOlUB30ZeuJFBahoj1s6wa+Jd1zKqMhWgCXPr99oDx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHSpAy2F; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHSpAy2F"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43622267b2eso12494515e9.0
        for <llvm@lists.linux.dev>; Thu, 06 Feb 2025 10:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738865685; x=1739470485; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTbbT4CsuJ/iXGmiqeOEuQTztaWXsApJ6CIEHLfEbjE=;
        b=cHSpAy2F0Zw1VKGnXjsqaBPVXU2Cdst7tOYOBdOsi7Y4BROCxDm7xqYDZev9H4t31f
         /WtZ7oW2nefvz7cORtxq7BsVXUyhrgjRfivCBdipsyyYXQQKfHSB9tdS0iNVIRJzDWaM
         YlwByWsiEIVzvQ7D4d6TXcK5OpbCi786T9MyP+1afvJCXrLinSm3G+p71BCrpW7RvT/q
         jnXBHIC4g9GITVq1gnirQiKOGNykbamskmxInlqcSMrQup5cMwyroRfDBlHlI4M5ZVL8
         REPXBSM2SawIYhG68ED80s3QJLtf3sUkm/K1hfY7XE8r6J4YAt/DDkELMgDL84e21CTZ
         DYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865685; x=1739470485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTbbT4CsuJ/iXGmiqeOEuQTztaWXsApJ6CIEHLfEbjE=;
        b=Jwn7fnYMqkE6zllI7gTR1wrxDnG5jJueq8jA8GmnTm6bZTgWXowlmig03nmUflUyAF
         3OTDbyMTOa+++0ItDqJIyFiaq0TRzSZaR5r4Sd7eDuu4oT5z5/Ts5g0dp2ZG36+0EIzI
         czSGABvvwONVPxl1jLMGA/QoUY0jo1GVZntqQ8XkGKClAbaoIfFPsKWHZmt7rrIFhSLt
         kPh4NQE2ZQktQMdKecvHqtsHHM4ZysF8ZrtoFDH5V+mOcEVy7qADDt5HCHtnu1x1vKrM
         yr4aqCA+5SOq0yYe0t/mT3ovf5EKo+LlbYQbhGktrGxvRWnnuIIz3+yMgnsyniLH1dxd
         4oxA==
X-Forwarded-Encrypted: i=1; AJvYcCWykFLj/fs+vCnIVm805ILvMSvxvhYRve708pDqJysfYym+AvsDjkhsWpo7i9qY2RtN15iW@lists.linux.dev
X-Gm-Message-State: AOJu0YxMNidp9Pc+c1/OZXuanl/RCawj66UGLG2Pbil4YG2xfPCmYXtQ
	Z/TlfUECFIHn+vc/e7EJQEqpbs/K7EVZYks9bPwoUY+WSYyZOm/ehxn6lP23bfPN5kcb7Pni6B1
	LGA8hRRODKOHwGt/CrnkL4vz2PgY=
X-Gm-Gg: ASbGncvMAvdUj0Zc+zKaefrXfYbWjZZscK4FpemH6mUGvL1nbWEj/LTxfVGzhaKhPsR
	Epekw1SWzSQfZbv95Nb6S2SAlrh+s0Hfj0bFmTkgTw09rYqXjIOQIZFYFCWr+4hVfy998Tyxjww
	==
X-Google-Smtp-Source: AGHT+IHBkaKzKisMLjhYNPQEk4vOcutkS0bItT/CuWo+2lyB11rB/+L1N95UZJSHFEtHE7FQsPK4hkaRlaOSWfeGMWw=
X-Received: by 2002:a05:6000:1acc:b0:38d:c2ef:e291 with SMTP id
 ffacd0b85a97d-38dc2efe475mr1873314f8f.39.1738865684758; Thu, 06 Feb 2025
 10:14:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <808cc6516f47d5f5e811d2c237983767952f3743.1738686764.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZd3sP1_x2c5FvztA6LzsBY3Fq3cD5cJ6FQ+FAnmawe06Q@mail.gmail.com> <zwug3yr7p7x7276g5tpwsvuxefkxn2pwggozgq7krdaquqktc5@eefn3vi3tynu>
In-Reply-To: <zwug3yr7p7x7276g5tpwsvuxefkxn2pwggozgq7krdaquqktc5@eefn3vi3tynu>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 19:14:33 +0100
X-Gm-Features: AWEUYZmr-sZ7H7rQ5pJvdgslU5r_pD-83ZAYiTMD0XxDDSXEdCYqWWqGvarMkGQ
Message-ID: <CA+fCnZfsT3jO96rewM3wZw7n4hHJ44wRDG8g_55NFS5VG34grg@mail.gmail.com>
Subject: Re: [PATCH 01/15] kasan: Allocation enhancement for dense tag-based mode
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com, 
	palmer@dabbelt.com, tj@kernel.org, brgerst@gmail.com, ardb@kernel.org, 
	dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
	akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, dvyukov@google.com, 
	richard.weiyang@gmail.com, ytcoode@gmail.com, tglx@linutronix.de, 
	hpa@zytor.com, seanjc@google.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, justinstitt@google.com, jason.andryuk@amd.com, 
	glider@google.com, ubizjak@gmail.com, jannh@google.com, bhe@redhat.com, 
	vincenzo.frascino@arm.com, rafael.j.wysocki@intel.com, 
	ndesaulniers@google.com, mingo@redhat.com, catalin.marinas@arm.com, 
	junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com, 
	dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com, 
	dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, 
	peterz@infradead.org, cl@linux.com, kees@kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 1:58=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >Is there a reason these definitions are added to
> >include/linux/kasan.h? At least within this patch, they are only used
> >within mm/kasan, so let's keep them in mm/kasan/kasan.h.
>
> Parts of x86 arch use these later (minimal slab alignment, kasan shadow s=
tart
> address) so I thought it was convenient to already have it in place here?

AFAICT, KASAN_SHADOW_START only relies on KASAN_SHADOW_SCALE_SHIFT,
which is defined arch/x86/include/asm/kasan.h anyway.

And ARCH_SLAB_MINALIGN is defined in asm headers, so the definitions
from include/linux/kasan.h shouldn't be visible to it?

I think that we need to do is to define KASAN_GRANULE_SHIFT next to
KASAN_SHADOW_SCALE_SHIFT for x86 and then use it in mm/kasan/kasan.h
to define KASAN_GRANULE_SIZE for SW_TAGS. (Similarly as with arm64,
where ARCH_SLAB_MINALIGN depends on either KASAN_SHADOW_SCALE_SHIFT or
MTE_GRANULE_SIZE, both of which are defined in arm64 asm headers.)

Btw, I think ARCH_SLAB_MINALIGN needs to be defined in
include/asm/cache.h: at least all other architectures have it there.

> Since I'll be reordering patches I can just move these changes together.

Otherwise, if you need to expose something new in
include/linux/kasan.h, please do it together with the change that uses
it. Or you can even put it into a separate patch with an explanation
of why it's required - at least from the review perspective having
separate smaller patches is often better.

In general, if something doesn't need to get exposed to the rest of
the kernel, keep it in mm/kasan/kasan.h.

> >I think this should also depend on KASAN_OUTLINE: Clang/GCC aren't
> >aware of the dense mode.
>
> I wasn't sure I fully understood how inline/outline interacts with clang/=
gcc on
> x86 (especially that I think some parts are still missing in x86 clang fo=
r
> tag-based KASAN). So I understand that compiling with inline doesn't do
> anything? If so, is it not doing anything because of missing compiler cod=
e or
> something in the kernel?

With inline instrumentation, the compiler directly embeds the
instructions to calculate the shadow address and check the shadow
value. Since the compiler assumes that one shadow byte corresponds to
16 bytes of memory and not 32, the generated instructions won't be
compatible with the dense mode. With outline instrumentation, the
compiler just adds function calls and thus all the shadow calculations
are performed by the C code.

Or did the dense mode work for you with KASAN_INLINE enabled? I would
expect this not to work. Or maybe the inline instrumentation somehow
got auto-disabled...

> >Would it be possible to move this part to kasan_poison_last_granule()?
> >That functions seems to be serving a similar purpose but for the
> >Generic mode.
> >
> >It might also be cleaner to add a kasan_poison_first_granule() that
> >contains the if (addr64 % KASAN_SHADOW_SCALE_SIZE) check.
> ...
> sure, I'll try to move these checks to kasan_poison_first/last_granule.

For kasan_poison_last_granule(), I think the change makes sense. For
kasan_poison_first_granule(), please check whether it gives any
readability benefit - if kasan_poison() is the only caller, maybe
adding another function is not worth it.
