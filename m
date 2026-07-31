Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BB02BE630
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 20:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785530204; cv=pass; b=on7fi/+KVUDKAKRAYncWsRJ3/DQE86oXcE7O/w1bxZ//Q3Jm9EBpJ2hEg1Nlsp/x9ATMNhIoyMcNJxerpeKcsGDh+zVV4cz0gsgIXGMO+t9lWFHcnzS7k1UDoWbyzn8G7KAo8kDusT9esrcHeh8FrW/j2GM1EnctDt+HzEkKrNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785530204; c=relaxed/simple;
	bh=RyE3J0Y1+7LCKGkS0jntWxTTBz990Qjv/JfMHtBY3A0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJQqv/+yFj2JCWVNQH0rA2UFb3snF8LxM9QxtUx7hX499vJCWV3p/Qz2ErScbcZLM3TRCyTgag5us0CcdfKU6XU7LwY02Uk8AsJPnOr6ClW3TcTs49cWLsgFFf2W9eW3QrFadaMT5OYySfAofc0R5xGqFhP8i4b4PauDA86LuFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A97TcgDD; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A97TcgDD"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1670dad7a8so198599466b.3
        for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 13:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785530201; cv=none;
        d=google.com; s=arc-20260327;
        b=Er8E8w5Gdu54icXtN6s9RtDLED6OrpfkDSB6iykE99/JX84foUK9UZwGJjU/Ls6NFa
         L2BuJ9rSBo0qN6J4XJmB4Hacngp4hN8hhYDj+mDFI4p0ZbiFOQkmc+XI69LcDBLnGyQj
         mL+SpISptv5e0cVApV41bXOm39mLssEVAB7moy0k+anonN/nKrvVQkZ7eHKkpU3hdPF1
         cd4j0STyA2jaiF97q4OqguL0KymE+PnyZok+yOTwhWAa2pE5sUqKX4QmNGY2LVuLs3QA
         BhQThjO5Mhwax2xniX9imAVbDUtqHyvWud1FJLdPRECt8XbxCDEWHkmmtsB7ur8cN4Rp
         XAJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IeOorEEUd8BaAscyYTvJRWktSlgU1smXQ5VbUxTHhfQ=;
        fh=UK0OwsYLsgXhZfCWbHHhKGdLHEN5E9W69sO2bI0fhck=;
        b=BDfKyGPsb9xo2m6jQW9tnqPFMNrqH6i/3e9q9sbDT/u1xj0yOKqqhBSlRtxGCfyuX1
         3pRag4bb84KAaL1SuP8QO+VKdcXDJVDctR3WQF2FcJiZH7mFVjq8rcesJKNZZXV1hqV6
         klCMwhAsDEr5C7MsUZfttIxX5KEoD0UIdULkDRDiKe5Ra5/mMatM10D/81m29huUK80v
         gmns6nb9lynnQ5GLcdNtR4pZSzXhwixBjkQv9dz9OpUamyDFKk62Ed35H8MDtGR6PhT+
         EAYKmoyiqaZyOxLJLfhPixuDhwU0PXBi1Wv5syUCMpGhnO8ED0z+qb0Xa/DT3aUSEtD4
         9pww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785530201; x=1786135001; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IeOorEEUd8BaAscyYTvJRWktSlgU1smXQ5VbUxTHhfQ=;
        b=A97TcgDDtWjBjSFEGjNbbluxJc9WQx8MKToRcr8aiuyyUCWeKKCKyy8L7tXVCO5x74
         UK3bjcuHwvzaPLDR4EdxJu8GKU70nLofni1L3/qRRjGvT1LXgus/Ayu7lpzYMDB6i62A
         Qo+9hRSRV6Imt8Fbsw4JKKOvVHUvve+eEy9KNVIQNZ0fD6+XxFnzS7yi9Wai0ufBNKkJ
         LrGsuWNazV4itrgVBMUXSoJK4O2qjxJan6+oDqLY7+gTw9fgzWt0SaVGlR8C4OG3nuOG
         7nf4mzG8cjSmQgPsp6RcW00zPBZPbsKZIQeKbsYPNxL+ZCV167gLopr0SiMx8f9Dg7+e
         g2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785530201; x=1786135001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeOorEEUd8BaAscyYTvJRWktSlgU1smXQ5VbUxTHhfQ=;
        b=AcEluUvYZXcfoLfZNcKqc2zBSpFR5y7FeQA5CpJ59iehTm66B3LC9YR13k3d35p+0B
         8FLlFdT9GB9lbsmjLtNEK0jnTxmMt5ppS+bDWb+LdODR1CZ2jxsm6QtUv0ut5qi/K1j+
         bvfPhZ9fO5EijKH8EghcoiTq5b0UAMvfS7XTcEIZ7p8OGjbPUsexTMtQzur2/EUrYAr3
         o5Muu+NtBtJIrdlMqpzW+5DG4DxDZIPVTlk5YjUblOlMxwjB0DNyzP1m0ZrNlKEU2ice
         8oLibQUTRvf9qHApGi/DYhobn9m5U5xRFCnMT9l/ZLKPkQHqg14S6DUBw1HJ6eLVyiKA
         D1Qg==
X-Forwarded-Encrypted: i=1; AHgh+RrE9F42Zb+pGq9uE3EwiZXJp+bOWDOtpet6bovH2z/jEO1fMm56PxYR1t2NR4Fmq73F4qiu@lists.linux.dev
X-Gm-Message-State: AOJu0YygyEHvRt6eDNgkhacIZsNKHXMo8bLBWHUvrszOsRFCMtWdrroM
	tG18bFxDDowDidn6C5Vr+j6yat6o7AxsoHmGMDnlSjKAHvfrs+YG/txc9gZXATGK9oSGZCzpZLl
	LKHj4P2e4oDcJK2sG/pRkeJZxuQaZJ8JV9ubxonxk
X-Gm-Gg: AR+sD10RFzeyA87Ogj80jUlzm04gE2Qc5Wcg0YxOWXExQ0SJt2zDMppnM3QK87QR2DG
	5mKpxU2cEaVB8MRxRZiW+4bdQKNdkyAgBCNto8pC/XbTeZ2QHvTS+duhZ2y5h/4uDgkmm3O2hIO
	c5k41A8Yh/TU9jp4GZ3J6H/9RE1We7bE6iQCsl2znT0ZB7sll+PhwufWF2HesCk2ly+3R70bzdK
	4k8twYuDSQEpw9gAU2Uhq7BDDrBI0ZeLvaiJfbXRvfUz8uUDa8BqZtT+inr/zxW4hclt7oPUSut
	fGolMuNkUVhkHJjKtFCF3zUet4RR9mmEbE2Op/zNxSozqLQQCneGOmDfwH6bYWJcuQftg+FLUpH
	IFxf9sLYcDykQafEyaLGZZMbvZ3raB+aCBcRKkvTlvuq9p6Q/UrV7p9l4PwI=
X-Received: by 2002:a17:906:4549:b0:c15:b133:9dfe with SMTP id
 a640c23a62f3a-c1fe8374a57mr43361366b.43.1785530200610; Fri, 31 Jul 2026
 13:36:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731-always-inline-list-add-v1-1-d29f54ce5477@google.com>
 <CAKwvOd=6xCKkLLLmSXz1S95jOjRSDGyQbUwp5=yNJeau5q9eJQ@mail.gmail.com> <CAKwvOd=44Wjh4b2OH8+GygqWW=rvjy2aX5VKGtaiRRNF5fV7qg@mail.gmail.com>
In-Reply-To: <CAKwvOd=44Wjh4b2OH8+GygqWW=rvjy2aX5VKGtaiRRNF5fV7qg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 31 Jul 2026 13:36:27 -0700
X-Gm-Features: AUfX_mwwZZRBY0lqURljds29pZ2fQ2LnTLcUc4PSUx_-vgMFjaO_CVymwznOoDw
Message-ID: <CAKwvOdn75h+=WYz7edMwXydPKTDY7Emwcy4D2eKF+n=ztG7Q6Q@mail.gmail.com>
Subject: Re: [PATCH] Mark list_add and __list_add as __always_inline
To: Jordan R Abrahams-Whitehead <ajordanr@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Eric Dumazet <edumazet@google.com>, Kees Cook <kees@kernel.org>, Marco Elver <melver@google.com>, 
	Giuliano Procida <gprocida@google.com>, Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 1:30=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Jul 31, 2026 at 1:29=E2=80=AFPM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Fri, Jul 31, 2026 at 1:15=E2=80=AFPM Jordan R Abrahams-Whitehead
> > <ajordanr@google.com> wrote:
> > >
> > > This commit resolves an issue where modpost section
> > > verification fails due to section mismatches between list_add
> > > and its callers.
> > >
> > > At present, list_add (and its internal __list_add) are called from
> > > both .text and .init code sections. Since inlining can vary per call
> > > site, list_add can be 4 different states:
> > >
> > >   list_add in text with arguments to non-.init.data values
> > >   list_add in init with arguments to static .init.data values
> > >   list_add in init with arguments to non-.init.data values
> > >   list_add in text with arguments to static .init.data values
> > >
> > > It is last instance that ends up causing the section mismatch caused =
by
> > > constant propagation of the address of static libs inside the `dir_ad=
d`
> >
> > I think you meant `static __initdata LIST_HEADs`? (not `static libs`).
> > Maybe AKPM could fix that up for you when applying?
> >
> > > as seen below (with the dir_list being defined statically in
> > > initramfs.c, resting in .init.data).
> > >
> > >   WARNING: modpost: vmlinux.o: section mismatch in reference: __list_=
add
> > >   (section: .text.unlikely.) -> dir_list (section: .init.data)
> > >
> > > Because of these section matching requirements, semantically,
> > > __list_add and list_add MUST be inlined. This will then ensure
> > > callers inside .init will receive a list_add that exists and refers
> > > to only .init data, and list_add code in .text sections will only ref=
er
> > > to non-init data.
> > >
> > > This issue manifests predominently in AutoFDO with clang, which is ve=
ry
> > > hesitant to inline cold functions such as list_add even when marked
> > > `inline`. Marking them as `__always_inline` therefore matches the
> > > existing semantic constraints imposed by modpost's section mismatch
> > > checks.
> > >
> >
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > Tested-by: Nick Desaulniers <ndesaulniers@google.com>

I can also find internal reports about this from two other folks;
worth attributing on the fix IMO.

Reported-by: Giuliano Procida <gprocida@google.com>
Reported-by: Yabin Cui <yabinc@google.com>

> >
> > We've been seeing this particularly on Android and ChromeOS while
> > trying to enable AutoFDO, which seems more likely to outline cold
> > code.  include/linux/init.h defines __init as __cold.
> >
> > I saw no change in size for x86 defconfig; enabling
> > CONFIG_LIST_HARDENED resulted in a change of a few bytes (i.e. less
> > that 0.01%).  I assume we don't care as much about the size if
> > CONFIG_DEBUG_LIST is set.  Checked with bloaty and
> > scripts/bloat-o-meter (thanks to Eric for pointing out that tool in
> > the linked thread).
> >
> > I never heard back from Kees or Marco about their thoughts on this in
> > relation to
> > commit b16c42c8fde8 ("list_debug: Introduce inline wrappers for debug c=
hecks")
> > but I wouldn't mind an Ack (or Nack) from at least one of them.
> >
> > > Closes: https://github.com/ClangBuiltLinux/linux/issues/2173
> > > Signed-off-by: Jordan R Abrahams-Whitehead <ajordanr@google.com>
> > > Suggested-by: Nathan Chancellor <nathan@kernel.org>
> > > Suggested-by: Eric Dumazet <edumazet@google.com>
> > > Link: https://lore.kernel.org/all/CANn89iJVQe=3DwedLheJmjZjOTJsWHijT0=
jZs=3DiRxKssJZbjAxHw@mail.gmail.com/
>
> Also, I think we might want this applied with:
>
> Cc: stable@vger.kernel.org
>
> since I believe CrOS saw issues as far back as 6.1.
>
> > > ---
> > >  include/linux/list.h | 15 +++++++++++----
> > >  1 file changed, 11 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/include/linux/list.h b/include/linux/list.h
> > > index 09d979976b3b..59f8aa0905d3 100644
> > > --- a/include/linux/list.h
> > > +++ b/include/linux/list.h
> > > @@ -150,10 +150,13 @@ static inline bool __list_del_entry_valid(struc=
t list_head *entry)
> > >   *
> > >   * This is only for internal list manipulation where we know
> > >   * the prev/next entries already!
> > > + *
> > > + * Must be inlined to ensure it can be safely called
> > > + * with initdata arguments.
> > >   */
> > > -static inline void __list_add(struct list_head *new,
> > > -                             struct list_head *prev,
> > > -                             struct list_head *next)
> > > +static __always_inline void __list_add(struct list_head *new,
> > > +                                      struct list_head *prev,
> > > +                                      struct list_head *next)
> > >  {
> > >         if (!__list_add_valid(new, prev, next))
> > >                 return;
> > > @@ -171,8 +174,12 @@ static inline void __list_add(struct list_head *=
new,
> > >   *
> > >   * Insert a new entry after the specified head.
> > >   * This is good for implementing stacks.
> > > + *
> > > + * Must be inlined to ensure it can be safely called
> > > + * with initdata arguments.
> > >   */
> > > -static inline void list_add(struct list_head *new, struct list_head =
*head)
> > > +static __always_inline void list_add(struct list_head *new,
> > > +                                    struct list_head *head)
> > >  {
> > >         __list_add(new, head, head->next);
> > >  }
> > >
> > > ---
> > > base-commit: fc46aed51f6280801f43a2cf4b5060cc33b572f9
> > > change-id: 20260730-always-inline-list-add-363639606e26
> > >
> > > Best regards,
> > > --
> > > Jordan R Abrahams-Whitehead <ajordanr@google.com>
> > >
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



--=20
Thanks,
~Nick Desaulniers
