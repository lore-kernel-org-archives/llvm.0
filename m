Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687EC4C041B
	for <llvm@lists.linux.dev>; Mon,  5 Oct 2026 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215590; cv=pass; b=R/AAz6Xu/ZQSF8FzrZkw36tOim2TfQtB5/gIamHaJSyRzFXs4ZVGwEaEp0O0xL/qrNuDqH1ErZZuicS5qPVub4zFDHKcA8EiNUyNY/yi0wunP6c3EqDIiwUMpvBGeAs+TdYEgTw6m8OTE98zrJVshc1n+nvgjKGARb5CJAyjGl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215590; c=relaxed/simple;
	bh=+fhE2wZv1FEvlLdfLhyZ2/HtD26fmXx/IX4kZxtllpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LCV/2kgSvWJMXgJZ1WHL0m6kRUlaAbzYvEF/+TwWVS54ueMijse/ciiFWe10nWD/LW79pD75b2zKRsFx1UntNMvB1nkE/NbK1dtUHDn8dJ9BjhETgMp+BXxapdOArI00SwdJtJ6OkmxO3tft9P+HgGzEv6rAEGuipvVcyZON4YM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=csjj3BTG; arc=pass smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="csjj3BTG"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-98c67e94e53so880752241.1
        for <llvm@lists.linux.dev>; Mon, 05 Oct 2026 08:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791215587; cv=none;
        d=google.com; s=arc-20260327;
        b=NIbf0o6NaFp0JHshq/m+fj5D+1FC6HEgu252B8DijWAis9Cq4hjTMw5cSvrl6weMTs
         zOAryTuvI027fprivQzxMmMN1g7t6fGE48OkliptroicfUne62lhqMkOEKpxARvqRyCg
         hDmH+94BcMj/6T43osCKqd2PdGBSFtvGtrGQR6qXjaUc1t92MSkDDzTtMoilgSMBQGI7
         q6brSAAP0Z6yckXHbCUK2WFAY6eCTYRe0aVdhyQn/gizJCcnYgJnbWGNcmj1BqauEBwz
         iYmULxyheRS5AuOU8V/IA9H+AZ4mRgZB/6XoYgt1ndzDVsIjQEzSq2lGsnGYLJwxxQqG
         Yydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GD9Mu7WM6+mJJxlJEE231dGqw01YMMCu766c9NA+OTM=;
        fh=JH/pNlmrzJuN9hfVuz6GZZzmxMkLzwq2MvmThvrbfnY=;
        b=rJ0g9Ue9g/SGze2pYCNyM5my3/9hMHyrvNAN14S1ZdBKlWRSrCUzxX576euS3boRKR
         E9rinsfCW96YBe1FE+hSYNE34t/NadgUw7p9YTXZHAH/UE+cOCovVKeoPh2AWWJbG1T/
         wWrboYfrIC8ecP7FbEr9EKcN/NuIDC/fCjiggECDH7xwr1LDRDZahKWxHvQpTzyJxgQr
         fXZ/iQ0nCriinqJuVFNgEWGnskAkK0yr5YzLoeNDQNq2lGVNIJYnQDKpxlP9Jl6clqjG
         siVEtnc0uOCOSiZK5BH1D5YpRrRLk90/GSRbThmB1Q5AmeItQ8AZCE+MbkbFS+s4UP9Q
         4+Kw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791215587; x=1791820387; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GD9Mu7WM6+mJJxlJEE231dGqw01YMMCu766c9NA+OTM=;
        b=csjj3BTGTsXIVeD2BBIrkHnpI+I0t2h7GBVqL4jdjYujrKFvEfhfeEWx7wiVsnniAq
         A7UbrHemOCXSUM2/d8RxNbxK2/qFwEnR7weKQb7reEMtN43u/l9RuZRdIDvv+PF5pfwQ
         iFloKaTlqFRoZTLTlnHcMs2eJCfNRnFRG3qn57icIJMeE2xQ83RruXM2Cacxs4AHMXqA
         Y3KF9tMrm4BL4/JAgNwwkzH6jXroZ2QcP+jJCf/iAyo0pzzkYnpqELC+FKDGD8GYgOWA
         +z4tmC+PQOLt51BSAYnye4/M4Hktp7qwpeQzXKNpWVbBUdJdRhRuWg7GW7lfu9ukUyxA
         hWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791215587; x=1791820387;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GD9Mu7WM6+mJJxlJEE231dGqw01YMMCu766c9NA+OTM=;
        b=RkW+lQdbKPiDmtNMv91VXPk/2b3jjnGvTZdhU3HnT3s4prBlf5DGBCmZ/lfCXSI9D1
         sMBoZ7Ob93ebinstuPrnQiYH0xm6b/CFVGKkKZ4OG0GAZWA423PdA98329n+MuRd6glk
         9IOsrGkrafivOw70Q5h5l3xcLjQx/gwJ/W9kBLT0Pgbw5EZ3QyK6L/UmQCbH0eK9mt2Q
         zq+opEfxJJClY61eD1CxFbGDGmhk8EfJuJRauCrlPN+bkLpX6v150w9qRpG1+CNibttc
         PAR7Hfb2VEDmSnZFKXv2Mo+NyBGIN6OcP2xt0PIIgvfLbS8ak2NyfO3VcmUC8DFBuIDa
         lm1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxcwTKz/YIskMguQe6KGM2cvi/JVpdmjUC2DKjB/c3gQdlNE37ANOmS6UaY8cjTVFolZOdD@lists.linux.dev
X-Gm-Message-State: AFq9FYLIBpWYsDrBp1NbowK5GoP+8yflUWrOmF1I9WFMHbfyotnJ3oBI
	nyzqPk2cPGwizGeoSBFYX1AL3ezbuVx0QxDPyPQF5BGByyrULxageoRGizVeEuvtvoJZj5cPPHS
	Su00D/Tox8LuABK+cnADaP13etUhKMI04ijM44zc=
X-Gm-Gg: AYBFou3mkRxzhrpGGT+KvYftMfgT2CibYbnLbQCNiXuJJGgjZqWNm/9lOqWnZWT6slV
	z/TjF6sjy31aDE+pPm94vcuymw9O0VWu5hDayszITzf7Vl16jj1JJeTxM9PZ062f47nKbKmw/wF
	xyoTNVTqIRUZQ9NdLpMqewqo6J+XSRPNoy4sy65H+xuWMR4c+5Vi9BuBmc2vGODk6MOYJ1sJuxP
	IbCeZlxIYZLzsyVOdtK5VWsomsPZmyC3Z0M9dFPf2nflQyfnwr0/8BmjTCe4Syt14gEi8SkSOBj
	EQ7Zy+ayA8WDyf2jnXamPckUMxazvk+pJlNjDd1jdu8yav1e2ek4Zpy5LwH6x0oSdMLanggsj2U
	1aaXk1r8Rftm73dnzYtyR
X-Received: by 2002:a05:6102:318a:b0:7bf:d09:8f65 with SMTP id
 ada2fe7eead31-7c7e0cd91aamr7307137.13.1791215586222; Mon, 05 Oct 2026
 08:53:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261005102518.2400984-1-morbo@google.com> <ea6e022d-e04b-42e7-b526-ac96559b3633@app.fastmail.com>
In-Reply-To: <ea6e022d-e04b-42e7-b526-ac96559b3633@app.fastmail.com>
From: Bill Wendling <morbo@google.com>
Date: Mon, 5 Oct 2026 08:52:49 -0700
X-Gm-Features: AclHuK_Gfowy8Y-I0Ooc088gxc8QVe3LPtj8zIs2qHUBLzmWW-HnmUT4ck7UGKI
Message-ID: <CAGG=3QV+PmsOZnM7+ss-6K71nKyRLzpJirBmFQSo3vuLMqDjLQ@mail.gmail.com>
Subject: Re: [PATCH] compiler_types: Allow opting out of __counted_by and __counted_by_ptr
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Justin Stitt <justinstitt@google.com>, Mark Brown <broonie@kernel.org>, 
	Marco Elver <elver@google.com>, alan.maguire@oracle.com, namjain@linux.microsoft.com, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 3:54=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wro=
te:
>
> Hi Bill,
>
> On Mon, 5 Oct 2026, at 12:25, Bill Wendling wrote:
> > Code that runs outside the kernel proper, such as the EFI stub, gets
> > nothing out of the counted_by annotations: the bounds checks they feed
> > (FORTIFY_SOURCE, UBSAN_BOUNDS) are already disabled there.
> >
> > The annotations can also break the build. A __counted_by_ptr() that
> > names a member declared after the pointer needs Clang's
> > '-fexperimental-late-parse-attributes', which the top-level Makefile
> > adds to 'KBUILD_CFLAGS'. The x86 EFI stub builds its own cflags and doe=
s
> > not get that flag, so it fails as soon as such a struct is pulled in
> > through a common header.
> >
> > Overriding the macros from a Makefile doesn't work:
> > 'compiler_types.h' is pulled in with '-include', which is processed
> > after all -D/-U options, so it re-establishes the definitions. Follow
> > the '__NO_FORTIFY' precedent instead: let a build define
> > '__NO_COUNTED_BY' or '__NO_COUNTED_BY_PTR' to turn the corresponding
> > annotation into a no-op.  The two are kept separate but parallel so the=
y
> > can be folded together once all supported compilers handle
> > '__counted_by' on pointers.
> >
>
> I'd prefer a single macro here - if there is ever a case where we need to
> turn off one but not the other, we can revisit.
>
> Otherwise, this looks good to me - thanks.

Hi Ard,

I wanted to do it this way because the two attributes rely upon
compiler versions, and this gives us more flexibility. Eventually,
there will be Only One(tm), once the minimal compiler version supports
both __counted_by and __counted_by_ptr.

But it's a small issue. I can resend with just the __NO_COUNTED_BY_PTR part=
.

-bw
