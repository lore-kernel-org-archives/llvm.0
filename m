Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5FF379C57
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 20:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785531237; cv=pass; b=m8ga1M+JCYbkMN+bjRG57T2ZhhZDyoP0VIXj8y4JiqnGxOzEoxL7J2R4jbjR28k0XNV581euypoEakrJed6aXEfK3V2ogUh/b/C/+x2JQXZ4WQ0yC1BiaMhZKuYBnkRELLmX5mo6QU+qZ8G3BqnV0uqhYvYgKGtUoese4/nhUfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785531237; c=relaxed/simple;
	bh=8WgnG/ocMJxL8PTAiRMbu9vJvh0/e1L2a9aK5+bzYSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eow1awb1DvQrxt/mCBcdpWI5J5NctDu7Aj0ZUl0ShUdF7lytoKUBbjSXrQwUKRSlDUeopCgbV9/JAU1px61OTp20bipQhtVVPSvzvysUJOnpHrEzVmoxoefLE7zlcnISqrN3lifPq2O4XwFipz3yPc7qTyhg6CSGEwJ4g1tr4dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NPKrAOiJ; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NPKrAOiJ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-698411099d6so4189a12.0
        for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 13:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785531234; cv=none;
        d=google.com; s=arc-20260327;
        b=o56uF/NZkq1RRwcGyL0blhNvz6KZWtXgp0UIppfsDUDD9dApJ7QiHOLopCfXUghO/L
         0cNebzZk7DHg557WHQjwMM5oeLf4+f70gfYXRLJ/RyUyP0ZHVOHkW+PNe153nUKq/lMp
         sVo3FRi8o66xTpnfG/VlYRISf0JyMFZmgDEkJvdhHbHwVO8l0aAJN24hrQid5EavL0se
         ITbN9L+tXBs9tA8QjAf9eCkBAKbxw29P6xpNRJDsWdWfpOKMbORP6s4gi2QUpm/R/V9/
         mhttMuU6MTzCDtHLUqLrtA6wNqH2BskNH7op094prnbdqZW8aHo9xwOrecTpX0YtHcbY
         G4Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LYYbCM5Z5L2y6odgvTOF9JoOhv0Ve+9ZD5jAbiezzIM=;
        fh=FQ/QCt80IFB6IFzX/T3trff3+CLeCVJwg4g1Mq2EqWE=;
        b=K6uyYVsPBOANSsOdYlpV/ehN/B1TAOaoa3LF1fOYJMhXYB1Hc+ADo4xXN7Nbuk7E2u
         7fplpT09/0AoB8JsfEQCHKLSQBGspsVkFOqwt/IdD6F1mR882Mv8otU2aEl0/JQWioqU
         E8RG27FZ99h8u6G6pxQC3oLEJ/LUG3bz0Su4PmDMxquGcHrgQe83GidBfx0xi6cacCiP
         6c+ZZ6oTH4v/LGJ8y+xs4Hqmk8qOJLnFn4/uBFL42J1yDe4eLIkJHJ1i6EFQIQvzYlEH
         0CAyNeR3UAxlzVOslqg02VgnD0Zd8/f7PsUdNCL/dQHT4GLE+lVxnA5LllU8Yxstxr5D
         xcwA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785531234; x=1786136034; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LYYbCM5Z5L2y6odgvTOF9JoOhv0Ve+9ZD5jAbiezzIM=;
        b=NPKrAOiJoB+2MoXJc1kTFSUTmFGCwmTO9XEFHBYDdI4eO3zDSQ7v+gfV6P6kkgUnZg
         SLxzUA3n/6Iwkb5nxt7CK89cUR8k357bzsi40pdxSh7SBJln9H3SH+PCOOs/lK1RCpFF
         8O3YIxiRE5z89201WhAnhPF/IKDyiX0uWjy2cyQdjcZoeBeN4Bi4ANsUAlpVAe2IGkwN
         jJZLgPm8sduq8JhOGlf6/caKsTEh1s+x2Qr6kGssYhZi2KkB0t5sjphQI3kkviIasYJ/
         MsfT89A8oeZ2qG6HnaaR4doFMB/IjSrr4wXNaenWwhpN6fTuAVSK21BWiVgbEvku+ohV
         iqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785531234; x=1786136034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYYbCM5Z5L2y6odgvTOF9JoOhv0Ve+9ZD5jAbiezzIM=;
        b=jqikUxFrYyUy7dxwWuln9gag9v9wrOffkYxSYG3yEGDJhk/XLtuag7r0/1a3YDcyLN
         bsNP9tGYXbQRS1zKyT8RttPzYhVQTAMC2AyKYU9059/s1xMF8cjK9jpW5ZgSAo2/jYvA
         a7WdVPyLx+rCIaLVTGNS1mUBX0m23OjdkKNVqOOUyEuvENYelBpDKw5yePk5FiU//mJM
         bC3M0xhMwKt8zY4Ma9eGOzjb+7/5W6rH1vkqxx3/ScLEjj126BEg5Q2HVJULjvEOKrLr
         HhmhGIh8/EFgrheguizmTNpYFnmKONLWwpE/4LQyGtqOblDzMYbsNYzyhjIZcs3b6Qd3
         im7g==
X-Forwarded-Encrypted: i=1; AHgh+Roh7aNHDWAIza13QShu7mM+ginnF101LvvsPGt88Ap0FDEl4oyq10uGL7C0C+O4UwNzNu17@lists.linux.dev
X-Gm-Message-State: AOJu0YwFoqPAlweB5MFP4B1+kbwT+GucfjR/fqm4E3mqnVAZorhNZjL9
	7cazb27db0mZ3j+Uj3uXmDBLKqQC79oO1BB7MwbCZ+tZ63MRq8UDGHA5T4TDsa7NAiFEPHC6EYW
	JxNR4B7TmRQ87O8zCvnfAPUP4P8qnEAAfnqXkAYG3
X-Gm-Gg: AR+sD10hDJjeSiPHsq7m1XmdCmhbfOeSf9fydKBBjYlDbuO2Kt8Ubi6lFOvMOew8DjM
	r6cRDDZXQIyRPzmnu7gGx1xU2cE8j4egu/50JgsZ9QVzyVh1zR1odcSA0WNhDyanMmB8xIuvVpM
	X+ogz7PTE3gbhwBmUmlYrlFBwlWqflZme8Z83PngWlb+nDg6g6K3mT3JtJ83RQD4BCQGxhdyNay
	dVulBZCwOmlhaayYPJ2778JGQSkP1ihGKb1ziEoCyAnnHOK9oE4LR7AKWph8V+IVDC/J+hU0PaR
	9RcA8R0xPZjIs02FWTMc6s8H5JEl57R2GcW/695bmB7ZAA==
X-Received: by 2002:aa7:d644:0:b0:6a0:11d7:ada3 with SMTP id
 4fb4d7f45d1cf-6a0aeb52cb4mr10178a12.5.1785531233851; Fri, 31 Jul 2026
 13:53:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731-always-inline-list-add-v1-1-d29f54ce5477@google.com>
 <CAKwvOd=6xCKkLLLmSXz1S95jOjRSDGyQbUwp5=yNJeau5q9eJQ@mail.gmail.com>
 <CAKwvOd=44Wjh4b2OH8+GygqWW=rvjy2aX5VKGtaiRRNF5fV7qg@mail.gmail.com> <CAKwvOdn75h+=WYz7edMwXydPKTDY7Emwcy4D2eKF+n=ztG7Q6Q@mail.gmail.com>
In-Reply-To: <CAKwvOdn75h+=WYz7edMwXydPKTDY7Emwcy4D2eKF+n=ztG7Q6Q@mail.gmail.com>
From: Jordan Abrahams-Whitehead <ajordanr@google.com>
Date: Fri, 31 Jul 2026 13:53:16 -0700
X-Gm-Features: AUfX_mwgv4W-o1C8m2Z0RAOfdknzsLSvdX1au_i1QGLIUYUAwU6wo_mwbf5Jjek
Message-ID: <CAB_TaDVcvPLs7marxAWA6fgUr+gJVsqMWJu+rGYfc=cQh3Ay1A@mail.gmail.com>
Subject: Re: [PATCH] Mark list_add and __list_add as __always_inline
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Eric Dumazet <edumazet@google.com>, Kees Cook <kees@kernel.org>, 
	Marco Elver <melver@google.com>, Giuliano Procida <gprocida@google.com>, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 1:36=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Jul 31, 2026 at 1:30=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Fri, Jul 31, 2026 at 1:29=E2=80=AFPM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > On Fri, Jul 31, 2026 at 1:15=E2=80=AFPM Jordan R Abrahams-Whitehead
> > > <ajordanr@google.com> wrote:
> > > >
> > > > This commit resolves an issue where modpost section
> > > > verification fails due to section mismatches between list_add
> > > > and its callers.
> > > >
> > > > At present, list_add (and its internal __list_add) are called from
> > > > both .text and .init code sections. Since inlining can vary per cal=
l
> > > > site, list_add can be 4 different states:
> > > >
> > > >   list_add in text with arguments to non-.init.data values
> > > >   list_add in init with arguments to static .init.data values
> > > >   list_add in init with arguments to non-.init.data values
> > > >   list_add in text with arguments to static .init.data values
> > > >
> > > > It is last instance that ends up causing the section mismatch cause=
d by
> > > > constant propagation of the address of static libs inside the `dir_=
add`
> > >
> > > I think you meant `static __initdata LIST_HEADs`? (not `static libs`)=
.
> > > Maybe AKPM could fix that up for you when applying?
> > >

Apologies, this is a typo, yes. I think I missed it when re-flowing the tex=
t
(and also the slightly janky phrasing here).
Should have been something more along the lines of:

It is this last instance that ends up causing the section mismatch
shown below due to constant propagation of the address of the
static __initdata dir_list head inside of `dir_add`.

The processes for the kernel mailing list are unfamiliar to me,
so uncertain if this typo is worthy of sending a new patch with
an updated message.

> > > > as seen below (with the dir_list being defined statically in
> > > > initramfs.c, resting in .init.data).
> > > >
> > > >   WARNING: modpost: vmlinux.o: section mismatch in reference: __lis=
t_add
> > > >   (section: .text.unlikely.) -> dir_list (section: .init.data)
> > > >
> > > > Because of these section matching requirements, semantically,
> > > > __list_add and list_add MUST be inlined. This will then ensure
> > > > callers inside .init will receive a list_add that exists and refers
> > > > to only .init data, and list_add code in .text sections will only r=
efer
> > > > to non-init data.
> > > >
> > > > This issue manifests predominently in AutoFDO with clang, which is =
very
> > > > hesitant to inline cold functions such as list_add even when marked
> > > > `inline`. Marking them as `__always_inline` therefore matches the
> > > > existing semantic constraints imposed by modpost's section mismatch
> > > > checks.
> > > >
> > >
> > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > > Tested-by: Nick Desaulniers <ndesaulniers@google.com>
>
> I can also find internal reports about this from two other folks;
> worth attributing on the fix IMO.
>
> Reported-by: Giuliano Procida <gprocida@google.com>
> Reported-by: Yabin Cui <yabinc@google.com>
>

Good to call out! Thank you.


> > >
> > > We've been seeing this particularly on Android and ChromeOS while
> > > trying to enable AutoFDO, which seems more likely to outline cold
> > > code.  include/linux/init.h defines __init as __cold.
> > >
> > > I saw no change in size for x86 defconfig; enabling
> > > CONFIG_LIST_HARDENED resulted in a change of a few bytes (i.e. less
> > > that 0.01%).  I assume we don't care as much about the size if
> > > CONFIG_DEBUG_LIST is set.  Checked with bloaty and
> > > scripts/bloat-o-meter (thanks to Eric for pointing out that tool in
> > > the linked thread).
> > >
> > > I never heard back from Kees or Marco about their thoughts on this in
> > > relation to
> > > commit b16c42c8fde8 ("list_debug: Introduce inline wrappers for debug=
 checks")
> > > but I wouldn't mind an Ack (or Nack) from at least one of them.
> > >
> > > > Closes: https://github.com/ClangBuiltLinux/linux/issues/2173
> > > > Signed-off-by: Jordan R Abrahams-Whitehead <ajordanr@google.com>
> > > > Suggested-by: Nathan Chancellor <nathan@kernel.org>
> > > > Suggested-by: Eric Dumazet <edumazet@google.com>
> > > > Link: https://lore.kernel.org/all/CANn89iJVQe=3DwedLheJmjZjOTJsWHij=
T0jZs=3DiRxKssJZbjAxHw@mail.gmail.com/
> >
> > Also, I think we might want this applied with:
> >
> > Cc: stable@vger.kernel.org
> >
> > since I believe CrOS saw issues as far back as 6.1.
> >
> > > > ---
> > > >  include/linux/list.h | 15 +++++++++++----
> > > >  1 file changed, 11 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/include/linux/list.h b/include/linux/list.h
> > > > index 09d979976b3b..59f8aa0905d3 100644
> > > > --- a/include/linux/list.h
> > > > +++ b/include/linux/list.h
> > > > @@ -150,10 +150,13 @@ static inline bool __list_del_entry_valid(str=
uct list_head *entry)
> > > >   *
> > > >   * This is only for internal list manipulation where we know
> > > >   * the prev/next entries already!
> > > > + *
> > > > + * Must be inlined to ensure it can be safely called
> > > > + * with initdata arguments.
> > > >   */
> > > > -static inline void __list_add(struct list_head *new,
> > > > -                             struct list_head *prev,
> > > > -                             struct list_head *next)
> > > > +static __always_inline void __list_add(struct list_head *new,
> > > > +                                      struct list_head *prev,
> > > > +                                      struct list_head *next)
> > > >  {
> > > >         if (!__list_add_valid(new, prev, next))
> > > >                 return;
> > > > @@ -171,8 +174,12 @@ static inline void __list_add(struct list_head=
 *new,
> > > >   *
> > > >   * Insert a new entry after the specified head.
> > > >   * This is good for implementing stacks.
> > > > + *
> > > > + * Must be inlined to ensure it can be safely called
> > > > + * with initdata arguments.
> > > >   */
> > > > -static inline void list_add(struct list_head *new, struct list_hea=
d *head)
> > > > +static __always_inline void list_add(struct list_head *new,
> > > > +                                    struct list_head *head)
> > > >  {
> > > >         __list_add(new, head, head->next);
> > > >  }
> > > >
> > > > ---
> > > > base-commit: fc46aed51f6280801f43a2cf4b5060cc33b572f9
> > > > change-id: 20260730-always-inline-list-add-363639606e26
> > > >
> > > > Best regards,
> > > > --
> > > > Jordan R Abrahams-Whitehead <ajordanr@google.com>
> > > >
> > >
> > >
> > > --
> > > Thanks,
> > > ~Nick Desaulniers
> >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
