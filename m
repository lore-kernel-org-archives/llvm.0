Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94D21F2C44
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736342250; cv=none; b=O16tSY1fV4T7Uqk38MwGqYlaxnbpbBXt0dCE8Hz7KEgPSUPtx4JlsqbO/HKt1yt1WvjhRek7qM2D3oOzxn+kyaxGY6qtx6daoxX50kxeMbURs1kudgWGTIYoOPFbhJp1BhqdpNX5JocI3q9M8UHi+9+voj15mX9P5qk/jbGgSU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736342250; c=relaxed/simple;
	bh=1DK7hjkj9WV8fvsS84jZsjkUPGGpOR3faB9WFzBYqrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCULCokn3/7x1C4PXeWGESaT0s3w7aHfRblcIkk1umswCgltxiqt3vLc8X/wL35rG4bF6qz8JinyrIAu3Ihq0fYkRx1rmjJowN78IEXerIEe1Nz63TyX1pMpVReWrXTtW3fNt+3upkC6dhUuIChu4EqnJ8W/OIvy9vhFKmcfcxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=S5M4HJTO; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="S5M4HJTO"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e3fd6cd9ef7so1470255276.1
        for <llvm@lists.linux.dev>; Wed, 08 Jan 2025 05:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736342246; x=1736947046; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UxrDFJV+w/69PH6wqHMGTKMv2k8d+L16mQM9P6xBuY=;
        b=S5M4HJTOkK0lbOEl14D96YTPk7CYHOfl+0qe/dwtnzdpQGzxKhGR9YS7S5pHDB6J0+
         G3Yy6S7YDdcTjJpKR/QzMN4iTaiDyi5I+xoQHJ0sBKdklf0x9SsyIUhpRNYmnC6JIGCw
         zaAJLjew0iCdvAQhsXecwrwJtfYVx1pXgz+qRLzG1ZwZpw+J4X8fkbszPk6336I/eYBB
         Qf3SWqb02TPMEvyaYZJhkv0EcvK4XHdGKbKjRtJVzlIQms3Fc2PXlujbX9f31Tu5kTZP
         Z1RmrFmknvAEM7ljDFMkGewUk/K48pnRoBpL1QMUJJxcNGQPFvC2e4xpVjNWJY+bRxyf
         JADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736342246; x=1736947046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6UxrDFJV+w/69PH6wqHMGTKMv2k8d+L16mQM9P6xBuY=;
        b=PecdvkzAOZSRN6aK7udsxyu8txRE1UxA4bb9BSEVTlc/BcLog8i1iVGfMlWUjQ7qIP
         ShiSkbgV4f78HTVJlSyfsse9FcrSKUK0wDJGLRk5WnTka0foK7zMkM6YhxxX919wdhFc
         ysxOQ2alvgGTRwLqIRWxobe+nCNZ5a0J9chCDBRHFmZqX35j8FXSzR1rc2znvHXX4p1x
         mZ+P/DwkjcesYt26b5fm3Y8rftRi6nBWCo728c2JPKDYwDf4G2T1ry9RWLZ81+tidzG3
         QlbHosQdgOFDsCL0aMVeeqzFDVr6+OwkLYzjpEBET/96CLu8H6hYwZ2hS43cwf8f4uRS
         BC1A==
X-Forwarded-Encrypted: i=1; AJvYcCUDguVTUaF9H6bKBxllqutvXVCNmnmEI2YgK49Rp/veuu5zKRjiGA6tz/VJKTMIYeM31jhK@lists.linux.dev
X-Gm-Message-State: AOJu0YwegMtBiI5lWlY4yqAGXegLpNGG2iL39Fu3Hw8rZp5FzpD+dM3L
	wzLBSImOdz9QUk4VPeYKkyXgaviiBcasiaRD4f11nfQc1X1CzixBWl8h/aIWvhBEJ6pHmFtDL+h
	AerE2CHHu9Qh2NloR8NhfutcXDhM=
X-Gm-Gg: ASbGnctJ1ByP1KhaVWwPQZdYKupxUEUibx56NyXuf4ACWPdfzZ5ND5v2PPY7XpxTQ0f
	eukjgRT3cD+/4tFlO4wHjbipBARyFADEzWbwO
X-Google-Smtp-Source: AGHT+IH3vFL8NcJ87wcZTW/3d0PfHPFf8ILBBOdFlVLf0dVDVL75aRmm9O9J2ztwDUAFOTDx6EcYzMnnEDaGD5M+Dbc=
X-Received: by 2002:a05:690c:7343:b0:6ee:6a2a:a517 with SMTP id
 00721157ae682-6f5204a0aeamr49595437b3.18.1736342246514; Wed, 08 Jan 2025
 05:17:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241216164055.96267-5-cgoettsche@seltendoof.de> <01df64ed8f6eb9e6f2780b5b0aa3be5c@paul-moore.com>
In-Reply-To: <01df64ed8f6eb9e6f2780b5b0aa3be5c@paul-moore.com>
From: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Date: Wed, 8 Jan 2025 14:17:15 +0100
X-Gm-Features: AbW1kvZML3C0ZeA_TspCpGgfKtleODtl9U2HoYwQCftiAC2lGmbPgHkDqm6x2nY
Message-ID: <CAJ2a_Dei0Bg14N2E9U2FzM0OEvEQbOcTvQ76FH4Ut6JYq5VybA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/22] selinux: avoid nontransitive comparison
To: Paul Moore <paul@paul-moore.com>
Cc: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgoettsche@seltendoof.de>, 
	selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	=?UTF-8?Q?Bram_Bonn=C3=A9?= <brambonne@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 8 Jan 2025 at 04:00, Paul Moore <paul@paul-moore.com> wrote:
>
> On Dec 16, 2024 =3D?UTF-8?q?Christian=3D20G=3DC3=3DB6ttsche?=3D <cgoettsc=
he@seltendoof.de> wrote:
> >
> > Avoid using nontransitive comparison to prevent unexpected sorting
> > results due to (well-defined) overflows.
> > See https://www.qualys.com/2024/01/30/qsort.txt for a related issue in
> > glibc's qsort(3).
> >
> > Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> > ---
> >  security/selinux/ss/policydb.c | 18 ++++++++++--------
> >  1 file changed, 10 insertions(+), 8 deletions(-)
> >
> > diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/polic=
ydb.c
> > index 3ba5506a3fff..eb944582d7a6 100644
> > --- a/security/selinux/ss/policydb.c
> > +++ b/security/selinux/ss/policydb.c
> > @@ -37,6 +37,8 @@
> >  #include "mls.h"
> >  #include "services.h"
> >
> > +#define spaceship_cmp(a, b) (((a) > (b)) - ((a) < (b)))
>
> I'll admit that it took me a while to figure out why you decided to
> name this macro "spaceship_cmp", and then I had a little laugh when
> I realized why it was called the "spaceship" operator :)
>
> Anyway, while the spaceship operator is likely familiar to people who
> have a Perl background, the kernel is still mostly a C project so I
> don't think we can expect a base understanding of Perl, especially
> these days as Perl isn't as popular as in the past.  Can we rename
> this to something else that makes more sense in the context of C?

There seem to be 4 similar macros already in the kernel, 3 named
cmp_int() and one instance named cmp_ptr().
So I am going with cmp_int() in v3 for now, but I am open for other suggest=
ions.

>
> --
> paul-moore.com
