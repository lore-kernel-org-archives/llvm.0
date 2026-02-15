Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E73F30B50D
	for <llvm@lists.linux.dev>; Sun, 15 Feb 2026 22:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771195442; cv=pass; b=ju6aBiEwJxynFzSbpcQ10m71yTcND1x2VGYr1R7I3Ig41fnqsSzHHZvQAmPZcXEjZL58IC+0YWlT4HPsS9gv0uqvpeRMpUqDHo9HCqKWoisNB7dRLsO3io3evN4p/VfZiWSvVEEM3DlKOb21gVPGOu3h32MOCAXDutEF2UkA5YI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771195442; c=relaxed/simple;
	bh=ngsQMkcF1L2VMlRAnjAf6Exsx6O6gflGQN8GKiNEV7M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ONdoklzrIr4fnsP6igAGcPKTAZGKkE7GvV8sxf8IXQs/v1zVzG1lK+XvW0FeNMZNQBGMT/K4q84sv+CiRMY24KrpYDrf3IUmWjYfW91JTZhXHUUhrwwXr7aJmh/Y0Qd4xjnnDMWLgvoQ0ZM/vLlYkOewHo8zM6x+3o6HZvezAdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JbuHVIVt; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JbuHVIVt"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12732165d1eso2857542c88.1
        for <llvm@lists.linux.dev>; Sun, 15 Feb 2026 14:44:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771195441; cv=none;
        d=google.com; s=arc-20240605;
        b=XRt75ANyoeYevrsde3iEozJZHVeljbag74Rz0tSNfYWviXXxfqBaGTnvKiAEQXi9Bn
         MFms2Geg8zJmVVid1wgXIrajvDgOyzL0YH7MHO6kJEsubpJQjiGCouVPnbnpKAKhIbSe
         nqm2Nny5ma08mpoNYTGsNjyXpvZIHkYV99ticITIgwT41JeCdqT+NmOzAoeZphTnPSrI
         yAQhGdeoD7FpiKa5s9az+1vgEyd3ixAIpL+SMIwiBhzPeB90wkhJ16AtuYXMys3JHqPr
         PEOMFKekg3tdMrREQ+eeXm5wzQjep1ck71jDQcLC9NtdehiPPM6cY0gg26JOoLRphNKj
         f5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DQ3rRaBtgDo34CiHTAoGJ75xyh2mchJExm9ydDgm07U=;
        fh=tR1qYRnhmXhqj0ghj6cqIcumEQ3zmjjTxHS+dD7a3Qg=;
        b=G/3C4omqhR/P3+aLxMuZrYKq7FyepqU9jnK/fSm6geIARSbcHvS079OR8fBUHG4WFx
         3vh7V9Rl9sDiDOBZObsKrBz+r2iUgL1fn6UcK8nTWNwsDWcO6YMAtK+DXS0FCJCPzZPt
         p43wsDWMxY2K50zAnkf/cKyXyGv/MYzRnVLiTTE9x4HXF+X0aW/5KHRkAgtGcTGGhGgy
         ILT3dY+vPqZ69NAtq+UHUaGZi6QF+gkMfMVQ+9MYTUOEAGTRmGjQYJNfkm7KZGfGU8Cz
         vPCtrWScPZPE5nrHcbl4gL1LP3sSQwO79EN4nQakv92fKSK+BhLexuX9D8BlN/0mPHxc
         Y9zQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771195441; x=1771800241; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DQ3rRaBtgDo34CiHTAoGJ75xyh2mchJExm9ydDgm07U=;
        b=JbuHVIVtOV7WE6RKPth/aYYsjDhl97nyGVGmRGHDn3Lwlqlzkrg+ZwK2uCy6j5QLYC
         pMi7Qc4xvrp3vw1Xq/XiefOIAZO1G6+L1IEY75EIQBZMVTkfnSFQWOy/PyIZGSsOCDEM
         4nUAxDh9fZfYhWYyJq5SCR0w1NDxb/oik2ozeBhQQQiVncGzu+MCpIISAvEcYz8yFiTR
         Q5Of6g6gG2vem/9FMtUhNYVyVPxqTFF3eVjVLbQAkf/OEKsy3SxoyxR8J0Yf5o/IyRZh
         HXPdG8Pz/2d1oCFtOCtkFOgEKdCno4Rz3yO8G3lF8nXmPdu5RDA7Mn4ncxmU+7qOQj/H
         oPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771195441; x=1771800241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQ3rRaBtgDo34CiHTAoGJ75xyh2mchJExm9ydDgm07U=;
        b=ZZBbnjulKlTUScjBfQLgy9gDTR11XiMPbSDPb23/I/6OT1uW8JBjon/WfWAqqd+3he
         AeLaG8tws+wN1EAyMlCSiigZPOjMmPw14EIUggoVZgurWDG3T7tg7sGGualUuKmrim2K
         T+gTxm2Hgih/C/bsLxI4BI+CChgWU+AsJlnxThIU+Ysj4diHI3h4frDZcTUacPUGg6JC
         78Xcrqs8t+pVvGxjNoApSzeQ1P5Vsc0oRtyreEQ4056ILUoTAzCiuAZf2u2rJYW2ncyE
         NIBCvJxHwXhiuijYNz/0SdpttS9ecv7lR60pRHe9axZfPRW8LqChm1BFJoFCeVsIyQHs
         It4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmWR9ykwk7L4Gd1RTIvd5jFUmZuTvtd7QYlOVHjJJTdZRSNAC2+vZ/hcPxPDHtb9v3T1JD@lists.linux.dev
X-Gm-Message-State: AOJu0Yxipa3MYMmRGTB3BCPW6dtLbEO39aSIcHQxnLoowbEFzB6+oVbm
	gScAV+Wwe5fasfOiOwdxkRlZ693wCPNy7rO7BH8i95q990eyRCK5WB3cjdB9crvG0DL6m3gixo7
	z9vchCIB0m3GNuLtekkqC4S1e8BiXER3ILXjmom9n
X-Gm-Gg: AZuq6aJ3am6zuHnbHZpqxiQhG+JA9k9tN6KEYgGWb0tyYLVK26XILhEwBiPC6bczxhi
	PtubA813Lunfy/ktB276J6+sgdSRyiwrtvrr26fl2LRjUlovnjGo99dF4cLewFWltLP2MRZ2gM4
	oX6YgLTp4TbrbGuSCedMVw9K5z0Rr8wJhujgG0N3ejhVV+k1bUXf+IQNxOeOAaqJRyBBLVIARSm
	efPqH/hwGCbpZ2D2W9uaXZqfRBRB60caIHoxt8SfPvpotclSbM2EmcwXg74ffwQBdKmyQVc1Aav
	kNs40eS1lKYm6OdaueqFtbzDwZXkrIg5Y1uDOrc=
X-Received: by 2002:a05:7022:a91:b0:119:e56b:98ba with SMTP id
 a92af1059eb24-1273ae7fc16mr4205375c88.33.1771195439998; Sun, 15 Feb 2026
 14:43:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com> <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck> <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck> <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
 <20260204131400.GI2995752@noisy.programming.kicks-ass.net>
 <aYNUmEfDzq7lTFFr@willie-the-truck> <CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
 <20260206182650.6c21b0ff@pumpkin> <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
 <20260215221656.68b2fc1d@pumpkin>
In-Reply-To: <20260215221656.68b2fc1d@pumpkin>
From: Marco Elver <elver@google.com>
Date: Sun, 15 Feb 2026 23:43:23 +0100
X-Gm-Features: AaiRm50d6YTpHKKBiQ4mtNRHtPJdcnhrxF0-oPOmS5yiyJGTDd92Ajz2-UQXuHY
Message-ID: <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Feb 2026 at 23:16, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Sun, 15 Feb 2026 22:55:44 +0100
> Marco Elver <elver@google.com> wrote:
>
> > On Fri, 6 Feb 2026 at 19:26, David Laight <david.laight.linux@gmail.com> wrote:
> > > On Fri, 6 Feb 2026 16:09:35 +0100
> > > Marco Elver <elver@google.com> wrote:
> > >
> > > >  On Wed, 4 Feb 2026 at 15:15, Will Deacon <will@kernel.org> wrote:
> > > > >
> > > > > On Wed, Feb 04, 2026 at 02:14:00PM +0100, Peter Zijlstra wrote:
> > > > > > On Wed, Feb 04, 2026 at 11:46:02AM +0100, Marco Elver wrote:
> > > > > > > On Tue, 3 Feb 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
> > > > > > > [...]
> > > > > > > > > > What does GCC do with this? :/
> > > > > > > > >
> > > > > > > > > GCC currently doesn't see it, LTO is clang only.
> > > > > > > >
> > > > > > > > LTO is just one way that a compiler could end up breaking dependency
> > > > > > > > chains, so I really want to maintain the option to enable this path for
> > > > > > > > GCC in case we run into problems caused by other optimisations in future.
> > > > > > >
> > > > > > > It will work for GCC, but only from GCC 11. Before that __auto_type
> > > > > > > does not drop qualifiers:
> > > > > > > https://godbolt.org/z/sc5bcnzKd (switch to GCC 11 to see it compile)
> > > > > > >
> > > > > > > So to summarize, all supported Clang versions deal with __auto_type
> > > > > > > correctly for the fallback; GCC from version 11 does (kernel currently
> > > > > > > supports GCC 8 and above). From GCC 14 and Clang 19 we have
> > > > > > > __typeof_unqual__.
> > > > > > >
> > > > > > > I really don't see another way forward; there's no other good way to
> > > > > > > solve this issue. I would advise against pessimizing new compilers and
> > > > > > > features because maybe one day we might still want to enable this
> > > > > > > version of READ_ONCE() for GCC 8-10.
> > > > > > >
> > > > > > > Should we one day choose to enable this READ_ONCE() version for GCC,
> > > > > > > we will (a) either have bumped the minimum GCC version to 11+, or (b)
> > > > > > > we can only do so from GCC 11. At this point GCC 11 was released 5
> > > > > > > years ago!
> > > > > >
> > > > > > There is, from this thread:
> > > > > >
> > > > > >   https://lkml.kernel.org/r/20260111182010.GH3634291@ZenIV
> > > > > >
> > > > > > another trick to strip qualifiers:
> > > > > >
> > > > > >   #define unqual_non_array(T) __typeof__(((T(*)(void))0)())
> > > > > >
> > > > > > which will work from GCC-8.4 onwards. Arguably, it should be possible to
> > > > > > raise the minimum from 8 to 8.4 (IMO).
> > > >
> > > > That looks like an interesting option.
> > > >
> > > > > That sounds reasonable to me but I'm not usually the one to push back
> > > > > on raising the minimum compiler version!
> > > > >
> > > > > > But yes; in general I think it is fine to have 'old' compilers generate
> > > > > > suboptimal code.
> > > > >
> > > > > I'm absolutely fine with the codegen being terrible for ancient
> > > > > toolchains as long as it's correct.
> > > >
> > > > From that discussion a month ago and this one, it seems we need
> > > > something to fix __unqual_scalar_typeof().
> > > >
> > > > What's the way forward?
> > > >
> > > > 1. Bump minimum GCC version to 8.4. Replace __unqual_scalar_typeof()
> > > > for old compilers with the better unqual_non_array hack?
> > > >
> > > > 2. Leave __unqual_scalar_typeof() as-is. The patch "compiler: Use
> > > > __typeof_unqual__() for __unqual_scalar_typeof()" will fix the codegen
> > > > issues for new compilers. Doesn't fix not dropping 'const' for old
> > > > compilers for non-scalar types, and requires localized workarounds
> > > > (like this patch here).
> > > >
> > > > Either way we need a fix for this arm64 LTO version to fix the
> > > > context-analysis "see through" the inline asm (how this patch series
> > > > started).
> > > >
> > > > Option #1 needs a lot more due-diligence and testing that it all works
> > > > for all compilers and configs (opening Pandora's Box :-)). For option
> > > > #2 we just need these patches here to at least fix the acute issue
> > > > with this arm64 LTO version.
> > >
> > > Option 3.
> > >
> > > Look are where/why they are used and change the code to do it differently.
> > > Don't forget the similar __unsigned_scalar_typeof() in bitfield.h.
> > > (I posted a patch that nuked that one not long ago - used sizeof instead.)
> > >
> > > The one in minmax_array (in minmax.h) is particularly pointless.
> > > The value 'suffers' integer promotion as soon as it is used, nothing
> > > wrong with 'auto _x = x + 0' there.
> > > That will work elsewhere.
> >
> > Agreed that getting rid of __unqual_scalar_typeof() in favor of 'auto'
> > where possible is the way to go.
> >
> > Unfortunately I spent the last week occasionally glancing at this
> > arm64 READ_ONCE problem, and could not come up with something that
> > avoids using typeof_unqual() or __unqual_scalar_typeof(). I'm inclined
> > to go with the unqual_non_array hack, but not make this available as a
> > macro for general use - we have too many of these horrid macros, don't
> > want to add more to this hack pile.
>
> Agreed, having to do such things inside what are already horrid 'functions'
> is one thing, but when they get used in 'normal' code it is silly.
>
> Have you checked whether sizes other than 1, 2, 4 and 8 are ever used?
> There aren't any in an x86-64 allmodconfig build and it used to be an error.
> Even if there are handful, having to use a different define wouldn't
> really be an issue.
> Removing that support would make READ_ONCE() easier to write/understand
> and (hopefully) compile faster - there is a measurable cost for the
> 'size check' in the x86-64 build, the arm LTO expansion must be significant.

I found e.g. xen_get_runstate_snapshot_cpu_delta() uses the >8 byte
case via __READ_ONCE(). READ_ONCE() itself is already restricted to <=
8 bytes (due to that static assert), but that itself uses the
__READ_ONCE() helper which these patches were touching.

We could invert the game: have READ_ONCE() which just deals with <= 8
bytes. And __READ_ONCE() which uses READ_ONCE() if <= 8 bytes, and the
non-atomic case if >8 bytes. However, I fear the static size check
won't go away because the asm-generic version of __READ_ONCE() happily
works on any type (it's just a volatile cast+deref) - I don't know how
we'd enforce the size limit otherwise.
