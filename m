Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB89016D4CE
	for <llvm@lists.linux.dev>; Fri, 21 Jun 2024 21:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719005260; cv=none; b=idl8+xtRxmbQKAd9Cc/TQluLYUTOah7EvJbJW4hJrXWVNzScwWOd5VgUDxN0uTSWMy7z94bu7M7WIs57GKtFfezk88nbl1enCdR8J3uPIxbsHMNMZkbf8bf2ZR4oaumlNpff/SNP6p8oqpMp6zR1unM10CGZLINXIYwyZQTvhzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719005260; c=relaxed/simple;
	bh=uMNzYRIgleMfYnwYF+a0ZGkYj4KN0oRJZLd7rVFB5WU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vE2l6NXlGbZSgVwbgHjCvwlcX5AQjiq0xbHLw7yvi2s4RGH3n7iI9kLG75PwXIzIebY0q+vtH/0LB9dTUMd3rH1TG75L68WP8SydECnnlS2P5p8qtSvj3m3+dH+SlINYjdJQwPo2d1rvk1rGMy5PY1BMiaad3jeYkbkTJDsggdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=n4KmXDU/; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n4KmXDU/"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-48c2d01994eso744492137.3
        for <llvm@lists.linux.dev>; Fri, 21 Jun 2024 14:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719005258; x=1719610058; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9YYJN6gO8sKB5sQbYzsaO+MvxbhNg/Nzd2XouVD5g0=;
        b=n4KmXDU/Beg+VHQ/h2h1/OPgco4+ViE4uPoidrCCKYyT9yxNkMUEItDtztxAIgRD0z
         i9U/45aP9HxRspp8SMItqFSmaFBgoLBfR71PaZFHFBxjs8/tumdacCvAnD6LpMJCeDHV
         wZFi3FkYGisXo1J6NaD+SEHiU7+o/0Fy0BnJtAKjdzwaIWEWuMiXMWkGqsONa1W3ktx/
         mFFALqpVnfYAJQoVb0CN5RO6wNL+ydN9w2j75lzZvZE4+WYaCEvqARDNQFgsDb3tUUXj
         nGdceFTTgXt+7SlWctfJYLB29PRXRicqvHUCBvYB/IKOtYrSFJjEcAA5D+hesj6pTww2
         hfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719005258; x=1719610058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B9YYJN6gO8sKB5sQbYzsaO+MvxbhNg/Nzd2XouVD5g0=;
        b=IXqOeGjnxitezX4yw61BH+C0zef03rF5LuCUpfUd7xl/UbD06gnAH2hz3MgswiiB26
         mAnCLQ2iTeQSCaBrpOMEBQw8GG8LkaIXloGqOsMhoLNmnMrqVl8XCiRjQeiC7T0/1SbI
         NYIKiy5U75e00S3KzaamUFA5hX4wGqrg/11RFwUlMLtJPtC6nbEnOyEPTGTKGnUV0frD
         FRY6zB3LR23qWosTTfYMss/SgY7CmlmrjyJYWUgzvAQSIfjSK6zAKUextxkLlFKzaArZ
         bDQz67R3IX8XT36v5SHLaJc4sjxBwgjCnoA12By0s4VXesueLOdHcH/F7P4vwSerhT6R
         CHDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXazAHjDtARO60GiKBZ79+Np9uzkZeiUBw/C7FNLp7SB5Olj+KTbCCGlxKeT6Qw38tnV5Csl/FuXBYUZ67ujJLdPSHHUw==
X-Gm-Message-State: AOJu0YzhCL2oWsYp6xBCSA6VCSv3Xdegs0nb26XjkrE0YxcOBodZ6AaU
	KyQiWDSShBbnAREBpnE0gz2Wwj8+xJVZZH5SHG2Np4MAm3lrfAxg8AbRIZ+4m0eGZLVJcXq/xVf
	5uGCG9FhOeLBd2RHTUWF0sWYa8HGOdYBYu1k4
X-Google-Smtp-Source: AGHT+IFJsXHscUZN1ArxTSIV4VXg2gnQo9OEeHipRr4oFQUE6eYw6FyYq4qABzIJaAuPwBpxGEH9hruTNr2gkbg4xXw=
X-Received: by 2002:a67:e20c:0:b0:48f:3fe2:1560 with SMTP id
 ada2fe7eead31-48f3fe21584mr2043664137.11.1719005257518; Fri, 21 Jun 2024
 14:27:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240621211819.1690234-1-yabinc@google.com>
In-Reply-To: <20240621211819.1690234-1-yabinc@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 21 Jun 2024 14:27:25 -0700
Message-ID: <CAKwvOdmYWEp8SaksnereMRPBq1q614kWJAWtcSyAeTVZ=geQfg@mail.gmail.com>
Subject: Re: [PATCH v2] Fix initializing a static union variable
To: Yabin Cui <yabinc@google.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 2:18=E2=80=AFPM Yabin Cui <yabinc@google.com> wrote=
:
>
> saddr_wildcard is a static union variable initialized with {}.
>
> Empty brace initialization of union types is unspecified prior to C23,
> and even in C23, it doesn't guarantee zero initialization of all fields
> (see sections 4.5 and 6.2 in
> https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2900.htm).
>
> Clang currently only initializes the first field to zero, leaving other
> fields undefined. This can lead to unexpected behavior and optimizations
> that produce random values (with some optimization flags).
> See https://godbolt.org/z/hxnT1PTWo.
>
> The issue has been reported to Clang upstream (
> https://github.com/llvm/llvm-project/issues/78034#issuecomment-2183233517=
).
> This commit mitigates the problem by avoiding empty brace initialization
> in saddr_wildcard.

Thanks for the patch. The links add a lot more context.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Fixes: 08ec9af1c062 ("xfrm: Fix xfrm_state_find() wrt. wildcard source ad=
dress.")
> Signed-off-by: Yabin Cui <yabinc@google.com>
>
> ---
>
> Changes in v2:
> - Update commit message to add/update links.
>
> ---
>  net/xfrm/xfrm_state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
> index 649bb739df0d..9bc69d703e5c 100644
> --- a/net/xfrm/xfrm_state.c
> +++ b/net/xfrm/xfrm_state.c
> @@ -1139,7 +1139,7 @@ xfrm_state_find(const xfrm_address_t *daddr, const =
xfrm_address_t *saddr,
>                 struct xfrm_policy *pol, int *err,
>                 unsigned short family, u32 if_id)
>  {
> -       static xfrm_address_t saddr_wildcard =3D { };
> +       static const xfrm_address_t saddr_wildcard;
>         struct net *net =3D xp_net(pol);
>         unsigned int h, h_wildcard;
>         struct xfrm_state *x, *x0, *to_put;
> --
> 2.45.2.741.gdbec12cfda-goog
>


--=20
Thanks,
~Nick Desaulniers
