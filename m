Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC5E1A8F97
	for <llvm@lists.linux.dev>; Wed, 29 Jan 2025 23:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738192700; cv=none; b=ia9wFljLr3rMdv1XQbL5jS3//Qsc1PO9RsGSjn02aBvgkUbWuqV9qUzp6x93jVV5BXnMy6tJ0C4CdRszDbMHLU/Ah1C/IRS/87V6ZddWEcOydQuV7+CBgs03GFdKO/vLC0TOseZsdRnzdWtpAFn9MRa+Y9s8AsBcXHc1/zaUlzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738192700; c=relaxed/simple;
	bh=FdEplspGb/XzeqvULRF38GqEzrZONYVPkHqs9CPH1cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lpnFzxCVZ9ACfZQk9qLs+8n8ntsIy23Lbsd930/BZmN1HcsqJcwp07hWejZ+J482vco0NQA6CG9bPDah9u0nB7P+BxT5akhjsVpz8o9X//+hZ57ZFRWcNF2Yz6fq/iyN/GgJ9BeFUUP8rS0gjIwGCwfDN750z0Qb2VvBNi1BU1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvDxIK4H; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvDxIK4H"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30615661f98so1685301fa.2
        for <llvm@lists.linux.dev>; Wed, 29 Jan 2025 15:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738192697; x=1738797497; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvpZ7PmBrG3gp5YeFE37+hnKtxRr8CPClHcCzrd1MIk=;
        b=PvDxIK4H0Atz+HQ9wYyqlyrCrMVtZ56GSueedcaBxrlaj1TVTR6UA0eTk372gmGMKQ
         eElYldn0doExNkPaVnIwAUus/ZcNPcVvhhA67k00f0OGQrNt3efJe1QK5MVAMrce/zuS
         /iLiJL7/npPXmovIMkzWMaXiqv2vA0zCTpfaMzQA5fV5yOk1Vn4FWAwgiVeLNIpTNyMf
         eJU/LAozBPFgsYPXoi2XtRINDW8RuwPN+VY8oHQ2WmZSsNP4AG5+/e/QZd44L61pB/LF
         RVcjVv/d/9YGFor8tzkdg65/5kcUv5+HaYo6wmtBqKsYthLfAiffWRg6fiToo7SgEiu2
         Xzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738192697; x=1738797497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QvpZ7PmBrG3gp5YeFE37+hnKtxRr8CPClHcCzrd1MIk=;
        b=sIcM8aU3jAUSq/2BQGazhSeZqT1b0eeqdLMyh2l0Iz6UVS6NA4gzhij3D2hcPFnV/g
         GIQKIySm/T45B31u2JGnJPBBN/EFG8hi/w3qOW+DseTTeHP+ZbAmxaXkrgJtGvqfQI5h
         FxMs/L0CE7N+lg9Dcmej9k+q8T+OZHxOXT1gQnLHWkfWuv9+MlApxr0zFqbQ24wB+Iv/
         GX6IEKUf64vV0bJkBQWIgFsvS14Z90H2cF6jprZQdIlNULjngzPDoxTMiHsaoC0sHYW5
         N4Ohv8Ms2Ih9vTc305LPH4u7XoX4LiPr10UhuKKFWTzGX4kC7KBYnSeAdKj9tGpauazA
         NL/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwBnxpyckNy3Q0YGHWPvqfr31h8qQE/grLfgulbW0VXpE3VHGjjeNs/YuhyP64SLcC30Nx@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2N5TOlRfjQ4ecoH62CFYHnOaNQ3ldqq3uC25+Yuqf/DMXbuw3
	fYnIL2O/FDfGE4nLgO60icI9t3iasTiHS3kT5lwbt60gqRqCvn/bsG13ddjL4KS6+tkxvs7JM6A
	oBxjhu5mf5M7gAVLxQNalQpo1II4=
X-Gm-Gg: ASbGncvpvPNNGJNC0LWVRFII9zFOvzUHjO33uSBIDayvrq+0oRGnmuAStMOha6ivmw4
	7D14D451E6kfildaC/K+5ikHu5UU8f71+C6rgBCvr69z5IAkxuIF3fnwpaO4jYuQz+n9GpDhtY0
	0d0SY1evPYazlka1DbZvgU+6CbSxPv1g==
X-Google-Smtp-Source: AGHT+IHaAKHEaFfIIrl4XoFSnnfGpYvAmUJGb3+mGNwMi0XiBaSkv8xOXbNKQLBjZ1eD0DTNqyAy4nr7gh28RazKqW8=
X-Received: by 2002:a05:651c:50e:b0:305:d86a:4f01 with SMTP id
 38308e7fff4ca-3079696b37fmr20071361fa.31.1738192696891; Wed, 29 Jan 2025
 15:18:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAJ-ks9=hNGRFbr3sTQBma3u84Yhog7i33Oc=16FqFjE_JYNERA@mail.gmail.com>
 <Z5qzk_92KU0xoLcP@casper.infradead.org> <CAJ-ks9ksSh-r6SmKsm7iJA6nCqvrhXZ8jtjP-YoeMNB6tF5a=g@mail.gmail.com>
 <Z5q1mkliUUM5Xlod@casper.infradead.org>
In-Reply-To: <Z5q1mkliUUM5Xlod@casper.infradead.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 29 Jan 2025 18:17:40 -0500
X-Gm-Features: AWEUYZm6-Axfuwo7gaO51xSLYv-t81bl89X3xorrqlt1HmTwF2QQ0EEOzVieTek
Message-ID: <CAJ-ks9mPzb9DzteGuUSnUpasnTfYLTgxqvqZ7njWGgWqRtMe7g@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: Matthew Wilcox <willy@infradead.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, geert@linux-m68k.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, 
	mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 6:11=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Wed, Jan 29, 2025 at 06:08:22PM -0500, Tamir Duberstein wrote:
> > The whole point of tools is to liberate stupid humans' brains like
> > mine from mundane tasks like working out who to email. The tool wasn't
> > wrong; it did exactly what you told it to do in your MAINTAINERS
> > entry.
>
> Tools do get things wrong.  So do humans.  When you take your hands off
> the steering wheel and the car crashes, it's still your fault.

Which one of us is driving in this analogy?

> > > > For what it's worth the kunit invocation, while obscure, is
> > > > self-documenting. There's usage information that's reasonably
> > > > understandable embedded in the tool itself. I looked for the usersp=
ace
> > > > testing initially but failed to find
> > > > tools/testing/radix-tree/xarray.c. Even now, I'm not sure how I'm
> > > > meant to compile this.
> > >
> > > kunit is useless.  The test_xarray.c module is useless.  If you break
> > > xarray, the kernel won't boot far enough to load any modules.  You
> > > haven't thought about this AT ALL.
> >
> > I don't understand what you're saying here.
>
> Then I don't want to see any more patches from you until you do.

Yes, I see now. But it's not quite true; the patch was itself
motivated by the difficult output of the tests, so I did run this with
kunit in a state that produced a failure. Your point is taken.
