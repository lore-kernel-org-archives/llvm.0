Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C99390229
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 20:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785529871; cv=pass; b=kNr1hra4hpWHacLoPwQ7gKDRnidu/4NvLz45ecU1CV/OOSO38R+mPL6iOfEbpEaSRkjIcGxoed+3m0ljQrSIAArOEbur3lcd7NcvLvaZt1NCLXviwPUh7uBEg91lr/j9aH34FW7O8EfouMjeEgaDQAzwcCo/3Ro/jkBUc42UGjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785529871; c=relaxed/simple;
	bh=YTUsk4/edvN/ZGkcnWag511GO+Nj3tnOwg+HL/peLE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UY+395xY2iY+BYs4JplTlQXltmHwZhHXSFJimowTbNpwx6Q5RhIT19LGs2lafxhGAUGU3ItsM1mQkiKOWPelNGMZulBcp4md1+9hoAu0adz4KHcU2aOMlP25OJr+FPNpmjkKfqbrgngtQ1ySOK9GvCARB2IET0rTfGibuqF85kU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H6KtDERa; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H6KtDERa"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f84023916so1489062f8f.3
        for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 13:31:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785529868; cv=none;
        d=google.com; s=arc-20260327;
        b=FWqeofDIVT0F7Wl8ZVIjB1tqwIZzCqoNSMhQ0d/EcM9LfCYd4JbyW0l4AYxJ/kH4XU
         vYCygz3O8prAR+zAA3EWZiSj69m2FEysPvuEDZh1nsWINII2hCftc8pqzt/6NHhXPnC8
         QI165G10L6Ls+aOUlIxvFEJ01xlucWauI/YCMEjnbWKHWMYno4jojzyCuhNhsALSv2BC
         CQ479mT9J5TlObL3hJHIxl4sVXOCyQNDxs28DwypZxMi6d0Ff3fq1YXRMraiyHgQhvBE
         0TwNiuLHkMghu9GF7F3P7HEhfsxqMK3JqfYwdljLJW4NNoDLR7OuGAPLdqt/iPtoEZv7
         OvhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=czzHXt4pXmYOg5jfstP+MkwO4x4IcB0c1Pd3044FR5I=;
        fh=HgvnHgbd1vH4PRRBoghXiobOQms87M0K+fmcX9jPYfo=;
        b=VZQDIQQK9EUKiEq9eguRo99LVTfGTm31cf/7C6O7vRAsR1+pHGqyA3YyD7JWMBUoB8
         PMnQnUoSYrPUVWIi2H5nAmYk9Br+i0JouC1En/QHMNb0WYLlO+WMuDd5DvDKfnKUDwWH
         7DPE7KaNRai2xxZof6/6IbYenM7511R9wcMK/yoW9eVOwfr+fsMaKtm+RhuBfihAhLFZ
         mGOQX8odXst7WVr+aEXMh53Jw5qrMgoHgMfAbmhgibKAD8BtHVNCFVx9WsaZKNT1Yjdu
         B18J2lolVEWfwEjhW1xVHdQ9zRZtJ2/w6feQlYlSM7mXAYCHzHtkoUX/8QFchhE9ubtv
         Z8wA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785529868; x=1786134668; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=czzHXt4pXmYOg5jfstP+MkwO4x4IcB0c1Pd3044FR5I=;
        b=H6KtDERaV+33B7HcDmRmdzRHkOQYugfF+XfFSpd9TGwl9Iy+0+Dia1JqHCq3VAWmc9
         ZYO8hl6v++0Cdmp1q95NnpWD64MyCnw9zWIVVVNa3i7V/7Xy7j1IJ6Utxlb9j/1GhTE0
         hZ30jj04gAf84qG91NLu1Ngg4oTXDxo0De/GGsElXA1I/ROu3xR8S/jfpRpUyrFLqwSm
         9lQy2oT2bGiA/8iAo7Pk0iebCBYLKlhyk+EzhjXDjYP80ELOMOrHD6gzXzMPJdVEULnt
         HLSGzFFzwv8u8dcYI4JNMnMCy3Y4TnqMNcqXjScfXqA2kiIWPFHwRyQp/uScq8VGnFt6
         Txdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785529868; x=1786134668;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czzHXt4pXmYOg5jfstP+MkwO4x4IcB0c1Pd3044FR5I=;
        b=Cpfb4QiSN9Q/hM8NfmMWOLINYZcWw6Z/NaLyQBsSnJNonvDdnPLMb/9SE9jLMj9qAm
         pBZprKGZRpc/Dsv69PCtJkDLB1MQJffvOLV4+RUTQvr4pXdRmDpZP2e2DWi9aRw0EOKe
         HJlqLcDoq1DAZMzsTSZZwDKgkp2so926suoKSpuZkUUG8HvB1aaJmIRVRqTNS23MkZBR
         tNf8GC9+fzIj25pJ6s8QF7mftpiNqWUNg/BPbbEI8PBT0r7mQHe3eDlpcE4X4YmyR43n
         0suJnEjOqWMABlxDmAlLbZclAhs7Z3oc2PxtxRK7kDlhCHL8ZSZB5hqg7zOSlTqNwrdE
         MRfg==
X-Forwarded-Encrypted: i=1; AHgh+Rqhfq9kWIhOEf8E7Wwz8sw5j/NkZA2+7rZwBmdkzutxGAyzjmGlSjRxZovuykSh4GgVpQxC@lists.linux.dev
X-Gm-Message-State: AOJu0YwRDcQc90otNJG+fOaA4Zt5jcqVKlYYFqO3D3JP6xmGybe2Cg8R
	b0SO1l3SRf+6K36yBp08G/5QxnNBSFCynudl8nN+mewa3U/TpW+gHRsmLLjFdRIsbj9orbN9vWU
	Me2T405HibsxInE26ceAqvQcehdG7meuXcT8X7ch0
X-Gm-Gg: AR+sD128ysjHYDFVrI/mDZndsEvDywQd8OF402kCelzpTMcZhYKQDgCIYVvDlQzGYzH
	jJy/3UeapTIAAn9zBubDhKX0VufRYSneOAP05HtgaMBw/gUzQnGR7MXlcAArFySmNbJ+Ts66Hwe
	v9jzBsOAWaqf+Xi+z53X9Hu4Zq9XfNZD8UXQj7a5/pFNUCYrRKc4VKZt5qk4Z9reoHanALDwsql
	JZb9HXra1tI5pkIQ2mVXl76m6yP8OcFdiT9kIMjM6Fdn8aCUPxM6IfNHxn5ThJMi2rOoQoR7Vf3
	wRmdE8GVPvMwXpKLBqfQMQBBJutqUUW1DNtZnR203ImTkTRA+hYCaJHuCRrNsL08zfBfPdWfQVL
	pDyjK86T2GH9dWVkzwRFgXJCQf9/MgvDN694SplvydkUm20XbfN4wZRHCvMg=
X-Received: by 2002:a05:6000:110d:b0:47f:9ac6:c9bc with SMTP id
 ffacd0b85a97d-47fd72bbfefmr1594273f8f.2.1785529867343; Fri, 31 Jul 2026
 13:31:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260731-always-inline-list-add-v1-1-d29f54ce5477@google.com> <CAKwvOd=6xCKkLLLmSXz1S95jOjRSDGyQbUwp5=yNJeau5q9eJQ@mail.gmail.com>
In-Reply-To: <CAKwvOd=6xCKkLLLmSXz1S95jOjRSDGyQbUwp5=yNJeau5q9eJQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 31 Jul 2026 13:30:54 -0700
X-Gm-Features: AUfX_mx7faozyned_50TUH_Ikz17dELj8DOK35-ZzbFKEybf-HXPoUzN31mw8lE
Message-ID: <CAKwvOd=44Wjh4b2OH8+GygqWW=rvjy2aX5VKGtaiRRNF5fV7qg@mail.gmail.com>
Subject: Re: [PATCH] Mark list_add and __list_add as __always_inline
To: Jordan R Abrahams-Whitehead <ajordanr@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Eric Dumazet <edumazet@google.com>, Kees Cook <kees@kernel.org>, Marco Elver <melver@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 31, 2026 at 1:29=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Jul 31, 2026 at 1:15=E2=80=AFPM Jordan R Abrahams-Whitehead
> <ajordanr@google.com> wrote:
> >
> > This commit resolves an issue where modpost section
> > verification fails due to section mismatches between list_add
> > and its callers.
> >
> > At present, list_add (and its internal __list_add) are called from
> > both .text and .init code sections. Since inlining can vary per call
> > site, list_add can be 4 different states:
> >
> >   list_add in text with arguments to non-.init.data values
> >   list_add in init with arguments to static .init.data values
> >   list_add in init with arguments to non-.init.data values
> >   list_add in text with arguments to static .init.data values
> >
> > It is last instance that ends up causing the section mismatch caused by
> > constant propagation of the address of static libs inside the `dir_add`
>
> I think you meant `static __initdata LIST_HEADs`? (not `static libs`).
> Maybe AKPM could fix that up for you when applying?
>
> > as seen below (with the dir_list being defined statically in
> > initramfs.c, resting in .init.data).
> >
> >   WARNING: modpost: vmlinux.o: section mismatch in reference: __list_ad=
d
> >   (section: .text.unlikely.) -> dir_list (section: .init.data)
> >
> > Because of these section matching requirements, semantically,
> > __list_add and list_add MUST be inlined. This will then ensure
> > callers inside .init will receive a list_add that exists and refers
> > to only .init data, and list_add code in .text sections will only refer
> > to non-init data.
> >
> > This issue manifests predominently in AutoFDO with clang, which is very
> > hesitant to inline cold functions such as list_add even when marked
> > `inline`. Marking them as `__always_inline` therefore matches the
> > existing semantic constraints imposed by modpost's section mismatch
> > checks.
> >
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
>
> We've been seeing this particularly on Android and ChromeOS while
> trying to enable AutoFDO, which seems more likely to outline cold
> code.  include/linux/init.h defines __init as __cold.
>
> I saw no change in size for x86 defconfig; enabling
> CONFIG_LIST_HARDENED resulted in a change of a few bytes (i.e. less
> that 0.01%).  I assume we don't care as much about the size if
> CONFIG_DEBUG_LIST is set.  Checked with bloaty and
> scripts/bloat-o-meter (thanks to Eric for pointing out that tool in
> the linked thread).
>
> I never heard back from Kees or Marco about their thoughts on this in
> relation to
> commit b16c42c8fde8 ("list_debug: Introduce inline wrappers for debug che=
cks")
> but I wouldn't mind an Ack (or Nack) from at least one of them.
>
> > Closes: https://github.com/ClangBuiltLinux/linux/issues/2173
> > Signed-off-by: Jordan R Abrahams-Whitehead <ajordanr@google.com>
> > Suggested-by: Nathan Chancellor <nathan@kernel.org>
> > Suggested-by: Eric Dumazet <edumazet@google.com>
> > Link: https://lore.kernel.org/all/CANn89iJVQe=3DwedLheJmjZjOTJsWHijT0jZ=
s=3DiRxKssJZbjAxHw@mail.gmail.com/

Also, I think we might want this applied with:

Cc: stable@vger.kernel.org

since I believe CrOS saw issues as far back as 6.1.

> > ---
> >  include/linux/list.h | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/linux/list.h b/include/linux/list.h
> > index 09d979976b3b..59f8aa0905d3 100644
> > --- a/include/linux/list.h
> > +++ b/include/linux/list.h
> > @@ -150,10 +150,13 @@ static inline bool __list_del_entry_valid(struct =
list_head *entry)
> >   *
> >   * This is only for internal list manipulation where we know
> >   * the prev/next entries already!
> > + *
> > + * Must be inlined to ensure it can be safely called
> > + * with initdata arguments.
> >   */
> > -static inline void __list_add(struct list_head *new,
> > -                             struct list_head *prev,
> > -                             struct list_head *next)
> > +static __always_inline void __list_add(struct list_head *new,
> > +                                      struct list_head *prev,
> > +                                      struct list_head *next)
> >  {
> >         if (!__list_add_valid(new, prev, next))
> >                 return;
> > @@ -171,8 +174,12 @@ static inline void __list_add(struct list_head *ne=
w,
> >   *
> >   * Insert a new entry after the specified head.
> >   * This is good for implementing stacks.
> > + *
> > + * Must be inlined to ensure it can be safely called
> > + * with initdata arguments.
> >   */
> > -static inline void list_add(struct list_head *new, struct list_head *h=
ead)
> > +static __always_inline void list_add(struct list_head *new,
> > +                                    struct list_head *head)
> >  {
> >         __list_add(new, head, head->next);
> >  }
> >
> > ---
> > base-commit: fc46aed51f6280801f43a2cf4b5060cc33b572f9
> > change-id: 20260730-always-inline-list-add-363639606e26
> >
> > Best regards,
> > --
> > Jordan R Abrahams-Whitehead <ajordanr@google.com>
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
