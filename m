Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAE0340260
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 17:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977477; cv=pass; b=a/PVfPYEXScqgDIJOGzZMgc9A1Alf5+vTXr/J1b4UBy308+D2a+xZZRtYLsseUiQseZEIgq/l72NFND0KW8+4lSG6CLC4ZOqU3Xenp8LB17tnIk1RvC062xr4o0CAHLl1foHmZkAdzalzzvbiZLwCvCkv2Tj1cgkMaD1NccrInE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977477; c=relaxed/simple;
	bh=XfvO/nNrfp6wJ8ltBre7ekP/xZ/Y79d2E/5o49cgJb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kGXPnmm9KsswOQGjY0jLDCGLhCH9RMllpW7nY/DcSvCyWquIp2uUb4lrZi7gw69IorwekEXYYi8AAi7GaCTRzWKut3IKAzG0LcrfNrEiTvlxDdoxLPdV/SOygTEWzYZjjO+7JKYEp46EO/FoMB2OeLeq2Dm86mUVhiFTatefjFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yc9aKV7q; arc=pass smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yc9aKV7q"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94e578a0fa5so3028640241.0
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 10:17:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774977475; cv=none;
        d=google.com; s=arc-20240605;
        b=ld0uYMuTBe/4bNkorbwVy/k3Qv+WcSpZ3vic0qhcqGwKszpbIp0pmWvbN5lvIBEOHo
         BvqMJW+eoMm4gctSZWXkt8uU9QK9zUbT6HSdE/A/rsLcjdMhR3+8zXSxAn9e1y2fFRwj
         FPqLmB9JyF2LdGTfA59JCcYqGAUXQwhMvPVxDUpCqvUhnJca7BebkqxFiajaJIx9ZGSd
         7MWwv55mfUf4Z7uELF7MSkN7etP/KiGIV+HESdCk/paitcnVmiukEeyL5ySUPHi5kW8w
         mkEAWrYpvzeVsYAES6hfVIpyOxqoi/2A9QZdyLhZAA5AvxNxiQsVDsKWAqG2Azuw3JS8
         RKCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XfvO/nNrfp6wJ8ltBre7ekP/xZ/Y79d2E/5o49cgJb8=;
        fh=rfppOaYX/9jlND5bLCnOWZzFIxiMKTt/G7fD+zDwwq0=;
        b=d3uRyv2/nHmrsZKf6596bKLlAd/TDhHr35WIw8q8yYNpaLKHpV8eW7m2ZihEnNSTj9
         mZ7EXOaltGNwhZ1vlj5RV4bWM9TJidmYVxb8lfBUhxfmZnvzKb0Ev5TXL0kd6zxRrpkU
         wJ+FWa2+LLNjkDnan5l4VZT8Twj+nnsKEzEQN11jz4JzWhG+PLplCsoZTrvDoxtjgA1k
         c3DB2mKdJitWlTr6HjpOiIzQ6Bg2B3zrBkG+zR4mnzCmLkYn2R3QWMsqqMvXBAQPwBLA
         sX8Ghs3ShRWCOIxC6O2QoSgiaEz2thU01dfwqGhTBFwe2L+i5o6xmEgAHH5p9EYQALro
         vC1w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774977475; x=1775582275; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfvO/nNrfp6wJ8ltBre7ekP/xZ/Y79d2E/5o49cgJb8=;
        b=Yc9aKV7qtx3u+ABafjmH951NL2OCqDsURG46A7+Y9+qo9ocRfgMlhdU0zZNDgPgN6V
         CulMfCUKYoz6NvfGUvnDyX91XNShkjvKHVCOA7obPgzog+8ktYiiBets68NzvEV54pMZ
         IYgWvYo/rJyS/X5EYIQxvmDFnoUFodDKj41CfuG3FT36pfFpRKFX2Axfbrj61P0T8q2O
         VsWwuRMe80q2kp8auiTmvKlv7+Id8Q7hwL5elPKD/wSOlQ8sB2EmKOR7wJMjG7e7DKEw
         kwYfWhIWHLrpZP8G8hu6xLXkyufvP1gLI3EMhB4wpYWStzozGSwXylEDTES/mkNPANDv
         zl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977475; x=1775582275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XfvO/nNrfp6wJ8ltBre7ekP/xZ/Y79d2E/5o49cgJb8=;
        b=dNGe/ZVOj+GNbXJazMsnofNnSQoKzMCG3c/U6wiqG0kb2sy+MimzhyFfrw3Xqp6gDG
         lMM4eFr+/jo6hZfPYQL+Gyl+ePWpPiPgavFGlXmzMnzIgibpAHIElqYUvBEKFPeGIrQ0
         Kx6Z+fvqn4WPQyWe7lD32j28QsslUs6sd1JEIPTEnbMT8GPN1DYlB0D2ILIvRxPgv4Wf
         53oqfmIvFnjm3XS/o6/z68aBp1/dPt/xnzq0snsfIYWd/8bpmoRGeS114ht3XJ/Ro3WE
         4NfSk4J6AlC7yGybyLKquGRPacoivqtMjZiN0cHCdxhRNmMDhjZ00kKI/oe/vlFtJXwp
         pgfA==
X-Forwarded-Encrypted: i=1; AJvYcCWmVwSfXFdNrfIh64lfQmUFEaWJCkxBDQsRrY3NHmK0ZLQH0GwxoTy29wmm4VzEQRPf6YYT@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0vVpG/Me2p/qN3NKp+2UPWNQKXEnUlikbI9lovRM2piQw4evK
	ZbV2dI53j5wG4DEAX26E8Eebl22QLqNdp0xOorDld76WhigNiiB8yBOjUbd1pyZ4XK2lTIZSTBj
	LV73oz9si3uKU+pOC63JOCmkqS4YFtPkC94sR7dpt
X-Gm-Gg: ATEYQzwg9tmQXEJ37Ot5eDb1+wu+Px7RAZgs6kJAz1OytWaLmLki8bfzLntPLxdOeV4
	OV57/YbUkP3PphWaVs3/q3jUhhiKe/2y6yd0q7K+0MildXYpYVICRatMvjco/nHOfhoqVtu/U2c
	D+vJpi0ahk+5J6FjoEQcmM3WNuwPJHwd6C2zuuJXSCdaqbkWPZUcbQtdPESQC9kJ/LxGA4Jt/o8
	FIu/VI9HEPPnM6bJiVXXkN+X8U/5hnObvMilCjupGNt0OO/9Ggy8kzs6QeoPm0QfhG8H7ACc/RA
	PH4u0zc=
X-Received: by 2002:a05:6102:c94:b0:602:ace8:f20e with SMTP id
 ada2fe7eead31-60567e8d127mr40188137.14.1774977473726; Tue, 31 Mar 2026
 10:17:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
 <CANiq72mK9fz6Spmgt4js3hScqhqvZb2YP2T7tDfR0fHPDFWJ7g@mail.gmail.com>
 <CAFhGd8paijFboDVr8rJDjScob047q+zgYAs038WuVozOG0aYaQ@mail.gmail.com> <CANiq72mQPU2Uyz27mBtfT6UF4Zgoq_osodALs21kJ4qOFLVhUQ@mail.gmail.com>
In-Reply-To: <CANiq72mQPU2Uyz27mBtfT6UF4Zgoq_osodALs21kJ4qOFLVhUQ@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Tue, 31 Mar 2026 10:17:41 -0700
X-Gm-Features: AQROBzDziq6Gf2V5ut4O-Crb8XfwsiZEe1mK1jC7L_WO2ZUVxZo1u0OLGaY1nqw
Message-ID: <CAFhGd8o2C5T4_-p3zsSbygwi=yDPOdpDBPC69X=R8qoefbVXew@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 31, 2026 at 10:14=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Mar 31, 2026 at 7:09=E2=80=AFPM Justin Stitt <justinstitt@google.=
com> wrote:
> >
> > __ob_trap and __ob_wrap are defined by the compiler.
> >
> > There are some examples within the documentation additions of this patc=
h.
> >
> > Kees, is it possible to make it more clear about what we expect of
> > kernel developers in terms of style? Should they use keyword
> > spellings? attribute spellings? only use custom types?
>
> Yeah, I noticed that right after sending the email, sorry.
>
> So I tried to use a macro even if happens to have the same name as the
> keyword, since that form is a bit more flexible, but it is fine either
> way.
>
> What I would suggest is adding to the comment that these were decided
> to be used as keywords, and thus we only need to define them as empty
> in the disabled case.

Agreed.

>
> Thanks!
>
> Cheers,
> Miguel

Justin
