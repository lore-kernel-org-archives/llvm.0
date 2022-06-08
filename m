Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BE833D2
	for <llvm@lists.linux.dev>; Wed,  8 Jun 2022 19:35:42 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id s13so23820073ljd.4
        for <llvm@lists.linux.dev>; Wed, 08 Jun 2022 12:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w5G4Fbpw7okaDvJbNf0MUPyOzWFJdsVep+P+r/ikKsg=;
        b=e6MlxKPNbaQV4c4Oo53CyLESL6PSi5lSi46bOHBKBNvjX7e5Kphi0hmQokyPRJxAHs
         avoNesKdfLcgD4ut3r6If0laOOrw+zL2Oh9bpPwSVYsIeyOutzFB6elsI8iheEJghu2b
         aAfhHtH2KFgZ2MfHA+woAIYo8fondvI7mlhWwEXsFeK84ciyLYX76HYY53hsMOgYcuXC
         pwbkY+dv241fFgmbMkV2AD90dSMJQFyo696Uv7f7mwT4ejIUjP36UtTS9afYnDIIpefV
         CNt8MEu/zhuKsNW7At8b0azUSJw7hIayNdrenx8WkuzBAdozllkbnUbVXGvCoPH7DxGu
         uz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w5G4Fbpw7okaDvJbNf0MUPyOzWFJdsVep+P+r/ikKsg=;
        b=ShzDQ+CHRN87TBIry8hsFfuYAMyLYXTX/dHgml1UJ1NKs9dx5c+n0tvGgWcFFYoYxC
         FGPymjwRjP6ERSEubQGyT+WZHzEK2xldqY+lGO3iAzMPFO7kIcDOLT1HqmpP+CcSe9iZ
         YL8bgjbbU6kXuEF+Y5gIa3V3De13AG9BcpyycUN5HZudbKi+dCD0I3sT+ANVt3fLLrl4
         +eUOaMPlPIifaDkf4gFbEHSZz16WSlHBhwBoGwMwj0nnzIOM/yu61D/KgnsbTpoPwsB1
         oWmSISlufcxDDndHTtCvIVSfcdGMoLCt6Cw1qDzEvwAoZIWuKjI8s6oMIzqC0pfUFT8V
         Pgjw==
X-Gm-Message-State: AOAM5309GQCQoTGdujVWBX7OIWg739nlkVFHQKb8sZXHIbBdtoEa+kfW
	/ZN1evs5ZSEYt39poQUNz+LxcRJOagEPiWTmcveB8A==
X-Google-Smtp-Source: ABdhPJwbJnHAdMV0IB/VPzx2hwY+/y+dUcwA0O9PFdif5ICszkdwEtpDKgAA2Pd14WKKHoo69GKiOtz7wz6Gs5eCUgI=
X-Received: by 2002:a2e:8715:0:b0:255:a7e5:d50d with SMTP id
 m21-20020a2e8715000000b00255a7e5d50dmr6419645lji.26.1654716939750; Wed, 08
 Jun 2022 12:35:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220607222006.22719-1-jstitt007@gmail.com> <20220607152744.d7c801d092529309500ac9a6@linux-foundation.org>
 <CAKwvOdmXeRbFjkHgFXps4pLH6Q6pGWRNOqA85=h2aFnR=uaggg@mail.gmail.com>
 <20220607162128.b5d4aa70f4a8a7610ce29250@linux-foundation.org> <YqArhaiEu+6YWZfg@zeniv-ca.linux.org.uk>
In-Reply-To: <YqArhaiEu+6YWZfg@zeniv-ca.linux.org.uk>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 8 Jun 2022 12:35:27 -0700
Message-ID: <CAKwvOdnSSY0jexXioDTZOWSTi0fkaudZbgSjigPr5uzTRmA_Rg@mail.gmail.com>
Subject: Re: [PATCH] include/uapi/linux/swab.h: add __u16 cast to __swab16 conditional
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>, Justin Stitt <jstitt007@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Richard Smith <richardsmith@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 9:54 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Tue, Jun 07, 2022 at 04:21:28PM -0700, Andrew Morton wrote:
>
> > > 6.5.15/5
> > > >> If both the second and third operands have arithmetic type, the result type that would be determined by the usual arithmetic conversions, were they applied to those two operands, is the type of the result.
> > > 6.3.1.8/1
> > > >> Otherwise, the integer promotions are performed on both operands.
> > > 6.3.1.1/2
> > > >> If an int can represent all values of the original type (as restricted by the width, for a bit-field), the value is converted to an int; otherwise, it is converted to an unsigned int. These are called the integer promotions.
> >
> > Geeze.  Can we please turn this into English and add it to the changelog?
> >
> > Is it saying that an expression
> >
> >       int ? u16 : u16
> >
> > has type int?  Or something else?  What did we do wrong here and is it
> > possible to correct our types rather than adding a cast?
>
> Not quite.  Same rules as u16 + u16 - on architectures where int is wider
> than 16 bits it's (int)u16 + (int)u16 and yields int, on 16bit ones it's
> (unsigned int)u16 + (unsigned int)u16 and yields unsigned int.
>
> You *can't* get smaller-than-int out of ? :, same as you can't get it
> out of addition, etc.

Exactly, and well put. More concise than I was able to express.  I
think that description will satisfy Andrew's request for additional
context, so I'll recommend Justin add a blurb derived from what you
said when sending a v3.

>
> __builtin_choose_expr() would do it, but I would take a cast over that
> ugliness.
>
> FWIW, it might make sense for clang to keep track of the following
> property: expression has the same value as it would if integer promotions
> in it had been replaced with integer promotion of result.

I'm not sure that's precisely the same issue here.

The issue we're facing is more so that `ntohs` is being used in
printf-like expressions; clang's -Wformat warns about default argument
promotion so we need to clean up cases where smaller-than-int format
flags are being used for promoted-to-int params.  While looking at
that, Nathan noticed that __swab16 will return either a __u16 or an
int based on whether __HAVE_BUILTIN_BSWAP16__ is defined, which
depends on BOTH the compiler being used and target architecture.  This
patch from Justin just cleans that up.

>
> Example: with
>         unsigned short x, y, mask;
>
> expresion "x & y" is interpreted as and_int((int)x, (int)y), which is equal
> to (int)and_u16(x, y), so that expression has the property in question.
> "x != 12 ? x : y" has the same property.  "x + y", OTOH, doesn't - if x and y
> are both 32768, x + y is add_int((int)x, (int)y), i.e. 65536, while
> (int)add_u16(x, y) would be 0.
>
> For a somewhat more subtle example,
>         (x & ~mask) | (y & mask)
> is interpreted as
>         or_int(and_int((int)x, not_int((int)mask)), and_int((int)y, (int)mask))
> which is equal to
>         (int)or_u16(and_u16(x,not_u16(mask)), and_u16(y, mask))
> IOW, the property in question holds for that one, despite having a subexpression
> (~mask) that does *NOT* have that property.  (int)not_u16(0) is 0xffff and
> not_int((int)0) is (assuming 32bit int) 0xffffffff.  Upper 16 bits get fouled;
> applying & with known-16bit launders them off...
>
> That predicate is behind the handling of small bitwise types in sparse;
> otherwise all operations on __be16 would trigger warnings due to promotions
> from __be16 to int.  And aforementioned subtle example is common enough, so we
> had to deal with it.  See commit d24967cb847b "[PATCH] handle fouled-bitwise"
> in sparse git...

https://git.kernel.org/pub/scm/devel/sparse/sparse.git/commit/?id=d24967cb847b7a04920698a9053ea8195046a831
(For others' reference)
-- 
Thanks,
~Nick Desaulniers
