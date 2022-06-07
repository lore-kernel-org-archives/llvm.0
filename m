Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B2A28FB
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 22:43:10 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id q1so20803846ljb.5
        for <llvm@lists.linux.dev>; Tue, 07 Jun 2022 15:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xt01xp86lqL0/6AjJBope1HTOp03keAnvABg9sLTIEA=;
        b=UHgsazWQmeU1NR6jOOBK0qGzfYbJQXzgSI0eKTHcQO2WAP2crTBr7b/+hBIGmTkWET
         eaeI8PxMo/qMYOJQXvc79Tax4fvqB0zsF+dnhvp4wvLkdHT+KEcQKEYIfyO6dFWS9JAk
         xRe7n/80iXhEW4gCXmy1KpD6JnslfRdVAmFamIl+GjL5w9+W5S5MLB4lQcEzMogc0Sfh
         XF4cvnKjdp6lsHLn/Ker4XPQosO2YPJrCGThRBO0DzyMVpLbyoF0wXM1YwginkQVcP8F
         /ZZtlzXQ6YTWAFzzAeIAaFQH3KIVYsMJh1sMGwJ4CQuqeG6GQ6F82L83ujInHYVddxlK
         ASIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xt01xp86lqL0/6AjJBope1HTOp03keAnvABg9sLTIEA=;
        b=j8tUIolRmDcb5web+boFterUBHPi/g1WSo/5rvQL+ySEECp5ZNWQ7tzHuFVyiWntrj
         siaS9Jve0KdPpDV0HOlA3z37z8O6OXxBGL3p22QtmxLTvEEFO3nxddLCfZDH1s1HKm4V
         Inh+Cwx78U/vZHjgQNjdK/z37jQaYdVVIW1QwdgWUD7ykn4diXCnPcAds3qJdhOy6gWx
         mVVfbS5NrOku5KxnYH2WIkqd2VfFPNsbukP6WEdoi4l+ePgNvTqJP6rVWrXUBpa7hEAm
         PU/yJvaM5e2wGkP4Sp8nsFCQZA/bO039bI8naqHeOdgvlOnfwqAYCUVEI7PYCBms8d3n
         jYog==
X-Gm-Message-State: AOAM532lMczylSBftvycXYeYBTuBK6rUsCBMDr2otN2ni4+v9G/mRgFD
	9HI3ludcPnVg3kQgg7kbNRZgueXYwDY6BTpL5Dgm6g==
X-Google-Smtp-Source: ABdhPJylrRmI3sSEhsMpeXgzL2yRHODPE01/WwB6x35Xdnj/KDNkuNvsOgTE/u/vqpRRU0mPfqaMth+nqrwqFZ6C8Sc=
X-Received: by 2002:a2e:8e98:0:b0:255:9d3d:bac3 with SMTP id
 z24-20020a2e8e98000000b002559d3dbac3mr6176311ljk.103.1654641788193; Tue, 07
 Jun 2022 15:43:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220607222006.22719-1-jstitt007@gmail.com> <20220607152744.d7c801d092529309500ac9a6@linux-foundation.org>
In-Reply-To: <20220607152744.d7c801d092529309500ac9a6@linux-foundation.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 7 Jun 2022 15:42:56 -0700
Message-ID: <CAKwvOdmXeRbFjkHgFXps4pLH6Q6pGWRNOqA85=h2aFnR=uaggg@mail.gmail.com>
Subject: Re: [PATCH] include/uapi/linux/swab.h: add __u16 cast to __swab16 conditional
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Justin Stitt <jstitt007@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Richard Smith <richardsmith@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 3:27 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Tue,  7 Jun 2022 15:20:06 -0700 Justin Stitt <jstitt007@gmail.com> wrote:
>
> > if __HAVE_BUILTIN_BSWAP16__ is defined then __swab16 utilizes a __u16 cast.
> > This same cast should be used if __HAVE_BUILTIN_BSWAP16__ is not defined as
> > well. This should fix loads (at least a few) clang -Wformat warnings
> > specifically with `ntohs()`
> >
> > ...
> >
> > --- a/include/uapi/linux/swab.h
> > +++ b/include/uapi/linux/swab.h
> > @@ -102,7 +102,7 @@ static inline __attribute_const__ __u32 __fswahb32(__u32 val)
> >  #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
> >  #else
> >  #define __swab16(x)                          \
> > -     (__builtin_constant_p((__u16)(x)) ?     \
> > +     (__u16)(__builtin_constant_p((__u16)(x)) ?      \
> >       ___constant_swab16(x) :                 \
> >       __fswab16(x))
> >  #endif
>
> More explanation, please?  Both ___constant_swab16() and __fswab16()
> return __u16, so why does this patch have any effect?
>

See this example:
https://godbolt.org/z/fzE73jn13
And the ImplicitCastExpr nodes adding to the AST:
https://godbolt.org/z/oYeYxYdKW

Both the second and third operand are promoted to int.

C11: https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf

6.5.15/5
>> If both the second and third operands have arithmetic type, the result type that would be determined by the usual arithmetic conversions, were they applied to those two operands, is the type of the result.
6.3.1.8/1
>> Otherwise, the integer promotions are performed on both operands.
6.3.1.1/2
>> If an int can represent all values of the original type (as restricted by the width, for a bit-field), the value is converted to an int; otherwise, it is converted to an unsigned int. These are called the integer promotions.
-- 
Thanks,
~Nick Desaulniers
