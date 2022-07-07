Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A58C2563
	for <llvm@lists.linux.dev>; Thu,  7 Jul 2022 17:47:40 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id h23so33654251ejj.12
        for <llvm@lists.linux.dev>; Thu, 07 Jul 2022 10:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w5UVqVYkA2liWKvF5AEz1NuihXTRBWSdPpoacsPExUk=;
        b=VnSWNkarZG9BtYbcTV2x/Y11CEBH4XIuymrgY4Vv27MqSHtZcbzE3N+SvKyyi1PXLp
         qsyNpEE83rNxQJu+mSR0YcoECw57pUzVzNZ3VPUwnf8BZLAHNsZo6E0Ke3kShCQNltoz
         citbH7pTYgo6Zc35r9M7xalt0nKGVVB6bwH1A6P4NchhbYKCz0GpsXV/rXfKDITpGBy+
         ZYxIbJ7OxTk6fqRprTzXpXrn6JAnK2FWWnl7SHklRSsk4Cv3vtKnKovUTVlfDXDUfPkC
         Shl8o9RHjCUA2jLq684EHRtlnOjpNFYHFGwQt/ulnZ1HdHkfFIBeMl/G/lFil1AicKXN
         zT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w5UVqVYkA2liWKvF5AEz1NuihXTRBWSdPpoacsPExUk=;
        b=gmltHIWa5kOQ9JMpTakNsnSe0Ba1hmVLzYkRMvE5MPGP+WXWiocHT/pewpSQkFYjvA
         oELln7gQG1q0DCig7wiFU0D2V9rj/c+hMrbFXCSzWY0cy6jTRUbZ+md7v2kkl/IwvoVE
         plaPYycpLxBLFCtgOpFXyAYOU8D3oKplGhWp8MrJQPUBYtuiAPKR6IzwGy/rUEtDhtSy
         kALibPAqgR9b3MyTtPymrqs4yOD72VjDbhchbExGixtW1IV1MRnIVfceauc3S+i/Xn5q
         eHfyYwFGzCAc251fIN2CNFYC325FfBRz1t8CvUMawsAdKqRZuJIxWeynCyhXJoKjLR7S
         6FHw==
X-Gm-Message-State: AJIora8fPGo/5wj3/QjXJmVS1Gwqvp/oqujQQjA1erx1tN28ox0dTi3S
	Fvq/QuNqcZU8s1Me9EHLtdVFmOZd3I2tj+bUAoom6w==
X-Google-Smtp-Source: AGRyM1vmJwqTFg1c1tCtPBghzrjs73hfYOtbJo0WpwlLvw0T29Eo5UgcY0rUroqmtCdxAXIWHXBAiIPtLMlbfDGk4c8=
X-Received: by 2002:a17:906:478e:b0:722:f84d:159f with SMTP id
 cw14-20020a170906478e00b00722f84d159fmr46497744ejc.182.1657216059214; Thu, 07
 Jul 2022 10:47:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220707173040.704116-1-justinstitt@google.com> <6f5a1c04746feb04add15107c70332ac603e4561.camel@perches.com>
In-Reply-To: <6f5a1c04746feb04add15107c70332ac603e4561.camel@perches.com>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 7 Jul 2022 10:47:28 -0700
Message-ID: <CAFhGd8oTybm0aQ_q60e+exf5eFO1kLiNKnmDZfVTyg=BbtgZsw@mail.gmail.com>
Subject: Re: [PATCH] net: ipv4: fix clang -Wformat warning
To: Joe Perches <joe@perches.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, 
	David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 7, 2022 at 10:40 AM Joe Perches <joe@perches.com> wrote:
>
> On Thu, 2022-07-07 at 10:30 -0700, Justin Stitt wrote:
> > When building with Clang we encounter this warning:
> > > net/ipv4/ah4.c:513:4: error: format specifies type 'unsigned short' but
> > > the argument has type 'int' [-Werror,-Wformat]
> > > aalg_desc->uinfo.auth.icv_fullbits / 8);
> >
> > `aalg_desc->uinfo.auth.icv_fullbits` is a u16 but due to default
> > argument promotion becomes an int.
> >
> > Variadic functions (printf-like) undergo default argument promotion.
> > Documentation/core-api/printk-formats.rst specifically recommends using
> > the promoted-to-type's format flag.
> >
> > As per C11 6.3.1.1:
> > (https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf) `If an int
> > can represent all values of the original type ..., the value is
> > converted to an int; otherwise, it is converted to an unsigned int.
> > These are called the integer promotions.` Thus it makes sense to change
> > %hu to %d not only to follow this standard but to suppress the warning
> > as well.
>
> I think it also makes sense to use %u and not %d
> as the original type is unsigned.
Yeah, that would also work. An integer (even a signed one) fully
encompasses a u16 so it's really a choice of style. Do you think the
change to %u warrants a v2 of this patch?
>
> > diff --git a/net/ipv4/ah4.c b/net/ipv4/ah4.c
> []
> > @@ -507,7 +507,7 @@ static int ah_init_state(struct xfrm_state *x)
> >
> >       if (aalg_desc->uinfo.auth.icv_fullbits/8 !=
> >           crypto_ahash_digestsize(ahash)) {
> > -             pr_info("%s: %s digestsize %u != %hu\n",
> > +             pr_info("%s: %s digestsize %u != %d\n",
> >                       __func__, x->aalg->alg_name,
> >                       crypto_ahash_digestsize(ahash),
> >                       aalg_desc->uinfo.auth.icv_fullbits / 8);
>
