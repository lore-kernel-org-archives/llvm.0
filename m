Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57D41DD88E
	for <llvm@lists.linux.dev>; Fri,  4 Apr 2025 11:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743766563; cv=none; b=Mh/gTvf9zbHDXaNQpLuxF+44IcauzXlO09RHnbKXCWv9yFXn96irJN1JmkhomVueq12KRyrcpRwOythSa/ZXan32rNzFn1UxQ4X1LNi16mxlsOPZ7AVcAvU6VmpcyoDmnXvawsAiTVst8eG/xXQ0PL1meNLVYGTNu5lkv2/6oIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743766563; c=relaxed/simple;
	bh=VESalJP7ZL+nitnbDAWdGop/8vGDiwf3xv7DdkO+lzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=upoCsOdxWPAjXFNq0CrWTh/Z1ju0vTJRhGmLAbTQZIjjf83sAlhIIYuVHHVYfWdOmUPqGcZXr5/iSZ+aN0O97GcDej1Sq0Z+TaDbAd85RvcFwEmeMtmgzGiKu8LwSEX8+Zy2Bv4OFiZUdv1ThQWbqLlMf4eYuEBebwaZBpChWRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ky+j387e; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ky+j387e"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2264c9d0295so170655ad.0
        for <llvm@lists.linux.dev>; Fri, 04 Apr 2025 04:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743766561; x=1744371361; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eyajWB+7jjTPaaR8yZhZbdWh1p1RlxmUfHflZtAUUo=;
        b=Ky+j387eSi822yzzM+DJeXe1MdYwQavo5t2hS3u0S9HF/DtIhgyiLXgnz8gXaeGREo
         RrdzMphpPf9hvw6gcj05qpGW5fit89b2ttEFKAAw4DjKf85GztpNcC+1h4DGsEzyPWFb
         H/0CkXoEAsbbjCDur76a+JzqJn2jwq/LKpqWY1s16Vdau+zFo6Pt0ksjJ65fjnDa8xrw
         FOWt5TfDP1HLjBn35z665peZ+8vdynPbskSkBRMGJJHT5DPBP0sJqPRvDlj4+h+l6e7u
         /ZCfhQAcsARsQZKlRMndLvkjGH3R11cLxBfzmkvZ3Krcw8cLfiNKoboOmxZ5cY556KZx
         +8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743766561; x=1744371361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eyajWB+7jjTPaaR8yZhZbdWh1p1RlxmUfHflZtAUUo=;
        b=rXkT8xv7uSHgZ0zEB9rpU0fTyHc1niC7hL/ZiHY4UUFN9rb7bCW2m/79JnkOAnOcgj
         uLEgZ4wUNSn3WB2qnvrSIsVHA1EMFH2WjllKa0ylns0/NQM79ZjPUT6oUqXJcMvY+ddS
         BGZlUVErVgTj5K2RfvwC3bUjRt97tRcg/vno1oAkTCX5NXzRY0Gco9qrvqZXTjvvT4jM
         sUiZTmgXx/6kRk9IKS4CQeLaTFQ55Y38LdbmbDj9S9YWLWRt9Pn8wzL13UvGJpsL78W7
         RrNHYUIhoCkc7spOznqXdySVy31TfJHgaq3Bpitgavvj9iBH4Qwsav+i6YMeTkT1qQdV
         T9gg==
X-Forwarded-Encrypted: i=1; AJvYcCXiL0LQXdGl5/OxsYI1ClfDQe6WwlVFhnmMn5MkkTkw1dz7nqjB08sG9PxmCh3NKSHlA+sh@lists.linux.dev
X-Gm-Message-State: AOJu0YzH+opVW55SGzrHh0ilwHhasHtuEMZZYTaf9AkNK4BJmHBI8yRE
	XWsHnRiet9wmYVq5AkrC08vu68MfiijXBvfgys5opKTdHDWsRqUE9yXEJmeX1W6v9O4ZkT9CNQZ
	BOmrWbS/LJJS4RGpQ5vpmVnpyTY+3rH6oa7+O
X-Gm-Gg: ASbGncsq5Ml20ooGSKSf+Y7Z5mReh2txPvoDL+QZaf4HICuPt/B6mkZjRm5su3eCOb3
	3zuFXQ5vMSOrVMjOe5nSOQr9Y3mokxGs6Pc35kA/uSjnTsrPJXCCvdlNq7dyF7CEVpuBKratr2s
	P9L1sSUx3b+K3NO6GjiaNzNimKTO0=
X-Google-Smtp-Source: AGHT+IED3d7Nee0RkFeQ/TfMnvqofVxnmkzP6wrLXFrYkWR2UjtCec6EbIVzIf0i4xh5ml+5Sm4+57ZZZARaNgNjLIY=
X-Received: by 2002:a17:903:1cb:b0:215:8723:42d1 with SMTP id
 d9443c01a7336-22a89eabbecmr2670415ad.10.1743766560729; Fri, 04 Apr 2025
 04:36:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250403165702.396388-1-irogers@google.com> <20250403165702.396388-4-irogers@google.com>
 <48a734d3-0920-402c-afab-f4f205cd6b0d@app.fastmail.com>
In-Reply-To: <48a734d3-0920-402c-afab-f4f205cd6b0d@app.fastmail.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 4 Apr 2025 04:35:49 -0700
X-Gm-Features: AQ5f1JpD8IxezKIMQJr341eabN5TwcT9DjE5US16IXc1hwT1GroRon_SXxjDvaQ
Message-ID: <CAP-5=fUB=UWcrX4JJg5skJ30_mQTy4TwWVU-=g99WSjTg67Eig@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] bitops: Silence a clang -Wshorten-64-to-32 warning
To: Arnd Bergmann <arnd@arndb.de>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 10:43=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Thu, Apr 3, 2025, at 18:57, Ian Rogers wrote:
> > The clang warning -Wshorten-64-to-32 can be useful to catch
> > inadvertent truncation. In some instances this truncation can lead to
> > changing the sign of a result, for example, truncation to return an
> > int to fit a sort routine. Silence the warning by making the implicit
> > truncation explicit.
>
> The fls64() function only seems to deal with unsigned values, so
> I don't see how it would change the sign.

You are right. I was trying to motivate in the message why building
with -Wshorten-64-to-32 is a good thing, and in this case we're making
an implicit cast explicit.

> > diff --git a/include/asm-generic/bitops/fls64.h
> > b/include/asm-generic/bitops/fls64.h
> > index 866f2b2304ff..9ad3ff12f454 100644
> > --- a/include/asm-generic/bitops/fls64.h
> > +++ b/include/asm-generic/bitops/fls64.h
> > @@ -21,7 +21,7 @@ static __always_inline int fls64(__u64 x)
> >       __u32 h =3D x >> 32;
> >       if (h)
> >               return fls(h) + 32;
> > -     return fls(x);
> > +     return fls((__u32)x);
> >  }
>
> Maybe this would be clearer with an explicit upper_32_bits()/
> lower_32_bits() instead of the cast and the shift?

It feels a little overkill to me, but if others prefer it then it is a
minor change.

Thanks,
Ian

>       Arnd
