Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA6D3D575
	for <llvm@lists.linux.dev>; Thu, 20 Jun 2024 19:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718912877; cv=none; b=JmvaIpP0gIG3TN5Scw9eB2WqmcxyCZfsS04ORlMCFLQwXMpjBXSI3u4jwQUNFMyPAO+Rvt+uYGwIYEne/fI18wsTRP2sE2QCjrnfFYIVyqaSyNGJ6ObJ87vjI5umUEjIwvm+DoQElB/Krv+MDdNSx9AXuwbL9xAXbbX1Tu8aqG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718912877; c=relaxed/simple;
	bh=862VnKCkNLOQBFx4YiOtMqgmmlHiFEVEMCgVVYka2b0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+Kcs5zGbsFlzQDuF1CSxqWuhV97xqTRi9m5mxXwBrGJu9DEbs8MmLU20qZX67o30AYHwJQ1OXVbVStgdsDjKKHvRkdKOUw4mBaWvFNu1eJ6jOJmjPclW/bgV0cuHjWHoYRPHFgUHBGK1UbJeZC0oV5NrXvXnoY56Usjj3maD3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vQ+ETMe+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vQ+ETMe+"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-364a3d5d901so928448f8f.0
        for <llvm@lists.linux.dev>; Thu, 20 Jun 2024 12:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718912873; x=1719517673; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNc529DGB2kuH106Zk8B0JpwUGAF1N0DtZphSOYR/oA=;
        b=vQ+ETMe+kcmRgf2ZBmxWdqqlCzdG9F9p8NeMCmlR6z6L/AsUtmnDO5JpZEdw+l1hAM
         v0xuJLjo/5S2bP6chYyj6mQ/idcpBT12lj+3XHnFv/iLEFeepDRd7ysyu3FcK2VOwM0x
         UE/ainaB1OLUE49P2HljvybNwkongqRzS8BOPmC+WpRew42kByG3fErwX2fClHk/KzbD
         6jTJ8F0zxeyHioLEHe6EowaLQI4pyMiImoY4VM6hJ9+Hubv7jaP5fRi87O3heQlhRDB8
         5g7cT0TKrICETvaZ4JbYBfH7Jc7AEuTfU/bTcORUaJQgTEZZ/mrX2DNy0RMoj9vKvIqw
         IbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718912873; x=1719517673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNc529DGB2kuH106Zk8B0JpwUGAF1N0DtZphSOYR/oA=;
        b=F7rcqYt9b28MzvG7AndrBtNOtlJAjuNeBayaymPJvWD8PmiNXn6O754x0R9gHItqAG
         23T/aMoIoeXKYlmaI/NTaFR578NOwBUpsY2foYCqr+jFcelUSw/KujGxuSN4457pq4KS
         Ol4VoNUfLkPPAGEmmiWN7snd4bPEGTW4XXfKMMW1ctXI1wAL4PyXhdPoy6eL1kSuhhqY
         Ux/eIE/fgHb8IsEWNp9UJNJ/TdIeXmhE8IsPDjHSgvsKVo1XCDGaa2rcQbohZ8YZSBw1
         7tgLVCpZv4NQUIspPpGXdTnl3byJ9wgAS65qlrIe+kP1gOxRmbCoIIn8q7Wb+uX4Uv6R
         B0ig==
X-Forwarded-Encrypted: i=1; AJvYcCXuhi3qs1dV7hqSeVnMGMhsjrsbSxW5eWt2RPwIhodR0mTdrJadP/Of6NTr3RY8hL21+smvxnlcNL0/3c6PYnZ2u/S5Og==
X-Gm-Message-State: AOJu0Ywhm2tkypnSKATRdthKP6x/Pf1VlwhRFP8inaN6YnfvSaMTwVAg
	BgnyDYjPE3QTMn1zXi7Yfc2DYX9vZ9tJpJbet59mKAVKhhM2JSXDdrtDB3P3sl+zfc4OLV5WQi6
	p1gVPrUmGWxAf4jZenc9Z24Xxp2Bnf6dfzj18
X-Google-Smtp-Source: AGHT+IGrPdVcwRWI9jIOBc7bAbM6sVLQ+zmTwl426aeO1W5z9G541aNdbPXNTDAPA+cczAeOT5b6A7edctQRuwcrJCE=
X-Received: by 2002:a05:6000:1fa4:b0:365:862f:21c8 with SMTP id
 ffacd0b85a97d-365862f260bmr1468996f8f.53.1718912872814; Thu, 20 Jun 2024
 12:47:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240620181736.1270455-1-yabinc@google.com> <CAKwvOd=ZKS9LbJExCp8vrV9kLDE_Ew+mRcFH5-sYRW_2=sBiig@mail.gmail.com>
In-Reply-To: <CAKwvOd=ZKS9LbJExCp8vrV9kLDE_Ew+mRcFH5-sYRW_2=sBiig@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 20 Jun 2024 12:47:42 -0700
Message-ID: <CAKwvOd=DkqejWW=CTmaSi8gqopvCsVtj+63ppuR0nw==M26imA@mail.gmail.com>
Subject: Re: [PATCH] Fix initializing a static union variable
To: Yabin Cui <yabinc@google.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	"Ballman, Aaron" <aaron.ballman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 12:31=E2=80=AFPM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Jun 20, 2024 at 11:17=E2=80=AFAM Yabin Cui <yabinc@google.com> wr=
ote:
> >
> > saddr_wildcard is a static union variable initialized with {}.
> > But c11 standard doesn't guarantee initializing all fields as
> > zero for this case. As in https://godbolt.org/z/rWvdv6aEx,
>
> Specifically, it sounds like C99+ is just the first member of the
> union, which is dumb since that may not necessarily be the largest
> variant.  Can you find the specific relevant wording from a pre-c23
> spec?
>
> > clang only initializes the first field as zero, but the bits
> > corresponding to other (larger) members are undefined.
>
> Oh, that sucks!
>
> Reading through the internal report on this is fascinating!  Nice job
> tracking down the issue!  It sounds like if we can aggressively inline
> the users of this partially initialized value, then the UB from
> control flow on the partially initialized value can result in
> Android's kernel network tests failing.  It might be good to include
> more info on "why this is a problem" in the commit message.
>
> https://godbolt.org/z/hxnT1PTWo more clearly demonstrates the issue, IMO.
>
> TIL that C23 clarifies this, but clang still doesn't have the correct
> codegen then for -std=3Dc23.  Can you please find or file a bug about
> this, then add a link to it in the commit message?
>
> It might be interesting to link to the specific section of n3096 that
> clarifies this, or if there was a corresponding defect report sent to
> ISO about this.  Maybe something from
> https://www.open-std.org/jtc1/sc22/wg14/www/wg14_document_log.htm
> discusses this?

https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3011.htm

https://clang.llvm.org/c_status.html mentions that n3011 was addressed
by clang-17, but based on my godbolt link above, it seems perhaps not?

6.7.10.2 of n3096 (c23) defines "empty initialization" (which wasn't
defined in older standards).

Ah, reading

n2310 (c17) 6.7.9.10:

```
If an object that has static or thread storage duration is not
initialized explicitly, then:
...
=E2=80=94 if it is a union, the first named member is initialized
(recursively) according to these rules, and
any padding is initialized to zero bits;
```

Specifically, "the first named member" was a terrible mistake in the langua=
ge.

Yikes! Might want to quote that in the commit message.

>
> Can you also please (find or) file a bug against clang about this? A
> compiler diagnostic would be very very helpful here, since `=3D {};` is
> such a common idiom.
>
> Patch LGTM, but I think more context can be provided in the commit
> message in a v2 that helps reviewers follow along with what's going on
> here.
>
> >
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > ---
> >  net/xfrm/xfrm_state.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
> > index 649bb739df0d..9bc69d703e5c 100644
> > --- a/net/xfrm/xfrm_state.c
> > +++ b/net/xfrm/xfrm_state.c
> > @@ -1139,7 +1139,7 @@ xfrm_state_find(const xfrm_address_t *daddr, cons=
t xfrm_address_t *saddr,
> >                 struct xfrm_policy *pol, int *err,
> >                 unsigned short family, u32 if_id)
> >  {
> > -       static xfrm_address_t saddr_wildcard =3D { };
> > +       static const xfrm_address_t saddr_wildcard;
> >         struct net *net =3D xp_net(pol);
> >         unsigned int h, h_wildcard;
> >         struct xfrm_state *x, *x0, *to_put;
> > --
> > 2.45.2.741.gdbec12cfda-goog
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
