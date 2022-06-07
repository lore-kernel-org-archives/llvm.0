Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330324C65
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 23:43:46 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id c2so11230629lfk.0
        for <llvm@lists.linux.dev>; Tue, 07 Jun 2022 16:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BsJ4E/n6E6WEYC3xGqcJLEMCmh5wzfUdFOjfQObwoo0=;
        b=MiLDd7q0UzhgPqtULsC28miEBwaRcoPU5dgYwC8Vnb3XkpW6tvL29D9H61eOW5mkU7
         RtydIL+wpjs3qQwcBNDZrTRSNEfNeLR4ECa2gln2u/GCeQgaBoKORAuAN3akCT3pUIce
         C04A4X1xY6BG5tDDEXmSV3c8OFFspxcjkkWOk+yUJRtgKYgQ/Ph5TrkL2THDj6D42B2H
         TscnQy/usJ58iOhHOuoDeeOFTvps9u8Wz4RdtyK4cCwu6zLxdOFGOxrTBp7Se+/r2EkI
         XzYlUI/kTG5IP2+O0uu8+suzgo4VnVGpttk/9STP++GmrvKOp17sZojssv7ryL6Edcqu
         fOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BsJ4E/n6E6WEYC3xGqcJLEMCmh5wzfUdFOjfQObwoo0=;
        b=N55Vt5iaXI1kmxovNyBibGEpU7lvWLf9fGwzTgDDE0zjStH7yp+2qukZs+QWpq3pYP
         zN04LpsVPK5w6e/X/xjbQ7QBw1UowDwQHgjLF2G+1YtGH9oZ/UIQiV1atSYUOu0HUwBn
         a6qgEZ/iC6Te5uc3mqg83TAUMybCpi5j6Q7B4XBciFzAluC+pyVdyuh2CqLJOevWxNR3
         qyxJB2Rdpopc0BKKLCNlM0ozDgCLPDvD7lUc9g9RWUIj41IRFBAOFSQXxVSgpe/JtQr1
         j1W8l5PZSl13P9ZCSNXJ9iSt26OU+jKVxUM9cuvXeKHJFuRTpLXjhO6yXVWuFloYMWzC
         q2JQ==
X-Gm-Message-State: AOAM530+t8lnEziMNbXqfzbJR+ov4z7iNIXa3DQkz0vCwaiQrmY8WNBB
	Vw/gXV9M8JhXnRYiTHnhArZGLtdPhUmewgkMVO3VBw==
X-Google-Smtp-Source: ABdhPJxMSdiKma4gy0XJ31Ei7YNJtDAZetRdNPGU1knDY0iRcPr5fqk/dczy94U1kwwpxw5G9qq8r/um7sgG9zZftLI=
X-Received: by 2002:a05:6512:3f94:b0:478:7abe:de4a with SMTP id
 x20-20020a0565123f9400b004787abede4amr54365154lfa.401.1654645423956; Tue, 07
 Jun 2022 16:43:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220607222006.22719-1-jstitt007@gmail.com> <20220607152744.d7c801d092529309500ac9a6@linux-foundation.org>
 <CAKwvOdmXeRbFjkHgFXps4pLH6Q6pGWRNOqA85=h2aFnR=uaggg@mail.gmail.com> <20220607162128.b5d4aa70f4a8a7610ce29250@linux-foundation.org>
In-Reply-To: <20220607162128.b5d4aa70f4a8a7610ce29250@linux-foundation.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 7 Jun 2022 16:43:32 -0700
Message-ID: <CAKwvOd=KxY5PBgedkerrL_3BAV_ri8N4F-=piJ6tQXHwFDSr3g@mail.gmail.com>
Subject: Re: [PATCH] include/uapi/linux/swab.h: add __u16 cast to __swab16 conditional
To: Andrew Morton <akpm@linux-foundation.org>, Justin Stitt <jstitt007@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	LKML <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Richard Smith <richardsmith@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 4:21 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Tue, 7 Jun 2022 15:42:56 -0700 Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> > On Tue, Jun 7, 2022 at 3:27 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > >
> > > On Tue,  7 Jun 2022 15:20:06 -0700 Justin Stitt <jstitt007@gmail.com> wrote:
> > >
> > > > if __HAVE_BUILTIN_BSWAP16__ is defined then __swab16 utilizes a __u16 cast.
> > > > This same cast should be used if __HAVE_BUILTIN_BSWAP16__ is not defined as
> > > > well. This should fix loads (at least a few) clang -Wformat warnings
> > > > specifically with `ntohs()`
> > > >
> > > > ...
> > > >
> > > > --- a/include/uapi/linux/swab.h
> > > > +++ b/include/uapi/linux/swab.h
> > > > @@ -102,7 +102,7 @@ static inline __attribute_const__ __u32 __fswahb32(__u32 val)
> > > >  #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
> > > >  #else
> > > >  #define __swab16(x)                          \
> > > > -     (__builtin_constant_p((__u16)(x)) ?     \
> > > > +     (__u16)(__builtin_constant_p((__u16)(x)) ?      \
> > > >       ___constant_swab16(x) :                 \
> > > >       __fswab16(x))
> > > >  #endif
> > >
> > > More explanation, please?  Both ___constant_swab16() and __fswab16()
> > > return __u16, so why does this patch have any effect?
> > >
> >
> > See this example:
> > https://godbolt.org/z/fzE73jn13
> > And the ImplicitCastExpr nodes adding to the AST:
> > https://godbolt.org/z/oYeYxYdKW
> >
> > Both the second and third operand are promoted to int.
> >
> > C11: https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf
> >
> > 6.5.15/5
> > >> If both the second and third operands have arithmetic type, the result type that would be determined by the usual arithmetic conversions, were they applied to those two operands, is the type of the result.
> > 6.3.1.8/1
> > >> Otherwise, the integer promotions are performed on both operands.
> > 6.3.1.1/2
> > >> If an int can represent all values of the original type (as restricted by the width, for a bit-field), the value is converted to an int; otherwise, it is converted to an unsigned int. These are called the integer promotions.
>
> Geeze.  Can we please turn this into English and add it to the changelog?
>
> Is it saying that an expression
>
>         int ? u16 : u16
>
> has type int?

Yep.

> Or something else?

Technically, the `int` in your example (the first operand) doesn't
matter. Could be a `long long` or a `char` and it would not matter.

> What did we do wrong here and is it

Perhaps the simplest English explanation would be "ternary expressions
with then/else clauses with types smaller than int undergo implicit
promotion to int."

> possible to correct our types rather than adding a cast?

I think the cast is the explicit cast back to __u16 way to go here,
IMO.  I don't think anything within the ternary could be changed to
avoid implicit promotions.


Justin, can you please send a v2 removing the casts withing
__builtin_constant_p (as in the diff I posted previously in this
thread) and with the below text added to the commit message:

Ternary expressions with then/else clauses with types smaller than int
undergo implicit promotion to int. Cast the result of the ternary back
to the expected __u16 to match the type when __HAVE_BUILTIN_BSWAP16__
is defined.

Also remove pointless casts within __builtin_constant_p argument lists.
--
Thanks,
~Nick Desaulniers
