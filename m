Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C971FCFE5
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 15:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736348822; cv=none; b=lvq4u9BKVAr0nQINqm/6InIxNmIYwugqHAXawUTT6bYvyZjC1FKLj0y2iVVIVi+YbCCtIj4hTa8Vo6jAg4UInyJxVEALZQaIqFeWooMTQAqa0tuYf4QKdRyjpNoSDoIRDDDbU94r9Zm612Ul3K5f1dRAyOwRzxmoSBq4FMXVfpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736348822; c=relaxed/simple;
	bh=soyxPENF5yRD/vNYDGrcMk72y0wBsij0YIRwjEDdhdE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kvyljz92Xn5muRQLoYSy7h1RPg9Exi1mLFH8egjty0ED1yh8CitYu8/1jiyV9c0d/mS24GRZwy1/tcQa2RneienXyTxiszDAw5+WB8oEoVkXvOt0F8mFlFdodltpSFk0UXcYLKlQQGpvgQFv3vC2QL1ROpEhuM3PcA8/VoiO144=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=L2XZ8Jtf; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="L2XZ8Jtf"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e54bd61e793so5747845276.2
        for <llvm@lists.linux.dev>; Wed, 08 Jan 2025 07:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736348820; x=1736953620; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYeijlJhb8/hUscYVxlFwBT9DMI5FRL4gN/jsJsz5W0=;
        b=L2XZ8JtfJsDohXj01hqXzCjJmUxIxkyVPE3UA80pM+rjm6jgZ4/u8m1Fz0YOMacPRm
         uuyMLQiruLnbK0OwtTYlpjswgPMPl/zDjeRtJoC5VXl5l5JZ8M1ccaTWzFp/eOVWt98k
         OyQTD8cliF+FZxQV8/eeH38Yh3mKaTlv+KP77IjHYp+pH/Rxt+VFt75Ym64thfRRc0bG
         G+qnR+f44o7ad7O9SfTMUSdGNiWeU59TY+GA+tUbjWFWVB91/l5/g3O0xcoo0kSz1Llj
         g0LMd2a31fvg7kzbc+IbKwGsTSzGvOc9LkeROVtigV+jK9GOCtSWFiGNTDl3irz0kLQ9
         NvFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736348820; x=1736953620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYeijlJhb8/hUscYVxlFwBT9DMI5FRL4gN/jsJsz5W0=;
        b=esdgPF1Re3XJw7sW7lvAKJWYfrERjbBNc1+QcYHe4kyEatvTipXG5QJB7aIuEtX2jc
         SZ0rc+KGsgm+umHwypW1QDk/+afkhv92CxAFyKY+h10chJhTVYCAlqv74S+7EQmrFMh9
         chb3oEq5qEDuxh1zFbUE+8tPRuPrvx+DXMxoepy3H6PVUnBCbPjdu7eWIkyBmoQiWx/m
         ESG7yh8YNuZablEZ53jcOwwfpD0aFNRRRySk06oK/1VY37HpDECKOPM/vAB+cp8lAj0/
         +JvrmDE/XiselKtaWcESGkSafL+8bNe4CbzXcPgj7rklHHv6XgL5NBnQlM8PzcudjPKr
         Q7uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEoySblVAh77krDpBW8brEWQRgLPPBrt15Qcdpm7x9ogj1Nyq+/2TBlY0J+ZAeGOrlqqro@lists.linux.dev
X-Gm-Message-State: AOJu0YxbwkCIFJXW3KZM62GEGirhtWrPZSG0jocEyaQek6d2idhD4l/m
	njsBnDtSrEAW7KNNBflIih17Vll0l9q1tzPaBXXtwzljunA8WGD7+ksEcQDXTJON03WayAGz/ud
	LBu4wm1cYCzeZkzuccsvf2gj8PoU=
X-Gm-Gg: ASbGnct0Vy9fpgHrXc2VCzuXmuCgjc1lTU/jeJBdFjxUhTX+exze8O0TjsSYaJuAfBR
	CbMR31Q86fFsndVgeh70Q6L9q9tzJRPUwsUhm
X-Google-Smtp-Source: AGHT+IGGm3l2oxrf3+zWOkjSO6t07aSjkSBoeyHSaJxV3miZwqOavRZ0KXeHI3LOettm6bkm2lsOwJ/oGS3l4akaQQo=
X-Received: by 2002:a05:690c:6707:b0:6ef:6f74:9b18 with SMTP id
 00721157ae682-6f5312a6375mr26852567b3.32.1736348820205; Wed, 08 Jan 2025
 07:07:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241216164055.96267-5-cgoettsche@seltendoof.de>
 <01df64ed8f6eb9e6f2780b5b0aa3be5c@paul-moore.com> <CAJ2a_Dei0Bg14N2E9U2FzM0OEvEQbOcTvQ76FH4Ut6JYq5VybA@mail.gmail.com>
In-Reply-To: <CAJ2a_Dei0Bg14N2E9U2FzM0OEvEQbOcTvQ76FH4Ut6JYq5VybA@mail.gmail.com>
From: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Date: Wed, 8 Jan 2025 16:06:49 +0100
X-Gm-Features: AbW1kvZf3lTwTc8MUnTJ9mwBMMlk3lMwFXegltwaB3DKwHH3bIGKFAqjqVZg4A0
Message-ID: <CAJ2a_DegsCWSB224rFVNjs7QOy0xR-k5OhoQuSvpT7w_+RD_ew@mail.gmail.com>
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

On Wed, 8 Jan 2025 at 14:17, Christian G=C3=B6ttsche <cgzones@googlemail.co=
m> wrote:
>
> On Wed, 8 Jan 2025 at 04:00, Paul Moore <paul@paul-moore.com> wrote:
> >
> > On Dec 16, 2024 =3D?UTF-8?q?Christian=3D20G=3DC3=3DB6ttsche?=3D <cgoett=
sche@seltendoof.de> wrote:
> > >
> > > Avoid using nontransitive comparison to prevent unexpected sorting
> > > results due to (well-defined) overflows.
> > > See https://www.qualys.com/2024/01/30/qsort.txt for a related issue i=
n
> > > glibc's qsort(3).
> > >
> > > Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> > > ---
> > >  security/selinux/ss/policydb.c | 18 ++++++++++--------
> > >  1 file changed, 10 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/pol=
icydb.c
> > > index 3ba5506a3fff..eb944582d7a6 100644
> > > --- a/security/selinux/ss/policydb.c
> > > +++ b/security/selinux/ss/policydb.c
> > > @@ -37,6 +37,8 @@
> > >  #include "mls.h"
> > >  #include "services.h"
> > >
> > > +#define spaceship_cmp(a, b) (((a) > (b)) - ((a) < (b)))
> >
> > I'll admit that it took me a while to figure out why you decided to
> > name this macro "spaceship_cmp", and then I had a little laugh when
> > I realized why it was called the "spaceship" operator :)
> >
> > Anyway, while the spaceship operator is likely familiar to people who
> > have a Perl background, the kernel is still mostly a C project so I
> > don't think we can expect a base understanding of Perl, especially
> > these days as Perl isn't as popular as in the past.  Can we rename
> > this to something else that makes more sense in the context of C?
>
> There seem to be 4 similar macros already in the kernel, 3 named
> cmp_int() and one instance named cmp_ptr().
> So I am going with cmp_int() in v3 for now, but I am open for other sugge=
stions.

p.s.: C++ also had takeoff:
https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2017/p0515r3.pdf

> >
> > --
> > paul-moore.com
