Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FD056B6A
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 21:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710193058; cv=none; b=AooxBTpy6PRVKsqtfaV2qgnr6V/7etPzt9ILJo8oBwmSBwIvR5SODKyt19OSwIj0A3cIxPlkeVv3jgR82E82u9p5tbiDLv9EVYNYgY0f8u26RVZ3BZwocxoWbrrWuSwg4Ed5/5ouiLSf4XaKRHjexJxPvWWJAhbOhlI8oMLHNcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710193058; c=relaxed/simple;
	bh=N853XvEibZN47TE1cWdHT0pEPEBWvZU8jqjFxo3kbrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwTK3U4l1onP63ZZS3fKOFSf9bOgOHrISp34sFOpjZfBCGotW76s/bPv3TRf8is1y1WDg61W6J/FdvpsKsZxL3IeP7pNc/1H6CYeR/AkHzhSdWAFY5IvI5WhOWTcAnhu0knwxGliPRi3dnWxckXOcryH8TJVvBn8/REqz7/sLZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PCAl29bM; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PCAl29bM"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7dba8bc7d7cso1924706241.0
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 14:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710193055; x=1710797855; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N853XvEibZN47TE1cWdHT0pEPEBWvZU8jqjFxo3kbrk=;
        b=PCAl29bMpG/M9OZ4hANY2E0kHSRqLNm3W8n+lrxb8XW4QG0E7wmyHJ9lFLr77TTQWp
         bnowHsn3UUhrpwvCEW3fUemdSZ8BKKnG1A4hPyf76KIQYdOwaUEz93vY5oyQyGH5+Wax
         2G+tvEbKK2nsHFc0GzmAXpTOacLbQrhiFABn8VFccj7BPB2K80jY5miDWoH0v94LTYzT
         yyAv72kF6QSx1hIFp7OFfcSbIREqbDd8OGSzEgl5cE9y9RWp3E+rW+tIoX/oP4wWs34k
         aM2L5c0btYy8wBjscaVH4k6UwGbET7z7XFG1ZZgYLJ1N4mNG0x4/H35VTwS332qb1L3m
         tFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710193055; x=1710797855;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N853XvEibZN47TE1cWdHT0pEPEBWvZU8jqjFxo3kbrk=;
        b=jzehHTEUZ6gFPlMpppLGZeul5clY6pi1dzQi2a+ufNGGRiaxGCobZ1KvgSbGW0paEE
         HWOOIYb6UxUkd9fiDyBxIv59TPoz63hjAyS6eLYvc/Vzkei6xOPXdWnKttSePALsjV87
         W2I46WYwqsQSoHW9nf027L1OUI4739qRTUjcfFjzXea7Quf7pz9nR8qZON5RB/sc1gbD
         A8zHCOxfadMfJ3x1JKCAx3rTkUF14wip4ISkULwwSvAW8hTMENz6hpmN3fCiGHUAYC+V
         zmmou6QDn3Xquh9P+zcNuyRFxIiAxdXy/crYfdNYMsR2079lLhgFglaa6I3+r0cWDsYu
         5KOg==
X-Forwarded-Encrypted: i=1; AJvYcCWYI1UGy97lgQALtj1bcJb/O6JRMiAdH8qOmRxfl7KjLv2nOWWUeYHinQHSgvrkKE5SMQuyHujIxRna5XwYlQJ9wgoXmg==
X-Gm-Message-State: AOJu0Yx+6dZP94t63JPMYvQKcFNWh0XbLuYw6zNpSZ7y8QFQgfyh+hx7
	SBfE7vt4PEPzbHCtPPj6AQEn3FdEQsk+xtdM5dK40zgiu0cB48Gy6OiHh1ObuanIpIOaxJpK1Jw
	H5Vo2ZokXhILLQMGxs08LxkaUixvH3KtMz8+2
X-Google-Smtp-Source: AGHT+IEO714s0RPucD+/UcnMHJ8QdLvtwi6hMYTW/m+TdpnEAamg13qMDQWImYMakWSE57Url1wc6pMZx9ZIWmy2W0I=
X-Received: by 2002:a67:f718:0:b0:473:799:9764 with SMTP id
 m24-20020a67f718000000b0047307999764mr5696799vso.14.1710193055495; Mon, 11
 Mar 2024 14:37:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
 <20240311-arm32-cfi-v3-2-224a0f0a45c2@linaro.org> <Ze7RNalwiZbceFxX@shell.armlinux.org.uk>
 <CAMj1kXHNK+peQUjO4dRnQmLDF+4of0F7cOTSoMPKucMT6NiGDw@mail.gmail.com>
 <CABCJKuf6CWw5Ff955H5qD1Nva-j3WJZ-5A7Rb1TyBwCaEd3E2A@mail.gmail.com> <CACRpkdbjjbRP5cED+qX5PGpvjvBEK9AxnGekVab=7WMrAPe+pQ@mail.gmail.com>
In-Reply-To: <CACRpkdbjjbRP5cED+qX5PGpvjvBEK9AxnGekVab=7WMrAPe+pQ@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 11 Mar 2024 21:36:58 +0000
Message-ID: <CABCJKuf7xmCBs8UrpEbeRtQnofuq2Pp4M=RGT4TUw1+HsvS_CA@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] ARM: tlbflush: Make TLB flushes into static inlines
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 7:51=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Mon, Mar 11, 2024 at 4:35=E2=80=AFPM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> > On Mon, Mar 11, 2024 at 3:04=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org=
> wrote:
> >>
> > > This works for some function attributes (e.g., __efiapi is used like
> > > this), but the attribute specifier to which __nocfi resolves does not
> > > appear to be usable in the same manner.
> > >
> > > Best would be to annotate the asm code using
> > > SYM_TYPED_FUNC_START/_END, so that the CFI machinery is invoked at th=
e
> > > call site to validate the function type of the destination.
> >
> > Agreed, ideally we would annotate indirectly called assembly functions
> > with CFI types and avoid __nocfi wrappers.
>
> I'm taking a stab at SYM_TYPED_FUNC_* for ARM, as we don't have them
> yet.

Does the default implementation in include/linux/cfi_types.h not work
on arm for some reason?

Sami
