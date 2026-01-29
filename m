Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459E9340A69
	for <llvm@lists.linux.dev>; Thu, 29 Jan 2026 10:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681608; cv=pass; b=HK4gyOYWqtDRfxH0wBmvlpVETBqYv3P48oYqO+Lwce8cOSW0DgDbUUel0+Jn44I7qCrAYGNBE05J20xaCMJSbZzuBUOizYgKfu/EnBVgMVwUpCsTSUGshBWnfAgX7ycWCWoYCLFkXuXKr+eyCEyQDOa7NLRdh1uWnqXBSYkif40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681608; c=relaxed/simple;
	bh=PPbk8uPs6vCHTFBMW/OYmO+qS3GhgxK4GRF3V5HigAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uOLKoYz/2OAyMwStZcNHIUSSBAwwJ0svc6Om/JHdrFwkNBO7mwQlwoeXi44P1Uiibho8NxlUrMMvhBOA2RazfuqhbqgTJrnEYPxPZdsU7joAue+YPknCTYg1TE+iSo31h7yvNaI/nSWEoeVjK8Tl5vGfU3SdAg9ar8QCI/KO/ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HeeUSZ8z; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HeeUSZ8z"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b4520f6b32so1581423eec.0
        for <llvm@lists.linux.dev>; Thu, 29 Jan 2026 02:13:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769681606; cv=none;
        d=google.com; s=arc-20240605;
        b=kV8UGbFu4o8Zr3qkBmnt84tCj8cBAb4S2Es3xFurPUkNp5hT0hCoCeECdlo/l8LqH9
         ndD3juKX3a++7V12cm1ft95eLSbvk1qT4Jl2AbHT6fvt40CHUFEyzcSADUGvIlAbFK0u
         u3cFevFw3PEFt7gybdBrwuynXEhIxWD7T2gPOUk1HXAb4ZOHRJQlFOqkyMCkfoV05QTD
         iEZyQrL/pcgkf8wJG9HF1z8WgmVATgDw1WGf+vuH2o6sivJEm3DUxSfvGHjzlYXShL40
         XgOp96BiwA911cq3KYRxfpB9703ljoxpwNcwvhbYBfb+vwZXO4qIL0tSBL0yYQSdYCKF
         wL1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Lc+XjDBA+a8aHFibRHjswsqkmvLkJszDVJ8RfsBnEd4=;
        fh=9HBhyZFCn/iMlGUyBkQycKS8IgxBAv/piFwXANoiVG4=;
        b=Lvlne0/SSK0fWxEDnhJZp3PLsaha53AXvOGQ5285qV3zV4Jx3r85um1ymDC1nK1i5c
         IZ9668e6rc2iyYdDAq86giFVdS/lDNQbr/Q+RBpWCxh7zOIQO1VKQKirEgYQnHoBtYnu
         Y8zZ7jUlOHYPWH4SitY8FarkHQHOUe1ly3KtShgLqcTdnlWdlICXJcYc6s4Vdpaptgur
         VDXFJGaFi+fzohWPNvnQNQFRfBqGa4dVtorn6KhfS5PTnWqg4H9iOxp146MrSmY3FGzY
         Lvoxo52OXEP9AFvFr/w+GTdI5GdSH8Io4O4UpVzPtJ6f3w00dDY9SMl4lqlYrDY+L08m
         6Z4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769681606; x=1770286406; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lc+XjDBA+a8aHFibRHjswsqkmvLkJszDVJ8RfsBnEd4=;
        b=HeeUSZ8zSFYflx2yzrVClyjSHhfY6Bmgfz3V9wOoB6oHY5ZbcJHE3v5mlLayPQP44u
         PZ6r7D11x8b90Vb7fzdhctsum/GGYxlgfJIgSweIJdDEa3JtQa7rirw/VoK59Uk19Lb1
         p+mARR6gOKRZFIuVNzdXJBd6puox+SOcPRklBNp38aN4IjfUQFIQWFT7NaxdF5cPvz2G
         +waL6v25vLwhYJtGaXFIICoT12zFC6eHWgItjeVHub1JU3GSwrtc6jOhxXyi73BluA6f
         BdoIeX+HFXU6qYkyMjpDEgA7Hkmjnwq/fDxdUutrKtCgdrr7VgH0a7vcNXgXQnQM3IBq
         QJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681606; x=1770286406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lc+XjDBA+a8aHFibRHjswsqkmvLkJszDVJ8RfsBnEd4=;
        b=pMoAXEdtcLrzulzvMIYCRqOFEeFLmu5GCaXwFY8tkZlRfg/gRXP9WOrNe6nPZSa5+x
         nx98dRQbV3iIUDi4j2NSy3R+9+Mgn/mX653COWWeM3GvKXBeiyqVRxu11nFlKz6/vYFx
         TmUOgeCEpvKwzzhXi5LPW2t086YiTn3g7aUoCrIzKKGOmCVu+cxfVS+yOxgo2HXTXQCS
         pNk/0VJN43Uq0yxHJUBTvNfp1rShApNq4evRPMhI8/4xGHRG+zrE0n82k2BpHz9sLbHD
         buZZG7Q0xS5OOGSnAKGY+8jRR+OscXLompHfyuIeCiV+ikszfoi9TC9NTni/A7qR31W1
         HDkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0w+84Pyrrr6F8p1lPTIAPVctn0qualvDuEC00obdvWIFk0n0F2MRcsg7PQeTr+UiIN2v4@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7+v4wZGUJQSwWk84Gv8wnWyB2PF1h35eVUqfRQlVfPWPfEFSP
	q61fAarWDr4yf4V6V5vjN3Idg0W47JkmGC3ozMTRjFD3cI51w8mrlv8xkNxEWWm0wbk/e+GACRj
	LG0YGueyLxmw2Yi/0DR3vHMeyI6MEI3nB6pFnsjgD
X-Gm-Gg: AZuq6aInqTXRIGF28xJoIvtj/ILwQYkrbBTQwIoIExBJCjQhc4xzHs7XDJNrnrf14QS
	uZGrqNi+wMepVuzhnX1n88yoeyN/Ix6hs7fRn6ln8JqDD3nbw4L0L0lYjUJbJQMI5vqapgEGQph
	jRFwfoEL/RTRzwCRHKRn4XArexRyXWAvPdY9cEpxkfyeRXDUug+Y72GnUrvPVkPhyrziNlHL9+i
	Ki9IResSs8CWNOTZoxcz4d70G9Em17BNSdeNxsEY/YMs2n7UI54socJJN8cO1fSdhWLBCyldQp2
	V8e1du2unvCW8TI54z7JxkYVaRLQFCeRF4A=
X-Received: by 2002:a05:7022:23a8:b0:11b:9d52:9102 with SMTP id
 a92af1059eb24-124a008b0a3mr4817016c88.6.1769681605889; Thu, 29 Jan 2026
 02:13:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260129005645.747680-1-elver@google.com> <20260129005645.747680-3-elver@google.com>
 <20260129100332.500248d3@pumpkin>
In-Reply-To: <20260129100332.500248d3@pumpkin>
From: Marco Elver <elver@google.com>
Date: Thu, 29 Jan 2026 11:12:49 +0100
X-Gm-Features: AZwV_Qjm1big2o3mYTbTc-InA_aDqnDfx4wWvQeXqTlFIP_0-3CqkH0h_lrLByU
Message-ID: <CANpmjNPL662LMLw9o-fqQCBkhD=oG-UTHSQb8XeXtXduhh1dQQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Jan 2026 at 11:03, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Thu, 29 Jan 2026 01:52:33 +0100
> Marco Elver <elver@google.com> wrote:
>
> > Rework arm64 LTO __READ_ONCE() to improve code generation as follows:
> >
> > 1. Replace _Generic-based __unqual_scalar_typeof() with more complete
> >    __rwonce_typeof_unqual(). This strips qualifiers from all types, not
> >    just integer types, which is required to be able to assign (must be
> >    non-const) to __u.__val in the non-atomic case (required for #2).
> >
> > Once our minimum compiler versions are bumped, this just becomes
> > TYPEOF_UNQUAL() (or typeof_unqual() should we decide to adopt C23
> > naming).  Sadly the fallback version of __rwonce_typeof_unqual() cannot
> > be used as a general TYPEOF_UNQUAL() fallback (see code comments).
> >
> > One subtle point here is that non-integer types of __val could be const
> > or volatile within the union with the old __unqual_scalar_typeof(), if
> > the passed variable is const or volatile. This would then result in a
> > forced load from the stack if __u.__val is volatile; in the case of
> > const, it does look odd if the underlying storage changes, but the
> > compiler is told said member is "const" -- it smells like UB.
> >
> > 2. Eliminate the atomic flag and ternary conditional expression. Move
> >    the fallback volatile load into the default case of the switch,
> >    ensuring __u is unconditionally initialized across all paths.
> >    The statement expression now unconditionally returns __u.__val.
> >
> ...
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> > v2:
> > * Add __rwonce_typeof_unqual() as fallback for old compilers.
> > ---
> >  arch/arm64/include/asm/rwonce.h | 24 ++++++++++++++++++++----
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> > index fc0fb42b0b64..712de3238f9a 100644
> > --- a/arch/arm64/include/asm/rwonce.h
> > +++ b/arch/arm64/include/asm/rwonce.h
> > @@ -19,6 +19,23 @@
> >               "ldapr" #sfx "\t" #regs,                                \
> >       ARM64_HAS_LDAPR)
> >
> > +#ifdef USE_TYPEOF_UNQUAL
> > +#define __rwonce_typeof_unqual(x) TYPEOF_UNQUAL(x)
> > +#else
> > +/*
> > + * Fallback for older compilers to infer an unqualified type.
> > + *
> > + * Uses the fact that auto is supposed to drop qualifiers. Unlike
>
> Maybe:
>         In all versions of clang 'auto' correctly drops qualifiers.
> A reminder in here that this is clang only might also clarify things.

Will add.

> > + * typeof_unqual(), the type must be complete (defines an unevaluated local
> > + * variable); this must trivially hold because __READ_ONCE() returns a value.
>
> Not sure that is needed.

Trying to warn against someone copy-pasting this as a TYPEOF_UNQUAL
fallback implementation. typeof() and typeof_unqual() do happily take
incomplete struct declarations. E.g. this works:

struct foo;
...
struct foo *f;
typeof_unqual(*f) *x = f;

Whereas with the __rwonce_typeof_unqual() fallback this doesn't work.
I can try to make it clearer.

> > + *
> > + * Another caveat is that because of array-to-pointer decay, an array is
> > + * inferred as a pointer type; this is fine for __READ_ONCE usage, but is
> > + * unsuitable as a general fallback implementation for TYPEOF_UNQUAL.
>
> gcc < 11.0 stops it being used elsewhere.
> Something shorter?
>         The arrary-to-pointer decay doesn't matter here.

Ack.

Thanks!
