Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1FD3B7744
	for <llvm@lists.linux.dev>; Tue,  6 Oct 2026 07:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791271864; cv=pass; b=SdvkSEPdO7zWQBEGVC3A3/9YEB0TEmoDRLTAi9YaQ90JZnrKWKAi5O0xeVoSlCkt2VuZzqiOWHrKwacvPohFV3yNOjxdbeTe31g9PXKA2JXix2e9q/XXrQfj5wMG/dIWN9YMwDQAhf0W5uYjxOo5Nd3/m0ujRpAWre+JYIRAn+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791271864; c=relaxed/simple;
	bh=HqbDUpGwmU9Vj6DEnJhTzo5Q/I2Bb7O52TujIr0QQg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r6aJnSPx1M19oh950tWJ2WCIjyLdVpFpIwHiTWZSbqF2BVIwpcmlwjfLYkthTea7al6SHEgG+1HlgJLrfkrV9ETWuxzlOC33KZmMPcMMfRk2bc4N7v4XPay1OFpVhxHhHY/NEGQ4TSA95flBUZzL9LuMfp9hFiV3nijyiWg1+40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pEMrWHtk; arc=pass smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pEMrWHtk"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-98b2f32e67fso32107241.2
        for <llvm@lists.linux.dev>; Tue, 06 Oct 2026 00:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791271859; cv=none;
        d=google.com; s=arc-20260327;
        b=RUpZif6sMoTE5js6X3b4zpKxPJMAXRbPKugMdOcMUbNNjhiB5QE+bdp5zdtoRYvNx0
         GPDvUIau3cgfe1WycltNOYsB7p/jdLaNiLGh5wPDqzhxw2ugnG9t5l4V9fOrk0XS55/R
         pKPSowht8Z22WqCHAZYBmNEn5cKXVQ4n9quGSbHT7vzKJ+il0qWugwlVmjEV/MRXfgiM
         4Bwaa7qWZCEAEUtCcJwjpIphbiPCqdpv6OwklN6SI+CNzlctPLOcYuUAoXZDpeRPGK4F
         42MVcnnBon6x+e5yE+nX2dZ4VnM6syFsOrh7jVyIBr6XcvzlyMwsD77prjh4JrMptmnM
         W/fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rAhKUuZ8ftg1KrkRjMOJWoz5mwV32k7ntU16rIZRc+k=;
        fh=bD3eUqiEwkFGiSrkdk9wcz0nRFcotwFpybY61GOIBUs=;
        b=j7qPV2gWPvrNbt9GYHzgkrz4j+Oz1L1OU2xSU6p9po13nFYsmCfqdqZxpq43Z2PdQ9
         8egrHSNJdh6a63Jhq+37dAtUzPOiO2/8J7tjAW+obpKS45RM5L2m4T44ARl0AVSAf+Fr
         7HlF6mOXOb5laTv5+bKenoSaMnLZTpKjjn00btz3oCjg6fX0JSGRBJHle2H9l2OKZ8Fr
         Yzn9yK3yR6LCZOSCPNPtAORzsvtnmEai5BjfeC5I8wTsAo3kHClrVqusDnw+s1MB6aKo
         0r1wufQOALWzLG/QGjbtM3uOCtch2UKcnjpPcCLkMrF9VQRVxVIRxfturIFAo9ifvDyS
         u+ag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791271859; x=1791876659; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rAhKUuZ8ftg1KrkRjMOJWoz5mwV32k7ntU16rIZRc+k=;
        b=pEMrWHtkDSNjce4yrcxXZ4N1C6ExguVF59Yxu1oN9ZVuzDingBhgh8ZMuXURWvkzmh
         o0TuzNwawWgEMfsJRJRLA+pgaaVLBFC/jZi4MU4yAvM8bUf2BTOk/Vy21mFr5RL6VXLE
         xIzbPhDLuC7uEGeQtEph7CsZ6BWWi1bzXZjZRJfZmnTXNIwAi7kWDRL5QZN9xWUBxvnq
         gWd1q+4vcsjkxR1PJ6IrHMdhkJtJ/hc2m51yBakx2kjq8F8VkYCDmQ0UgB24Zm4Mnvp6
         OHx9wuom2ZkRwmgmL6sg5VMhmmql0rizwKCoz1a9Bao4YVDCZgebRew4/lXBq4ciCuX9
         9Nsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791271859; x=1791876659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAhKUuZ8ftg1KrkRjMOJWoz5mwV32k7ntU16rIZRc+k=;
        b=qRygRT1JDyh52lkgDWbD+kfd7kvLIjj2NZUxM5tJY3jLlxPLHGQvnZwRs7iE/Wcatw
         xIHPS1/6sqq2SXcYyPHJhy4dA7qF2Go3Gy03myhTEkZdboLP1UZ5nOzGm6q/fJ5ZPQjd
         mk5fzAPCzyqSM5Pt6n9is23NBadD/cFoRl6Xcikng2cxyyhdIq4E6jimQcZ3A8ttWTIJ
         aQur/YoXU3FGw4D5uB9s9x/lFSzBU8kCu7AvYHyzg33u+qYVbq3cqKrDn8/dQeFyI09M
         4XwUHIlSlDIPhc240qwg+e6JgtzYjnnAfazbGA/wJ3Zxp0m9cHGRaIr0YoSoi9kxBstD
         DL1A==
X-Forwarded-Encrypted: i=1; AKwUvBwiOlOTAEA8wvlq6aW+R8ANhcp8swBSkErWInzOxIayRhwyEJKT1G3pnm7kDN8VB01U8OPX@lists.linux.dev
X-Gm-Message-State: AFq9FYIIA6zi0rnU8dvHUDKuQ1/52rxW5XdjhLaqLG4Bnmt5bSyFVRQe
	wTTWMsnejPKojnF4ZjI4xALxSh8ePL379AE7SgayKlkgJorS+6wXsErGES7eJ7U1YaFtlv2CTQw
	VOo2Myp4/TIqM77jfjQFMg1IWu71JlDPu7KmqvqFA
X-Gm-Gg: AYBFou0yUwujVnygzp++IaK/nD0pKmsKfWArH3taUq8oUnasJeWkgQqt74W9KPJwTod
	/RPzu/yiP4Ksr7KdVuCKRGwDOn5UfGoahFKnraeGQUrOr3Ua7GXxzVaVQZ2TfSdph30BRMHFSlJ
	jtsKEh72UAi5n275hyOgYDyqPzUMccHy8XWPMw3s1nN/CRE4sZkvnzaMBpN7uXF/WLyBNxumv7S
	gznO0ZQlvl7tR04dB7wIfMdm4qHjTooOkCQF+yG2lRIQdG3biSGaOXQLg/QphF9MO303UexSEjx
	R/2wreN6oEGfhzOppe66Dw84jZd+EMgza6lEGODPj9bjc1eWMJaYKw==
X-Received: by 2002:a05:6102:4191:b0:779:5049:87b2 with SMTP id
 ada2fe7eead31-7c86b7a1657mr86691137.0.1791271857877; Tue, 06 Oct 2026
 00:30:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261005102518.2400984-1-morbo@google.com> <20261005192052.2589382-1-morbo@google.com>
 <3176a197-baf8-4e5f-96a0-8c79d32a168c@app.fastmail.com>
In-Reply-To: <3176a197-baf8-4e5f-96a0-8c79d32a168c@app.fastmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 6 Oct 2026 00:30:45 -0700
X-Gm-Features: AclHuK_GelE_trg9Ql7tfs3Unb-Kel9TbJ-CeAIIKNqsPgvqmn4941q8qguKUSU
Message-ID: <CAFhGd8q3Hs9r6ezCA5bFATcZcq7AZyC7Cai8muk5o-AwOMLW7w@mail.gmail.com>
Subject: Re: [PATCH v3] compiler_types: Allow opting out of __counted_by and __counted_by_ptr
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Mark Brown <broonie@kernel.org>, 
	Marco Elver <elver@google.com>, alan.maguire@oracle.com, namjain@linux.microsoft.com, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 5, 2026 at 2:25=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> wro=
te:
>
>
>
> On Mon, 5 Oct 2026, at 21:20, Bill Wendling wrote:
> > Code that runs outside the kernel proper, such as the EFI stub, gets
> > nothing out of the counted_by annotations: the bounds checks they feed
> > (FORTIFY_SOURCE, UBSAN_BOUNDS) are already disabled there.
> >
> > The annotations can also break the build. A __counted_by_ptr() that
> > names a member declared after the pointer needs Clang's
> > '-fexperimental-late-parse-attributes', which the top-level Makefile
> > adds to 'KBUILD_CFLAGS'. The x86 EFI stub builds its own cflags and doe=
s
> > not get that flag, so it fails as soon as such a struct is pulled in
> > through a common header.
> >
> > Overriding the __counted_by_ptr macro from a Makefile doesn't work:
> > 'compiler_types.h' is pulled in with '-include', which is processed
> > after all -D/-U options, so it re-establishes the definitions. Follow
> > the '__NO_FORTIFY' precedent instead: let a build define
> > '__NO_COUNTED_BY_PTR' to turn the corresponding annotation into a no-op=
.
> >
> > Assisted-by: LLM
> > Signed-off-by: Bill Wendling <morbo@google.com>
> > ---
> > v2: Only specify __NO_COUNTED_BY_PTR. Leave __NO_COUNTED_BY until we ne=
ed it.
> > v3: Add the version to the Subject line.
> > ---
> >  include/linux/compiler_types.h | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/compiler_types.h
> > b/include/linux/compiler_types.h
> > index c5921f139007..8bde6798b4ec 100644
> > --- a/include/linux/compiler_types.h
> > +++ b/include/linux/compiler_types.h
> > @@ -387,8 +387,13 @@ struct ftrace_likely_data {
> >   *
> >   *   gcc:
> > https://gcc.gnu.org/pipermail/gcc-patches/2025-April/681727.html
> >   * clang:
> > https://clang.llvm.org/docs/AttributeReference.html#counted-by-counted-=
by-or-null-sized-by-sized-by-or-null
> > + *
> > + * Code that runs outside the kernel proper (e.g. the EFI stub) can
> > define
> > + * __NO_COUNTED_BY_PTR to drop the annotation. Such code may also lack
> > the flag
> > + * Clang needs to parse a reference to a later-declared member
> > + * (-fexperimental-late-parse-attributes).
> >   */
> > -#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
> > +#if defined(CONFIG_CC_HAS_COUNTED_BY_PTR) &&
> > !defined(__NO_COUNTED_BY_PTR)
> >  #define
> > __counted_by_ptr(member)      __attribute__((__counted_by__(member)))
> >  #else
> >  #define __counted_by_ptr(member)
>
> Apologies, I may have been unclear.
>
> What I would like to see here is something like
>
> #ifndef __NO_COUNTED_BY
> #define __counted_by(member)  __attribute__((....))
> #define __counted_by_ptr(member)  __attribute__((....))
> #else
> #define __counted_by(member)
> #define __counted_by_ptr(member)
> #endif

FWIW, Bill's original patch had this explanation

"The two are kept separate but parallel so they
can be folded together once all supported compilers handle
'__counted_by' on pointers."

Justin
