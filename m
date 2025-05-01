Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DBC1946DA
	for <llvm@lists.linux.dev>; Thu,  1 May 2025 21:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746133934; cv=none; b=HE3g5hkfS8Tq/GDNwY7pfCfb6ka5OeSFMe+QUin4gwjDEHYkshQwpakq7PD260CRojhMWWp1wJQ6nYHtvTM6erVZYz4Cfl46scr0fJA+u3EIp4omWWReFnE4P5HCsRmV57Vjz77L3bbsriCTZxBJgypAdQT3FHSK4PT1e/aLWKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746133934; c=relaxed/simple;
	bh=/Eb23qJBhyHlMhuJZd/Tff5w9BO6SQY+7OdWqtn+OBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+Neh28jWKej2Tvflat58gkb65PJtFnFD/7Zy8S18D7gLIRqF8+y8v3URCy4PXcSNEwpxxpn6JPl3Isp+7p/FvKu9rzV1quGWQXNYf518Br5oHiaEUjH5VBxNOj/Sz87HaoqFd6jbY5v0Xmv0wLL7b5H12CgBcOePkPn516Wba8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=saO1HrLa; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="saO1HrLa"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d96836c1c2so41525ab.0
        for <llvm@lists.linux.dev>; Thu, 01 May 2025 14:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746133931; x=1746738731; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCZkInUa43XvzVkTgrWtsmIIL8E2slTp2+RlsbLPc/E=;
        b=saO1HrLa/sZ6qbJfBexA7L8sr7JvCklJQG+YQAxu/xvF8FdQoZoosV+Xt99kTV3jq+
         CHg6MUzyUTgdw4LvYRo2mq1Q+64EMRcVnYGlI8uYIDfJeqNKLfqTQGsfjwBa1AnqQl1B
         UlM/hL7NeihR6VcGF6NqtalUAvwzaQ7UTzZ8V0hHIxV6nCaKzxFhKjnvrSjKObePhmSr
         EUtz/Ci2/uSwltjIGGZAPh5QkEqzu0maO+KX9nUHTPIYbEqr8JtJjRhMvjZrx8fpWItO
         0AIAhvrxw3gnuPXdvgEEzews8LnDT3iCRFkkwqn0gVCxRni9KR5xPVJUb71iuM+5HPUr
         vGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746133931; x=1746738731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCZkInUa43XvzVkTgrWtsmIIL8E2slTp2+RlsbLPc/E=;
        b=d3ZHZWRDcCJCAroA/KVsFQ1QQshxOeN8wRcAIfO5JpVDE5/dQqCmjEGXIabhTNTBZi
         AJ5rk7czSrFsk1rU/IGS7QwvPOoAExIFgTx5Idos9sU3A3B7hTqDCjjUOBfMMFINc1TO
         CNbxHXkCMNTANHqnPRyDt1dbOueUKPsqpxkJEnDi+kjsFKYcGOAmRpkEylZwOlkKjUSM
         2tpNgtmb1PQuD6Wx0NFiTzdm8EDbbdBEm4hbY+30uEMNr1MNjlUAvRpMqF3wVKks2x4E
         3aREiKms2a3mHIwfWtYE26VaS8FO8Wf53yDEw77PsYv5Uiv2mkmpudMQ26aaV1MhEyGZ
         dHdw==
X-Forwarded-Encrypted: i=1; AJvYcCWCAtQOq1Ca7XigVbwi5VpteSqSJbNpo7oBNX2YnX9U3x/8A9WAKG6KJb+dkCxEfTevyGik@lists.linux.dev
X-Gm-Message-State: AOJu0YzZsBrVthDT8bXfMoQDtHqriJVj5I1y9YAgmSajmG6jRPmPIUCM
	1sE7N54s/6w7qb5FZ4RjbH/w1JReqlpe0twght35PqCkO+FYTZ+UVIBszyV0d10S0C7nSAfbPNs
	eTIsaDs0BJ/Oyhz4s6ozZHze/sLYcARd61kqP
X-Gm-Gg: ASbGncvzhYR/qg+DizLY67kKEZ7273v+oO3Qb+hN2GvMS+hLFWCfoJF66YmmpL7VA9H
	m5WQnyB2mqFP7KTRDLAb7hoBqikVcr6UcpJ7IUTYEhbdvPoDmuNpbDbCrgwSVuUVJH1ufwMl3fO
	A3o/XIGj/WotUhijXk7P2Lj2p3rw/e1+EiKDIvezxBLcvbWyqIKURJjMYMGKp5yw==
X-Google-Smtp-Source: AGHT+IE99CKIC22IVzgDs015sHGpd/5BSYT3SVvkHXeo8sNfxIPZdJFCnU5B2adsGYjONhE7TymIKB+d0HAj2pTW8Zw=
X-Received: by 2002:a92:cdae:0:b0:3d9:6cb3:d6d2 with SMTP id
 e9e14a558f8ab-3d96f22d89dmr4887205ab.4.1746133930728; Thu, 01 May 2025
 14:12:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430171534.132774-1-irogers@google.com> <20250430171534.132774-5-irogers@google.com>
 <20250501210729.60558b33@pumpkin> <CAP-5=fXrhsZYJwjJzqb-zMg+UoC-bKoYCjstq8yD9wHNCfbS5g@mail.gmail.com>
 <20250501212659.7e642411@pumpkin>
In-Reply-To: <20250501212659.7e642411@pumpkin>
From: Ian Rogers <irogers@google.com>
Date: Thu, 1 May 2025 14:11:59 -0700
X-Gm-Features: ATxdqUFxaht-zoWQknlLFZvQ7KKBfBCHWsnBwcRW0qV3e-0LXiEzKSMCN1_1aBg
Message-ID: <CAP-5=fVjAR0g=wN8sWetHoNWdoDVGNoKb8d8UdwxF_te=wmMLA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] math64: Silence a clang -Wshorten-64-to-32 warning
To: David Laight <david.laight.linux@gmail.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Jakub Kicinski <kuba@kernel.org>, 
	Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 1:27=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Thu, 1 May 2025 13:15:30 -0700
> Ian Rogers <irogers@google.com> wrote:
>
> > On Thu, May 1, 2025 at 1:07=E2=80=AFPM David Laight
> > <david.laight.linux@gmail.com> wrote:
> > >
> > > On Wed, 30 Apr 2025 10:15:33 -0700
> > > Ian Rogers <irogers@google.com> wrote:
> > >
> > > > The clang warning -Wshorten-64-to-32 can be useful to catch
> > > > inadvertent truncation. In some instances this truncation can lead =
to
> > > > changing the sign of a result, for example, truncation to return an
> > > > int to fit a sort routine. Silence the warning by making the implic=
it
> > > > truncation explicit. This isn't to say the code is currently incorr=
ect
> > > > but without silencing the warning it is hard to spot the erroneous
> > > > cases.
> > >
> > > Except that the extra casts make the reader think something 'extra'
> > > is going on.
> > > For readability you want as few casts as possible.
> >
> > Agreed except when not having the cast can introduce bugs which is why
> > the cast is always required in other languages. Consider in Java:
> > ```
> > class a {
> >   public static void main(String args[]) {
> >      long x =3D args.length;
> >      int y =3D x;
> >  }
> > }
> > $ javac a.java
> > a.java:4: error: incompatible types: possible lossy conversion from lon=
g to int
> >      int y =3D x;
> >              ^
> > 1 error
>
> I'm not a java expert, but I suspect it has 'softer' type conversions
> for integers than C casts.

Sorry I don't understand what you're saying. Java certainly has bugs
in this area which is why I've written checkers like:
https://errorprone.info/bugpattern/BadComparable
For code similar to:
```
s32 compare(s64 a, s64 b) { return (s32)(a - b); }
```
where the truncation is going to throw away the sign of the subtract
and is almost certainly a bug. This matches the bugs that are fixed in
this patch series for the perf code, in particular an issue on ARM
that Leo Yan originally provided the fix for:
https://lore.kernel.org/lkml/20250331172759.115604-1-leo.yan@arm.com/

> I've been badly bitten by C casts that make code compile when it really
> shouldn't, or incorrectly mask off high bits.
> There are actually loads of them in the Linux kernel.
> As well as all the dubious min_t(u16,...) there are the (__force ...)
> where the compiler shouldn't see a cast at all (it is for sparse).

Are you arguing for or against checks here? It seems to be about
casts. I'm not getting you.

> > ```
> > Having -Wshorten-64-to-32 enabled for building with clang would allow
> > possible mistakes to be spotted, but that's not currently possible
> > without wading through warnings that this series cleans up.
> >
> > I also don't really think anyone will be confused about the purpose of
> > the cast in something like:
> > ```
> > al =3D (u32)a;
>
> And no one is confused by what the code is doing without the cast.

Someone who saw that `a` was 64-bit may assume from the assignment
that `al` were also 64-bit. The cast is making explicit that you want
to throw away bits after the bottom 32, so I'd disagree.

> We live with the 'integer to pointer of differ size' warning,
> but even that was only really useful 30 years ago and is well
> past its 'best before' date.

You want C to be weakly typed more than it is? Not sure and it seems
we've drifted far from the topic of the patch series.

Thanks,
Ian

>         David
>
> > ```
> >
> > Thanks,
> > Ian
> >
> > >         David
> > >
> > >
> > > >
> > > > Signed-off-by: Ian Rogers <irogers@google.com>
> > > > ---
> > > >  include/linux/math64.h | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/include/linux/math64.h b/include/linux/math64.h
> > > > index 6aaccc1626ab..f32fcb2a2331 100644
> > > > --- a/include/linux/math64.h
> > > > +++ b/include/linux/math64.h
> > > > @@ -179,7 +179,7 @@ static __always_inline u64 mul_u64_u64_shr(u64 =
a, u64 mul, unsigned int shift)
> > > >  #ifndef mul_u64_u32_shr
> > > >  static __always_inline u64 mul_u64_u32_shr(u64 a, u32 mul, unsigne=
d int shift)
> > > >  {
> > > > -     u32 ah =3D a >> 32, al =3D a;
> > > > +     u32 ah =3D a >> 32, al =3D (u32)a;
> > > >       u64 ret;
> > > >
> > > >       ret =3D mul_u32_u32(al, mul) >> shift;
> > >
>
