Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38594173323
	for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 13:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714484768; cv=none; b=OvMaEB5ztG0aiz6NmlLltIwE2EvI0W7gUERI0jki/IMdwHHtPNzZdTXt5Yo+JWoeEnMmd3NPQmcUI2uToMwdE7EIdcnNUSX5uAeYCgmKZfcl3hFLr6qcFIjH91rIBXbwuMlsCySAU7VVl528tWPCTIYYjjsYnbfYM/TK16QRFRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714484768; c=relaxed/simple;
	bh=CH9CDsDvIuMfM1O9boXvKkd0m/0NdNbiCArSpHF1l/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=clmo/e/Q6w1DcRZ+VSKO+8OrlRwrDAblTSKeNFQoWZyirovX16LhEj8inXZhH6hf7ejuH9e6pYmtbf08u8DGyqP7XOFvWvRK7MKAY2hP2A6p5LDoPqrS60cUJm8URee+HX50V5HvD2dsXTKaXO+gFpHZdNX3X1ksuEc/fH7NUI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qViAONmV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qViAONmV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A718EC4AF18
	for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 13:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714484767;
	bh=CH9CDsDvIuMfM1O9boXvKkd0m/0NdNbiCArSpHF1l/g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qViAONmVp2KTUEBXJ7+eVyJXA1EVZwT47Sb9ureu+/ldKtlpdDNjCc0tX9+wYwtwy
	 eb0kd/6y6DRcoIJIsIkMLHrlAFNxdhADEM9FZ9SogG1Rl7plE4Dea63fhMj9bV3p6a
	 SB7YhqYSNTqwZbYBHX9VLKX6Jai4P0ocg9TA9aMHq18BY1oT6ZZAicLuUzf3rWF2Rr
	 fCB08erGuN1zkqf5lvCvFshvAs4U7U1K9XO5LiGLbjgGkkT4+kYhy2t08whYsR7pFz
	 TVqf0SMqqOEHfHHNK5g+RNM/F49SXE0oKQ2IFaa3uccAffW0F+796HvpcJKwiE0Cz8
	 ymPS6uQCfbKIQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51d62b0ecb7so4519088e87.3
        for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 06:46:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVVCgE/A9ni8BsGbnNCae4IDwtbidBlKd6FqQU5AG7BV0PkEswjzey8f8jnnOsdPbINBNNhqH11eAhFqVFECoXHomnxg==
X-Gm-Message-State: AOJu0Yy9m3rG67/foroVdXUbHb5IDViARvXAHLqscHnsRRZgAx1uoAV2
	tK0kF3SkXRenSHSuGb5K65bvjsQOXHKfM/5BZErXKvvRJvJE/hdvf2dkpVAT3A/IeQz5qVeIrXl
	Jzp4AdK8C6tWPDoWA56wdPeSCGL8=
X-Google-Smtp-Source: AGHT+IEdufJuW+PzNM3OgK5MhPTHqgKDk/FueUglTBfCHcBF1RYtwcPNbMfMSzXnpMTN/K9DFpoNPc4ht4nXcsgc2EQ=
X-Received: by 2002:a19:770f:0:b0:518:e7ed:3c7c with SMTP id
 s15-20020a19770f000000b00518e7ed3c7cmr9849840lfc.14.1714484765860; Tue, 30
 Apr 2024 06:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240430-arm32-cfi-topping-v1-1-4cb6a15552aa@linaro.org>
 <CAMj1kXEfQYMk-PHBDBJS-LxTcx72+6ZZVffGtnoiHB4KcdoaSQ@mail.gmail.com> <CACRpkdYq5SON_ANbEHgvzBuTQd8zkY1M5dEATgzqz1j7W58pdw@mail.gmail.com>
In-Reply-To: <CACRpkdYq5SON_ANbEHgvzBuTQd8zkY1M5dEATgzqz1j7W58pdw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 30 Apr 2024 15:45:53 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEzgTrDd3ShmPo8gE7D1QFmSn5G3La=xaCTJo=B01FT+A@mail.gmail.com>
Message-ID: <CAMj1kXEzgTrDd3ShmPo8gE7D1QFmSn5G3La=xaCTJo=B01FT+A@mail.gmail.com>
Subject: Re: [PATCH] ARM: Use conditionals for CFI branches
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Apr 2024 at 13:45, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
>
> On Tue, Apr 30, 2024 at 11:19=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org>=
 wrote:
>
>
> > These functions are only called indirectly if MULTI_CACHE is enabled,
> > right? If so, this could be
> >
> > #if defined(CONFIG_CFI_CLANG) && defined(MULTI_CACHE)
>
> Hm Sami may know better here, but with !MULTI_CACHE the
> functions are indeed called directly, but does that mean the
> compiler will not emit some magic bytes in front of these
> symbols then?
>

Ah yes, of course. So that wouldn't work.

So the alternative might be

#if defined(CONFIG_CFI_CLANG) && defined(MULTI_CACHE)
SYM_TYPED_FUNC_START(v4_flush_kern_dcache_area)
        b       v4_dma_flush_range
SYM_FUNC_END(v4_flush_kern_dcache_area)
#else
SYM_FUNC_ALIAS(v4_flush_kern_dcache_area, v4_dma_flush_range)
#endif

Of course, unless anyone has an interest in building these older
platforms with Clang and CFI, it doesn't really make a difference, so
perhaps we should just go with your version.
