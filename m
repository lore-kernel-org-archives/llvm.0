Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F299352F82
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 19:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710186668; cv=none; b=etBdEnSHpWg0oUm9Ray/MjDGmCemTRvciEa02oBy/y5xCapS//vfVuwhoUYQ97qzHwbhR3/u4bpflFBV4uwRXMK1lwr8JMbtz+6L1nL+sVqdGiDMIC3OOMFo0tYtHJZTwUUAEr4szRpwdkyChVoSfc2KtK4T2gyvwn0D0yiGu0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710186668; c=relaxed/simple;
	bh=Rk+yR5unQIY4XylpeSSJoC2LTlqJA9Q258wTaNmoT/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kBTvijN7WmxRFiPzTMQozrZT2PMnyvJaL0mxurryWe2gv2RANtGKsJV9eO8oB1p7Og48+iKilWiVxdQjiNoyNUPv8hUJPagpImzosApBA++JfPVtFyNQUtWG/h122CIsjN4gHjARJkBJ/EpjxVimsu0aGA4/+56Ryo5sNuslWnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=It90D7bg; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="It90D7bg"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso3705205276.0
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 12:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710186663; x=1710791463; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rk+yR5unQIY4XylpeSSJoC2LTlqJA9Q258wTaNmoT/o=;
        b=It90D7bgSN4jF2lyVBIghpYhiGgU3anP/z1XIY9jXaeoO0rkd5GX3Y0RfS987UOIMF
         7Dbe8uK3Mn/Rv3hODgu+uAaIP+3B7vK+bNah52zurjkAH3Qn9Cij3IF0VfZTh1RWGUrs
         /bcrqbayCw4KY2GNIPNmipANpQAckP8o7QcK46+MUncWuZIZU4c4L4ZlG5MOAsKZkdl+
         cDAYDJHFJVR5ng3tzNagcMKTruk1plh8OVXozphJH1uPMRrTvRuvb5nwXM6f61kTdS61
         vYHUKpgSrbD7nOxpj0TPg9dieZ6VrZUOptaiNI26RDQeAyCGP/RVzvwv3Ym0JGeK8O1F
         Cj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710186663; x=1710791463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rk+yR5unQIY4XylpeSSJoC2LTlqJA9Q258wTaNmoT/o=;
        b=wkCtFP30UjU9oYe0e+lQM8PdqXogyYP3ET5LZgYl+PdSwHH9LmtT3Oa85aBJ6FXMFl
         MLhaxukcaLpXXBZM93gBYQQ0nvdmhEE7Gs79VKkXKP0Xf/dZnzmT5D53twI0PQ7Gatsb
         vNWmLPvweeRjxQAkvII6Y21fDsYZsMRtf31RQ2jqg9WxlPjlofIDfSOkjfDT7CidcVRs
         1TO7fTJjF6Bw/nzrFzYCoRNVCcud+F+OYtJXYYYm4Pz4EGy1dJqHKv0PYEbauEg3TAcl
         TDcls4meAWBV1deStbYGUBISL3OlUa81rCEqgnXBz3V9w2g2yDdIXB49NOqG5wXsOF8T
         IIhA==
X-Forwarded-Encrypted: i=1; AJvYcCWfgGq8EAvp295iP0VC3RPj3V2vdlWWlabkdgJSiHwmPtf5RiaFr+f8vBW9Vj2nTKgACmENL27rM++Q2AK7yH4jdFqqCw==
X-Gm-Message-State: AOJu0Yyiu7HcLdapfnMOJZH5zTw5CV5G6j4two+RilUfkBXM7nxAmWuz
	dlQlJZu1+ThKy6P4ZeyyITAxyoD6klGNo9Pi6/+AHAo39qfXeCDv1H62pEW1e24kP88bWEGP3vY
	7ydqpE3l28v3QZHW+sEFhQrmf2oK5DQzJKicZEQ==
X-Google-Smtp-Source: AGHT+IEPshGtL6B1pVPxasTXmlinkxfEj+Hq0lnn3l8pgEEiZwPylH+0kiULHKKbYyN/aw1XGsoEut+OPV+s4dh/jj8=
X-Received: by 2002:a25:41c1:0:b0:dc6:daa4:e808 with SMTP id
 o184-20020a2541c1000000b00dc6daa4e808mr6044247yba.12.1710186662977; Mon, 11
 Mar 2024 12:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
 <20240311-arm32-cfi-v3-2-224a0f0a45c2@linaro.org> <Ze7RNalwiZbceFxX@shell.armlinux.org.uk>
 <CAMj1kXHNK+peQUjO4dRnQmLDF+4of0F7cOTSoMPKucMT6NiGDw@mail.gmail.com> <CABCJKuf6CWw5Ff955H5qD1Nva-j3WJZ-5A7Rb1TyBwCaEd3E2A@mail.gmail.com>
In-Reply-To: <CABCJKuf6CWw5Ff955H5qD1Nva-j3WJZ-5A7Rb1TyBwCaEd3E2A@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Mar 2024 20:50:51 +0100
Message-ID: <CACRpkdbjjbRP5cED+qX5PGpvjvBEK9AxnGekVab=7WMrAPe+pQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] ARM: tlbflush: Make TLB flushes into static inlines
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 4:35=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
> On Mon, Mar 11, 2024 at 3:04=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> =
wrote:
>>
> > This works for some function attributes (e.g., __efiapi is used like
> > this), but the attribute specifier to which __nocfi resolves does not
> > appear to be usable in the same manner.
> >
> > Best would be to annotate the asm code using
> > SYM_TYPED_FUNC_START/_END, so that the CFI machinery is invoked at the
> > call site to validate the function type of the destination.
>
> Agreed, ideally we would annotate indirectly called assembly functions
> with CFI types and avoid __nocfi wrappers.

I'm taking a stab at SYM_TYPED_FUNC_* for ARM, as we don't have them
yet.

Yours,
Linus Walleij
