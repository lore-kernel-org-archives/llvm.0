Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170563D3D19
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 23:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787008582; cv=pass; b=dMxbdhrDs8LIdFB+2Lv12Y9CyfRDcCNnwEUscDLr+M/y/x2yylKCAAKzWjepmjdX2Z+R1NIJjlGEXZlZPXMOythNkU2rFybg7dAVS9v+yKzZEUbNO4/BpMMtLbil3xtsirfJBNRG8YjqwqXpf71MYjeiSh0Hx98ek7c2KuM4c/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787008582; c=relaxed/simple;
	bh=aC4iUKA2UpUMbgOXb/TlUUJCtfx4w9IP1Z/GJ35LDvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lA2LF+Uv6E+5hyhRjQ8SRtW1vjEuc4Z/m7PaFUz55wHPek+yxVZPNmR5tkyofmFQEpchiIitdCvynDN1O10c6gSE4qmfI0ynMiHfWhJL3WqnfnElOFobDBUosSTNq86L7tBOqwewVzfThKUa6D4Q3SB2CqgWCPR+rVGroWQZGUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tukdjYRk; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tukdjYRk"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a15d54ac95so5649662a12.0
        for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 16:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787008579; cv=none;
        d=google.com; s=arc-20260327;
        b=XspLn0IWeffnwEF1EISEQ/4hOO8cFo+xLwrs338UTJaBxieNLPevdFM54W3G6R4iNp
         /ci3JdVg8uaKiIoIwcxMCQODB8tCORtmWwup0aCiJxPLyPF+edRdhoZq+iPwMas8OJIe
         4t1zD+4ou145w+GLq5Tzy4Nv7WM65yLPBhbse02n7sXyfGCIP+j5ns7mVpHOc9fD29qN
         vomiLVFlAv1Vdgh1CbbSXy8MxnPdAyBaLfbbibnQXEjZ5UpQxPcZq1mBOipv8KASuwcb
         nMKu/5imoh7JCTFRNdMGrbCn1eFxR6uy9Ihp0Knrl52nolarv7hw8RW4aAroKNBMbI6A
         aPdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ARxs+z6TbrEcsZAzH4ghu9PG1NybKm0D9W/EVU4HDFY=;
        fh=K+TLjjkJN//7VpaxOHO5z3NjJUIcqbxImCpFR5NIEg4=;
        b=iKVJWKlBJ4+bfHjNZBOAD+2TKTN4fbwOhAaAFB2hs0wCrUPuTqbiD1w0kLhXrKtAsV
         mrmVOHm7Nlho8aTjFUny45fs8Gq4NMWqGQ890USm6N6Lf0AN5kECpSbE/g5NrmUns21e
         760QZ2M0CXumljZINJfc5zPE4OMDyrx86Qy8FPzYJ020fAAk+iFUbDZGYSHhtj3FJmUW
         N+wjMW6mqV37/7lK9TLG8IvZjabkPPryAY8yRHDf599Er34ZPAZNAJyPkIjyLdLfyTnK
         3+2sxPGrl3/tm6PYN7hf5caeFJp6wkSQrxs/Y99tKuNemqa8h7bhuU9u3sWHKj2UadLH
         TYJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787008579; x=1787613379; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ARxs+z6TbrEcsZAzH4ghu9PG1NybKm0D9W/EVU4HDFY=;
        b=tukdjYRk6Q4XYeyONOdWdip2Na5dd02dh6k/lgpddox1dVy/Abpc/Jnio6rRDHpwL6
         v/J3QTj7EKOyFvNByFhwvas6kztYMbPFJC2e1H/XexMcX1peEv83TsHX3LIRKPXx6B1A
         zGu3taMz1GB7RhEYxrENsndbrRDcvaxywCHOgGlBf9I2D1wYKzIz4Xakf143J/+hjDXs
         zGXnIeDePr5I8zPZQHjRrMshvZzRnS3EqGnySlGOtSH8GQVIA/JZLPdRkj+5o6K9t8wS
         pIYuntQ3cXDj9674Sk2H2KAg6eDPeJSZItVVyE5lrp/i2HNz/vVPHy75BgauglyUMTTq
         q1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787008579; x=1787613379;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ARxs+z6TbrEcsZAzH4ghu9PG1NybKm0D9W/EVU4HDFY=;
        b=lshRn/8nVzQwejJgjetnVaQbx16vI3mqPBFkO9M2ritPRZOjCo4SaBS8XVvRXNvyWi
         Y9x0i4iygno/4ut07V3gpm42BX842ex6NHzhapdjoI0uf5yqhooVCsBv3yQvg8zhzkra
         uzGIvXKfPTXl3rPDoN09+af59RKFP4C9qzEyVvLI5ez4NFjiqmzy4V06zWkEFxW9bun8
         tRde1Lxsu2ka/BOhjHOhCELsTeTP011RMMz3Sg4qPGq/iMQT9Tegm7egMURPnbqokZal
         8ljdBDvmGYFeETDLuboSLT8OIDReAs3ZxX4IeKFAxjo1bFE5tbZ8txmz0rT6ZEUyoKD9
         6C2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr0Kihb2Na8efXclG3tJzvnqpfu+1cDNi585+bGksoc+lunDvT7r+wRNINE3loPb42+GYJs@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1zkeI5qDdi7Yhb02wLZudv4vtmlNUB0WOT2dHetmh4MuznEhU
	R5wpNTU+hqpWt21twKaXCEYtDKVGRWuhx7F1o1QqzLbo1PYJwGxbP935GKB1EYPZL7T/skz5amw
	eOaj448X4Dla6qHzpx/s2FDry0oPb/ug7mGpCF7xV
X-Gm-Gg: AR+sD11i/HhTVHDj7jvZ6pk1/NMxCuF/4QANseCej2MVQZoGEzjjR1+HAn+OtpEhRTo
	EJgkVCdUxxnDpi/ybMYJNKMZ8Gvpm375kojkPJkWfL5io7yjTtWxbhCXUTPD7yRMCgrI2ZTzIIa
	7qspbxfOPEU6m0JgXN5qrvaI+Qwek3vNMX6AV86G2Cd6Wpq4TXlHdUWUnmst1/wS2+uRzw0Ex7+
	X49RcYui5CWpRiuTKlaiY0GFWPrMp6Q7T/DX4GjBag2SDOgNMb9Z42mFwht7ny8fcZLVZyQLFC2
	cXZm8fRePScr8QesNtR319cqgc/b0LYC2VGMm51H0MiRZVJICQmgQk/QfHqMzC5lRUTK6g5x8z5
	WM5w+WntgpdOgWfjvwfFh8ULFK7GGU5sNg7PPnSTPOV00Uer7wQrFTdAz
X-Received: by 2002:a17:907:94cb:b0:c20:5121:89c1 with SMTP id
 a640c23a62f3a-c212a10a4f8mr1291313666b.12.1787008578604; Mon, 17 Aug 2026
 16:16:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com> <20260803195135.GA1083357@ax162>
In-Reply-To: <20260803195135.GA1083357@ax162>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 17 Aug 2026 16:16:07 -0700
X-Gm-Features: AcwNN1W9izkcwuAp6MkFeC5J1f8fYvzE8iJLioZu2VQvTBLrGCuk-8lW7l7-HjI
Message-ID: <CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com>
Subject: Re: [PATCH 0/2] alpha: enable building with clang
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ John Paul

On Mon, Aug 3, 2026 at 12:51=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Matt,
>
> On Mon, Aug 03, 2026 at 01:08:40PM -0400, Matt Turner wrote:
> > Two small patches to let the alpha kernel build with clang.
>
> Nice!
>
> > The first registers the clang target triple and stops passing -Wa,-mev6
> > when the compiler is not gcc.  That flag exists to keep gas from emulat=
ing
> > instructions it believes the target lacks; it is a gas-only option and
> > clang's integrated assembler does not emulate instructions, so it is no=
t
> > needed there.
> >
> > The second fixes two uses of local register-asm variables that clang do=
es
> > not honor.  clang treats `register unsigned long x __asm__("$N")` as th=
e
> > named register only where the variable appears as an inline-asm operand=
,
> > so reading one to get the live $gp or $sp yields an undefined value.
> > trap_init() passed that to PAL_wrkgp and load_PCB() stored it into the
> > PCB for swpctx, either of which wedges an early boot.
> >
> > Note that the alpha backend is not in upstream LLVM.  It lives in
> >
> >   https://github.com/alphalinux-org/llvm-project
> >
> > and is a work in progress, so the scripts/Makefile.clang entry has no
> > effect with an upstream clang today.  I am sending this now because the
> > second patch is a real bug in its own right -- the register-asm reads a=
re
> > only guaranteed to work by gcc's implementation, not by anything either
> > compiler documents -- but I understand if the kbuild side would rather
> > wait for the backend to land upstream.
>
> Yeah, I am not sure how I feel taking the target triple part of the
> first patch. On the one hand, I want it to be easy for you to test
> against upstream Linux but on the other, I do not want people to read
> this Makefile and assume that ARCH=3Dalpha will work with an upstream
> clang.

Right. It's cool you have something building. I'm curious if the
resulting image boots? (That's the next major milestone).

I'm curious, since we've yet to have such a case of an out of tree
llvm backend, what's your plan, if any, to upstream your backend in
llvm-project proper? Perhaps as an experimental backend?  We have bugs
filed in our issue track for m68k which is experimental (but upstream)
in LLVM.

>
> We could add a comment that the backend is currently out of tree but
> that would go stale once it is actually upstream and it will be floating
> around for forever. Maybe a better compromise is taking arch/alpha
> changes now then landing the scripts/Makefile.clang change when you
> actually start upstreaming the backend, as being able to use an upstream
> version of clang should be relatively imminent at that point.
>
> --
> Cheers,
> Nathan



--
Thanks,
~Nick Desaulniers
