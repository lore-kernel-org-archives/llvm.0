Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA2F23B618;
	Sun, 29 Jun 2025 19:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751224518; cv=none; b=almVUm+kdPlc4bjh5t4glQowa7xa1w95k9BKvzL9emAFS4XjGgJpOjxte+ExDYA4gpvgdpLKbRlyXA8QVO92s4Hg7T1nzU8UUD43rJJPeJSZpGWSw0vYYk21Iac5Yss+8Q/MTHFTKl4rQdaOgNOEynBOXjjJOxeXFCgxRi5ixJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751224518; c=relaxed/simple;
	bh=nA3MXBps3409L4F1Tl6lV76sgIZsFK+ko4yqfWlQmyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLf9Q6d9e7U7h9lnRuxNx4KRAj4ShyfampjXfA23C1nDoTEGtlVvTKc58j1N4SEzGGKpocCpWdU977F86hdTi6Ne/AVUaOzFonZZdg6D7t59szJrTjJjojoOxJ+Cp30uMQ5fwNrbwYuBiAi0H2ftTBG/oqKDCz8EtG4e879/FJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AK3ad8Xb; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AK3ad8Xb"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae3703c2a8bso248147266b.0;
        Sun, 29 Jun 2025 12:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751224515; x=1751829315; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nA3MXBps3409L4F1Tl6lV76sgIZsFK+ko4yqfWlQmyA=;
        b=AK3ad8XbKIWXovMevQUjcX7MsaFIhZjtMBG6jejasUtQ7KPAzUuYI5Gd7QhoRxJ9Pk
         LcSu4jALoGKDicSUBA04MbFt8SF4012IRMArSAcEsfi5ALMvvlp+r81UXrcMMI7+ioKi
         +sqAEafiUaGOPmwKoiDYh5su1LJvtnIGJtZR6hUydrRMuRhUmPs8+BjpgLCgrex8wqvQ
         9P2X789Vs8Ncjc4jyUthawwl0FCKMu2Ps4YMbUcjMHbTOrZGfwNaquMeJgdaeGGL+ST0
         YmPvL+jiqo42uRc9oXSPYgw1CloKED3UujGDfZlHhU0wwMkQHNUh+f4TdgOB5hTaFlR9
         Ek2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751224515; x=1751829315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nA3MXBps3409L4F1Tl6lV76sgIZsFK+ko4yqfWlQmyA=;
        b=XlVb66lfrgR0v2Lk7keBJqPXOIgJ4lRBa5WeReOTFGmmcw0139f2tjipoKO8qcBYhS
         IdVUKzjnVs3JQ5UtqWOUeAbipYL2M154uLKDPIXkuPEYAz9HbS7FEPGXuLGz0h/eP36Q
         8u7i06EvOtY00PqH1wDvhdLVivJcvsZcY8JMvcCGOCf+pxK04XWntOJGhpqZmyNZNqfP
         j2z8anb1pyjyVYA/n3DuPPX0MLZanN68eJ7qRdHh799x7rftn6SjxW3qKfbbUh3tVdV5
         7avzugD/rtWrUYt/xxe1W1GOibt7YC1/D7jh5/hfFuDS7M8ozaKA4ZJR3BqM9r2QS9KR
         AKag==
X-Forwarded-Encrypted: i=1; AJvYcCWZ1IbCbbq8uPXHAWsGhRgH2m+1zVQTGjgZg5Ve66PVkn3eSrJRQp6dyMo0JM9YA1yuNO7bvGifM94f5pNF@lists.linux.dev, AJvYcCXjwkzMhtMrs828ZOOFkHkTtbvZ4SzT+BnwBXZ2+PQVmewCKZYL4T8gkxN/bJgrS2vFvR/9fg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxk81AB0ojFNMEhhxv0yoJEeFn7QaLNB2CKbsvGkxBudb+/7nDe
	NyRRE9M1jJ52QERSZoGlBdvIacZtzpcEgIP/76nUT9IU1JMfhHmFS1h3viMSZYKieBjgUhv5xX2
	tlp1t3FuLJYpSG5y1jGPnYHAe6eqIxM4=
X-Gm-Gg: ASbGncvj5T5bxQJgg61AI8I/UKHeJnIYKYzPUl1OybigvhxVX4Vi7wl6/NL+Art5bKm
	GOaxI73nbXOAbqTE+L9DObi3p4j73/5972VRr5Vmmj0PtGT1f/hABE0uazp15zbx+oJceLbqh/O
	Upq0LDtTqHFWilg4BnqA0LSPo99YbI0xCWtcjOI6AHUKw=
X-Google-Smtp-Source: AGHT+IHVLeKPvjWhLiEPl0f2FVlhTG8fSUCZfh+VEwlG/bHm3jjxUD6UhJ42wGzBGMVKWRIdPbpJKXU51NRWNY9Lvt0=
X-Received: by 2002:a17:907:96ab:b0:ad5:2e5b:d16b with SMTP id
 a640c23a62f3a-ae34fef316dmr1106599366b.27.1751224514565; Sun, 29 Jun 2025
 12:15:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250629113050.58138-1-zaq14760@gmail.com> <092f5109-ca31-4949-bda8-7e0d946c3aa0@kernel.org>
 <CAKEtaPAr6g5bGFwPJZXRHN6p9u5SrUo3kQi6Zcpp7hbFCp-J2A@mail.gmail.com>
In-Reply-To: <CAKEtaPAr6g5bGFwPJZXRHN6p9u5SrUo3kQi6Zcpp7hbFCp-J2A@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 29 Jun 2025 22:14:38 +0300
X-Gm-Features: Ac12FXydlwNxphQQICIaM92cAbX2WVQiWOlAM9z1fp8Uu1oKuuhB6Lx6O4rANHY
Message-ID: <CAHp75VcPzq9XrFD29+uZ1rbFcDxb4UbXNkv_QZ=3iyVm3dxyPg@mail.gmail.com>
Subject: Re: [PATCH v7] staging: media: atomisp: code style cleanup series
To: =?UTF-8?B?546L6Imv5Lie?= <zaq14760@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, mchehab@kernel.org, sakari.ailus@linux.intel.com, 
	andy@kernel.org, gregkh@linuxfoundation.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 4:02=E2=80=AFPM =E7=8E=8B=E8=89=AF=E4=B8=9E <zaq147=
60@gmail.com> wrote:
>
> Dear Hans and Andy,

First of all, please stop top-posting!

> Thanks for the feedback. I'll wait for Andy's opinion on this before
> taking further actions.

TBH I don't know what I can help with or should do. I expressed my
worries already in one of the previous emails where I suggested to
check clang-format and then when we see the first attempt of using it.

> Meanwhile, I understand Hans' concerns about clang-format changes and
> I can prepare manual cleanup patches as suggested if needed.

Or you can try (without sending each time the result) amending output
of clang-format, or you can do a set of scripts based on the problems
found... Take your time and experiment more, no need to send a new
version every couple of days or so.

> > On 29-Jun-25 1:30 PM, LiangCheng Wang wrote:
> > > This series applies clang-format and fixes all checkpatch.pl-reported=
 ERRORs in the AtomISP driver, excluding the i2c directory as advised by ma=
intainers.
> > >
> > > The changes include:
> > > - Applying clang-format (excluding drivers/staging/media/i2c)
> > > - Removing unnecessary parentheses in return statements
> > > - Removing unnecessary zero-initialized globals
> > > - Fixing space issues after unary minus operators
> > > - Wrapping complex macro values in parentheses
> > > - These patches focus solely on mechanical style cleanups with no fun=
ctional changes.
> > > - WARNINGs reported by checkpatch.pl were intentionally left for futu=
re work to keep each patch clear and manageable.
> > >
> > > The full series and corresponding commits are also available in my pu=
blic Git repository:
> > >
> > > https://github.com/lc-wang/linux/tree/b4/atomisp

> > > Changes in v7:
> > > - Split previous monolithic patch into multiple smaller patches
> > > - Applied clang-format to entire driver excluding i2c directory
> >
> > I took a quick look at just the clang-format patch and looking
> > at the bits of the diff which were not collapsed by github because
> > the changes are too big, it looks like the changes which clang-format
> > makes are useless and often make things worse, e.g. just looking
> > at the first diff which github shows for:
> >
> > https://github.com/lc-wang/linux/commit/8a3bbdba275e42dfcb0af2ddcc2f274=
63bb316d2
> >
> > which is for drivers/staging/media/atomisp/include/hmm/hmm.h
> > then all of the changes are undesirable and unneeded.
> >
> > so the running of clang-format just seems to make things worse.
> >
> > I appreciate coding-style cleanups outside of the i2c dir,
> > but it looks like you need to do everything manually since
> > clang-format is just making a mess of things.
> >
> > Also if you do manual code-style cleanups please do one
> > type of cleanup per patches, e.g. only fix indentation
> > using spaces instead of tabs and do so on groups of say
> > 10 files at a time to keep things reviewable.

--=20
With Best Regards,
Andy Shevchenko
