Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994366;
	b=SLfw/uJaGDqa4SIDvsk88mde1mm6xkoYzOh2PoTxmC71goUpbuQvNXlfKcprUoOvF5yl
	 Y2NU2uUuQ9Kh080b6TUPeKY6jiW5z7XMw6IQeEP3kAhP137lV6gawZkdOyrP+BabmFeG9
	 XehL64MLvRs+zt8+7avT+PD9FK7X5V2y2NayjqE5A2mo1CrjpS7bHABKIJ5/Ai7IM35zc
	 rZ+pssSlJ3IlqumT5CDu23h3AlAOIO8nEfkaJNMxLoIZREoMoGgsFwPB708coAQvzmAHM
	 7+UVXSbp34r9yPRjpT01W4pwHnQLZdbZogXjeAhikw7thj3oevcOdEo4u+4Y518in8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FJWXDTr7Z5MpSyOdE1LeYV/bbbLocx7Wgu/XQXU9+kw=;
	b=i3q5RsD4o8TsSzfQxZEZIVI8YQiAcONDZWNnN8TNJVa8DAyZKr7IsBTOrAGe1bRdCvAa
	 MUNdNRI2P0hnDprT7TnQBiaW7VwrHInhxxD76AdevCvc7i+Yg1DoLXm//MffxhiLD2DsA
	 lVnD4O4WTZUMmJETN9hXowgEgFb14dTMHZ1INKgphd4Rd1XsZBpuEJJI31pXMVlT5mH6P
	 wYH/raKpxWEWrKlIsTNTCvolSwyTi5OY7WPKjg1B+0w4sqF0cjVhDPnpgu2EnwCEJNSIS
	 hwrhHPFhk0kjIMbwLjsBcCJGk4hZ9v+1FvQ6ymHFw6YapNyo/lLhZ0enpdIwnKjmFCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA0F606A331
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 19:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BA0F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4ceb15dfd7so121017166b.2
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 11:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793994363; x=1794599163; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FJWXDTr7Z5MpSyOdE1LeYV/bbbLocx7Wgu/XQXU9+kw=;
        b=lQ52RWo4BmcuvCQ/mWc/1leU23upV+DcYlziAXEqBDdyYYf1DDehZzrzl1RRQ2UoNW
         gO4hw+ds6RYlP4Rn0tpmTqRer3ezuRrS1Tz2WwYs0C0H0vBnn5OmZTZ/tJZjGo7nI2HW
         wWMJ4KH5h80fmqvozPg46z4DWlxpnrveiR8Hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994363; x=1794599163;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJWXDTr7Z5MpSyOdE1LeYV/bbbLocx7Wgu/XQXU9+kw=;
        b=OuPjmbdBWsQ2Py3yh+Sx9tf47Yblixgk4x5R/J4C/tMJUNuy3xMP01J7cSBY40pDs/
         oqwJNR5eOYI5ocMRzyzv/pllKIqGBx61TpAP0F/4SpM6lpCFjzjCM0RcPtF9g9Te6IHr
         rUpc2zRC46+9FVRNfliZptQcEUXa6X/Io1ZCBgCrwFe3jWiL6pMR7aU55F9zNTkjLJR0
         8xiDVY/h6mWWbBmyt6yH4tNNAi+46S1GKTFBKCEt1CIhcW5JF/KN4sXwh+K/2VW1J56w
         6D0HgXhU7oa/CD4KrtKlMBdCPHZ5fonCdsf+5lzmwdunio8d5828l/R+wOJMv6Wtblvu
         MjNQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvLtgD5XrCVf6/cOvVph00zcb/tou4frG5EfPeO7KCvfO+3R5wHm7H3nwCB1SSMi+nO6jT@lists.linux.dev
X-Gm-Message-State: APuU4Z/o86UcJKG9VUQZuaMaEEU7cRLSqgOZFFsa9T9UDxVGbEJ07SLM
	LEcAd1n3IFGbzZ+hmeBFRuiNX8fJY7ETNUMaUaLp8ZmodTQ/ATQr3zN9pBjUc2snpqYpQTo/dTw
	3UOjdNR+3
X-Gm-Gg: AYBFou2vnjk27uHctNZslh7pI1sGOVFeTQKAiy3BF4XT7C5hx4dYF6k9JRph1YTT8FH
	TWVYIHEmwIZXVhZ/oaLCAd0WfJ4YOBbCDKdtsxOYxeBlGkO6AFNnybijB6CeZDsTf2brPnezSJd
	OnJAQbo9x/xpl+itTK6plOAQV/Magdaz5WHpZVsdopipXUZo0cnbX1AE2uvf0K8hFHbYZsr8i9b
	ZqBKqhMgv0FmV8ABxtesq6+63bRmYZtp7HN+HSJkXjJPqQaYU+vKxnfswtWE55+ceiOQHNemcR/
	K3VqRxdmUojAgqnI85N+b6IiBXh0AIvTvp75KgBz1pEs7RS/27uv6HI8V2zyDl+iHKVuF2Lop4q
	oYoDNBW9/udL8+rFKYF/vtx4HmivLp3wGTgr1lcbRG4wBsNA8BVH0Ho81buEUWvt5aHeYOmnGpr
	whpYRaGzSmZQFQb00Kklt8N1tLS8C1wXGhfDEV8byV/4uj5nScprt0wWfNe6OltGMOeYIFiL0JX
	XhtEFwKeE+ewYwO4Bb4JjVxQDG7QI2O6bc3gWGUuXEgsyHUpWhQhMAIpUMK97RsQ74Cp1zy6PDc
	TKOs5OQ7uaG/feYLmREPSwJ/0nrU7oseFjZ4NzhA3z9+UBfqiMABjNhjfmYCqqvH15k=
X-Received: by 2002:a17:907:d91:b0:c4d:31ad:9dd5 with SMTP id a640c23a62f3a-c4d3553550amr278353366b.42.1793994363350;
        Fri, 06 Nov 2026 11:46:03 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3569de19sm101561766b.45.2026.11.06.11.46.03
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 11:46:03 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4ced671398so130291966b.3
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 11:46:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz8z6GfEeeAkjA2U3UFsSERLOvDWeK7b4dkM58HhBu0uaOxUi2n+sI2sXhq3e4JgPPayoCE@lists.linux.dev
X-Received: by 2002:a05:600c:8b01:b0:4a3:5a7b:6002 with SMTP id
 5b1f17b1804b1-4b6dff841afmr64687555e9.28.1793993975424; Fri, 06 Nov 2026
 11:39:35 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
 <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com>
 <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
 <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com>
 <CAF1bQ=TWZ=u1h92Nt9NgGcaDNTo=BOHmUp1DCWEeUMfwBb3WhQ@mail.gmail.com> <CAKwvOdmTaMQf4Wyk_sygaushmMd9dRR3xPZ6K9rbKYB25uz7jg@mail.gmail.com>
In-Reply-To: <CAKwvOdmTaMQf4Wyk_sygaushmMd9dRR3xPZ6K9rbKYB25uz7jg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 11:39:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WHjRTmAd9XO4HaenLWH+H+CEPzQzT=LBrtczeLQjKbZA@mail.gmail.com>
X-Gm-Features: AclHuK9tP02VsIUFVmusvGUU0-cT9m0zdYlZ-nWofELLkEPHJWUUFL-DsndX4ZI
Message-ID: <CAD=FV=WHjRTmAd9XO4HaenLWH+H+CEPzQzT=LBrtczeLQjKbZA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Rong Xu <xur@google.com>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Han Wang <nesthanwang@google.com>, Snehasish Kumar <snehasishk@google.com>, 
	Nilanjana Basu <nilanjana.basu87@gmail.com>, Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 6, 2026 at 10:17=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Nov 6, 2026 at 10:13=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > As far as I know, Profi is enabled in the Clang front-end initially. I
> > remember reviewing a patch that enabled Profi for the Rust front-end,
> > though it's possible that has already been merged.
> >
> > It seems strange that these flags diverge between C and Rust. Could we
> > add a comment to indicate that Profi is currently not enabled in Rust?
> >
> > Rong
> >
> > On Fri, Nov 6, 2026 at 10:06=E2=80=AFAM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > Hi,
> > >
> > > On Fri, Nov 6, 2026 at 9:43=E2=80=AFAM Rong Xu <xur@google.com> wrote=
:
> > > >
> > > > Just one thing: I think we should also have this flag for Rust so R=
ust
> > > > and c are consistent.
> > >
> > > Please see the commit message, which says:
> > >
> > > > RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes beca=
use
> > > > SampleProfileUseProfi remains false by default in the LLVM backend =
and
> > > > is only enabled by the Clang driver.
> > >
> > > Is that incorrect?
>
> Probably better to be explicit, rather than rely on the implicit
> default value, which sounds like it may be changing over time.

Sure. v2 posted here:

https://lore.kernel.org/r/20261106113800.v2.1.I0b27923381ef34cc99cdf8b65fea=
2e1bafce6370@changeid
