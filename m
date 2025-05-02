Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A944825E45E
	for <llvm@lists.linux.dev>; Fri,  2 May 2025 16:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204207; cv=none; b=Z5Kzh5Wa3emjERGhazRLZuTDNO1VpqqIV6TRIZw4Uz40OpZNW9pjAp6KFoXxIpO3FYxYaY0m/a1lRPMuL+lxjk2d+r6u/yMJq2HAWTaV9YLjL/mfkJ9J70Sj4B8sjHh2usUszyrzSO8TRo8xh5lTfQKGUYHObm0u1V1rOIi4zdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204207; c=relaxed/simple;
	bh=HSWejsQUIC5AVkuX0S8B3IVpbNA6F4zhsZS0ah5X99o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=neauP+9Bn/FgaG54IDtFsitOSFOn0R1ZJekYl452hEBXwI+gJ5djW2BzfHZkgP2jD5ELDmYzv+2UhAhLWiUts7VFiqyULZ1tyo6QCDXsqXZ5e8ZWI4TILgg1HvyXIBCTqjDIYr0Q5pLNTkLKKyHg5UGC/xAybRqDX0CBuvEU1bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pCFprZY7; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pCFprZY7"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d91a45d148so325ab.1
        for <llvm@lists.linux.dev>; Fri, 02 May 2025 09:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746204205; x=1746809005; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfhSF1OBdwUfsA1pakNcUwq7Cj4Gcs5LK2vK2irHdRY=;
        b=pCFprZY7TNp44gbByyw/CBoktJgEs6IQ/sj/E3+w+hcD0oS2ha+HrRz3rn9XA5jTni
         Km7Jhg+qyN74ESL8OAL8Mxv8+piecfD7lPESnKb05HQKEUcsjNOA3uC1X7aXDlkUrkZR
         eoaKAnxr8XngMwIlwjlfsBG3rqq2eXx5oX58E2ORTsZPKXtudPVgJHt7ZXFm7O2tlCrq
         WS7W8uEJ1MIEU8+ugZTxGU22Aie8LmWRpjzZ8bZv1u2r3pmzdQlA5yfAacso41lIb9D4
         fX2wt9HRTCeXQ8+AMg8boaUQFoYZt/5Kdw3xFaI4mCbGydo5jICEPe3ZS5VW/K5v6BJY
         nDvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746204205; x=1746809005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfhSF1OBdwUfsA1pakNcUwq7Cj4Gcs5LK2vK2irHdRY=;
        b=My81WGL5IZBtTkLYNX0lxiN4aFQefndoc0IG4FNRumXbm/bB2TQaQr1NcAlYFca8pS
         iGlFf2zm/JqypFNNhPTkzri6olPdxnJGFAUcn2y9yXaSWM3G/o0VUvDlEoejslYYqIEy
         84QJl/58p9ACykog9jIULbYnv+EonjiRzo78OFDVJ1i79fxHYBjhj7iXxcGN/x3qus1c
         Wbhr/JOCE5OZ+FTj4Ma8JkiY43FeJaZ8ruDqXy2vjv0SlPPlCFAK5qOe7NbPbaZqg3Hd
         M9diWZ9P0JKNOYLNRk6FbTiFBZl5HuUg/SzjzXkF45xEed/+aY/bSYLDZ4I9+mc1mnW3
         QzHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKmTn/80tdNt2skE9svxULD79kmfMJcUijEVxflI4jhuJavsUeo29NpNmLYkhtofgiCjtB@lists.linux.dev
X-Gm-Message-State: AOJu0YzMh1kS5Je4dhmDLpHY8e2IMnZHtzMgTNSVCVx/vD59yYb/wSa8
	DF2iCoQ84gJ41+rMlSTMsa8s2xHEbRJE18S564iEA7xNAnmfMFzcu8SsbjOImlb2Rd9ahqdZYIX
	U6pOd10QERbCN9arpKnfKuUcN4gwmWboDzNSe
X-Gm-Gg: ASbGnctIJczUJBmWrIQ0FLKhPDVdW3B15sBwkaumKnSqszgTZUUXizPEWGzObLCwMuu
	qjdzzM8SCDb6gftG25fOpty1Nu5YC+HSiGwrVaSj9e9ayGd9dUah8PUFGT88/Mfl8HO8a0cr282
	wwJwnjfY0KeOZ9zPbsixvAXL0BK57uJnfAsQ==
X-Google-Smtp-Source: AGHT+IGl8Ey1mD7g9HdYk+68mf77nPG69tteIpFx6Qvv3ot7wI3HcIw7QJ3SYNwPij9nPcd00LD5BKx8PJeqjrdMYP8=
X-Received: by 2002:a05:6e02:b4c:b0:3d9:6463:a8cd with SMTP id
 e9e14a558f8ab-3d96f2523dcmr6638415ab.14.1746204204424; Fri, 02 May 2025
 09:43:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250430171534.132774-1-irogers@google.com> <20250430171534.132774-3-irogers@google.com>
 <aBTs6yvKlCYYgU2O@yury>
In-Reply-To: <aBTs6yvKlCYYgU2O@yury>
From: Ian Rogers <irogers@google.com>
Date: Fri, 2 May 2025 09:43:12 -0700
X-Gm-Features: ATxdqUEaNzyEBZLtUQ1jfImxKvfknBZnmDSgU_oST5gHw-xFYWsjcme0fXmFH_E
Message-ID: <CAP-5=fXqLh7RdUok5oqVwyGOWCH3fktmVeECdi4ENBWnEHeJYQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] bitmap: Silence a clang -Wshorten-64-to-32 warning
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 9:03=E2=80=AFAM Yury Norov <yury.norov@gmail.com> wr=
ote:
>
> Hi Ian,
>
> On Wed, Apr 30, 2025 at 10:15:31AM -0700, Ian Rogers wrote:
> > The clang warning -Wshorten-64-to-32 can be useful to catch
> > inadvertent truncation. In some instances this truncation can lead to
> > changing the sign of a result, for example, truncation to return an
> > int to fit a sort routine. Silence the warning by making the implicit
> > truncation explicit. This isn't to say the code is currently incorrect
> > but without silencing the warning it is hard to spot the erroneous
> > cases.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  include/linux/bitmap.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
> > index 595217b7a6e7..4395e0a618f4 100644
> > --- a/include/linux/bitmap.h
> > +++ b/include/linux/bitmap.h
> > @@ -442,7 +442,7 @@ static __always_inline
> >  unsigned int bitmap_weight(const unsigned long *src, unsigned int nbit=
s)
> >  {
> >       if (small_const_nbits(nbits))
> > -             return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits));
> > +             return (int)hweight_long(*src & BITMAP_LAST_WORD_MASK(nbi=
ts));
>
> This should return unsigned int, I guess?

Hi Yury, I don't disagree. The issue there is that this could break
printf flags, etc. reliant on the return type. I've tried to keep the
patch minimal in this regard.

> Also, most of the functions you touch here have their copies in tools.
> Can you please keep them synchronized?

Yes, I do most of my work on the perf tool in the tools directory and
these patches come from adding -Wshorten-64-to-32 there due to a bug
found in ARM code that -Wshorten-64-to-32 would have caught:
https://lore.kernel.org/lkml/20250331172759.115604-1-leo.yan@arm.com/
The most recent patch series for tools is:
https://lore.kernel.org/linux-perf-users/20250430175036.184610-1-irogers@go=
ogle.com/
However, I wanted to get the kernel versions of these headers agreed
before syncing them into the tools directory.

Thanks,
Ian



> Thanks,
> Yury
>
> >       return __bitmap_weight(src, nbits);
> >  }
> >
> > --
> > 2.49.0.906.g1f30a19c02-goog
