Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A513C3C
	for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 10:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711537132; cv=none; b=KTu02MGnL2Ntc7cqTTyJNIUAzdrdYg1KJdwlYPRautFpTIiGRy4sg4+ShBd6rcX3wj/cZsLs1DdzjvPREq1C2vbqBNCt/a0ioGlOgCSyLlJyCvt8dxrrhVQTqQelDWcbjFE9vkyXe7r7o4jaiMmvB5qMZ7XaxGpao4cOIUnlWYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711537132; c=relaxed/simple;
	bh=FPOIGS3XU/PJpUjx1JSgCVFLz7sjFzTxaraDc1Cj4iA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t64uLlr6bZzyFQSD8oHuCpe5bxwUrU7w7U+Zvs75QDA1wlt5MU/VoSaLB8PT4Nwt4yK549eKa3j5pkDap/jUWd62KLHivseZ84fpYZOhKo7JxomDb/7JJ8wfefjTBTwoS5IKhxOuiADL0iazaEppimjB6Oia3JAWHz7F4geuQek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuDpIcMR; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuDpIcMR"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a450bedffdfso760210466b.3
        for <llvm@lists.linux.dev>; Wed, 27 Mar 2024 03:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711537129; x=1712141929; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdBJoZMB+M+m7as7ulZ/MHo9uJhY03Nr+jTBbOpnN74=;
        b=MuDpIcMRJe15j1OmSr9VsyHSwPB/4szqLBeFDMZO86J+HpBugibb0y540/uI2wcXRj
         XnGepdA4AxduCF5ytWXgTKv4wuqoCVc2jy5uykRH4nETg6+1a2etQCBLslEeRbZa0pIZ
         Vd08Hf++2braAiV2kEwJ/MnH2XWnrVeWf/UpwXf00oMSPVSvcD7wv8MR5xDXy7yi4U0R
         P+aLpDv4QfxlswLHp1ZJbkcrsg4kE2UXEc1IoLrzsluqxVn4TyR0HrReE+/JH/H5GIrd
         bi6cXGPSX/xdXiOECvE6/LhxV6ZtMN/GRxwyUwGgpGw/CLMrWFUelBWSMoTNfSWUBAnX
         5wcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711537129; x=1712141929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdBJoZMB+M+m7as7ulZ/MHo9uJhY03Nr+jTBbOpnN74=;
        b=WXP++Zpi73V5bt1OEcDUqGNLTeG/EDwm0CjAUZtFxJ1r3aXq2sP2kEpAp6KPHa7n9/
         L10lTxs+Edup+V90rT56FDA0OBnO+xMBZQYYvQAGCJb5G+8cdmsHJEfqg5hgFlGh3PB7
         UWFgFoO6AoTAhIXUkvkZlD1oKUYTQ3beUaCslzn8fDNyuDUYTS0CEvQERwJvkrwVVm3o
         SUmr0nG8umR45D5AGIb9lIC8xm8YADQGh6/VhRsGwRm/9nK2A+gmmU+LJkL20eZKz1ZI
         mUfk+vlt0cGltuH4wMqee0J0nM2vGcq6kuoWMw1BB2kw0VY3LlJMiPwgsTFxKHNeiYJb
         m4Zw==
X-Forwarded-Encrypted: i=1; AJvYcCU0uHn8zZq6Oq3UARdirkmL3/gTZl1fIdoBr6nJk2Qc7CpjKQyRifr+GKkL8YoDzEcsiK3AOZldxLd+oDqZwywZPzMKPQ==
X-Gm-Message-State: AOJu0Yz609JDd2WxhPeVMG/+1nH0rD7zDaSedKHc8n0Wrq5/54eiFmY3
	vnaV0F3CVRB1b0WJY/bxs+H8Wja4n4gzweEsklMWP0YLkC3/5d7QoaRsbaOqE3a/KUTNnJwEZ2I
	oPANnrSOQWbcmMZNbHmAlF9k/15w=
X-Google-Smtp-Source: AGHT+IE4QWniaYBGdlfiIo/PIZxypR+YNDlj/T7yCI0n5qUoLGvcU9GGoY+74iIG6sH3olcGanSfCKapfSKQJzLoh9I=
X-Received: by 2002:a17:907:9689:b0:a4e:dd7:4e24 with SMTP id
 hd9-20020a170907968900b00a4e0dd74e24mr35601ejc.23.1711537129044; Wed, 27 Mar
 2024 03:58:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240326223825.4084412-1-arnd@kernel.org> <20240326223825.4084412-6-arnd@kernel.org>
 <20240326230511.GA2796782@dev-arch.thelio-3990X>
In-Reply-To: <20240326230511.GA2796782@dev-arch.thelio-3990X>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 27 Mar 2024 12:58:12 +0200
Message-ID: <CAHp75VeTq=eyumbRWiQeLnpbTOZJR=R_7=+RkKtY2YcL-z3isQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] surface3_power: avoid format string truncation warning
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, llvm@lists.linux.dev, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 1:05=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
> On Tue, Mar 26, 2024 at 11:38:04PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > clang warns about printing a pair of escaped strings into a buffer that=
 is
> > too short:
> >
> > drivers/platform/surface/surface3_power.c:248:3: error: 'snprintf' will=
 always be truncated; specified size is 10, but format string expands to at=
 least 12 [-Werror,-Wformat-truncation-non-kprintf]
> >   248 |                 snprintf(bix->serial, ARRAY_SIZE(bix->serial), =
"%3pE%6pE", buf + 7, buf);
> >       |                 ^
> >
> > Change the format string two print two less bytes so it always fits. Th=
e string
> > is still truncated, so there is no change in behavior, but the compiler=
 no
> > longer warns about it.

> > Fixes: 85f7582cd484 ("platform/surface: Move Surface 3 Power OpRegion d=
river to platform/surface")

Hmm... Is it really a move patch (which by title should not have
changed the contents)?
(I haven't looked into it, though.)

> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> > Not entirely sure about this one, as I've never used escaped strings, a=
nd
> > don't know if gcc is correct to warn here, or if the kernel defines it
> > differently from the standard.
>
> As far as I understand it, this is a false positive because clang does
> not understand the kernel's %p extensions.

Yes, %pE here is special. Btw, what has already been discussed a long
time is to have a validation plugin in the kernel to check those %p
extensions, but IIUC nobody committed to it.

That said, the patch is most likely incorrect.

> GCC does not warn for
> overflow or truncation when %p is involved but the clang developers
> chose to intentionally deviate from GCC in that aspect while sticking it
> under a separate diagnostic that we could disable. I sent a patch that
> did so some time ago but I guess Masahiro never applied it...
>
> https://lore.kernel.org/20231002-disable-wformat-truncation-overflow-non-=
kprintf-v1-1-35179205c8d9@kernel.org/
>
> Consider dropping the changes that fix non-kprintf warnings and
> including that patch as part of this series.

--=20
With Best Regards,
Andy Shevchenko
