Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4EE8562A
	for <llvm@lists.linux.dev>; Mon, 29 Apr 2024 15:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714403227; cv=none; b=pnqHqJ5eAz9xALVPrDZehsZUIVelGlwRce3nAQMx/EUisKIHd2crhpws/OJPfxIwPtNjB20VWXUM2As5LCcdzz7+nbr9pc/0pTo34apC4/hhDpNSH00jZWUQxsKIRuLm/CijmWqMeRm2PSWxZ8Ft3B92fhd4ekW6jlF/P1h8/OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714403227; c=relaxed/simple;
	bh=0JYgX1qA1W4ZLudvKteG/DYJnsxxWbXiPYC+i2aketQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JjIClQWw5IGmR6U6/xz8b2ntmmt/2r8z8ZDSSB0nwu/f86pRApHGHWXzBoY8EPgXm1GGmiMhHX0sVantOSqbGWo7pnYjrhTSzopiSiw+BLyX0TPdWQ9rXluH3LjJRDG30HDFPPDhAd4s1Rf/IdJDitFeCaqRdOUejm1DNMPPdy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ng5VRd2+; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ng5VRd2+"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6ee35146ac5so511217a34.0
        for <llvm@lists.linux.dev>; Mon, 29 Apr 2024 08:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714403225; x=1715008025; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/3/AIEKRNxtG8SH1b1eYhk0J5Vd9GZYsd778pyChQM=;
        b=Ng5VRd2+Ig76aKxnJ9woNAlfSp2uVZ9xAMaVtlUngKJw3UzJ8XNabphvoCmhVdd/IX
         QHXz48PasvWWqs5xDxju9JYPApPU+nHs2l9MfMOLqcGtvSNDwh7XewLgfbbph5wAC5K2
         TkBXw422QVVgsQbAIlcULc1cv7IvVXLS77I5HPh3++lsMxER+MpbfeuK/TB5FNgTJdUC
         JXs/DsZMGy4TGXtuIis7cqN+tl2p5NUdE2TK4mxbLYDL4sgFGCg0a9gbHGH3iP6O3T68
         w4ahFskCzY7cBCDGDpD6jEd3Crx7dnfQGzPQH18Cd2WqYeZClMT9JmuPaiELhI8mOwG1
         q0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403225; x=1715008025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/3/AIEKRNxtG8SH1b1eYhk0J5Vd9GZYsd778pyChQM=;
        b=C7MPcm4vKg7Rx8wMbqB5l6KrdRA8q8enAbn3YtOduiCC2Tdw73VZ9Q1CNEHrQqNBA+
         TBHoFY9mls7v3e4WlJgvQrg1bqCFtzwI2aYgKu0oFjwbEAVZkNakzue18T5+xHtG30uF
         xZOwilbRY2pKAyWLBl2fGbdtpHHierPfCmEqcM5xngeHMtetWkEgDjkBhNZJ/sDvYw4r
         UFxDQA+uyH9dPaxVveaQkSdx4Bnm+pCzZ81txHdEH5mvFHozc1IvEEhRGlFL0om5oCGl
         gE8S2WnDUQoihhf/qD8bkEZWhqA5l+O04rabzOneOpc9h4nRgqxaR0Wr0aL/GFgqGFgm
         Q6nA==
X-Forwarded-Encrypted: i=1; AJvYcCW30B6U7uMvBtc5gf+BfN9zRmGyHpthoIkXPiDTPJOWHKbh7Lte5S4/1exuiT1fYzW59rK8KnSniSukQKhouv11e5klDA==
X-Gm-Message-State: AOJu0Yz8o6lokdkSu/TVyP9TzSPUhzrT8p6gT04EaogW+n22JgNl8wi0
	M5jm4t0dcf4+fLdm5glZARytnOCLLBkkYt2USUddJcM1yUsxI8dvrQBBEg8E0IVKXtuKUjC69OA
	i3zgNaD1+gRuvwGM8NjH8jlbxcLscm+9t8jTZ
X-Google-Smtp-Source: AGHT+IGDvxtDt28YXkCVPRny1yQRbCHvAUQh/bjNfHozRitWoApNwKMTXrUUBfGQCIioVhxvZ3co5DSmEh5o2YdtrEU=
X-Received: by 2002:a05:6358:78d:b0:186:436a:c686 with SMTP id
 n13-20020a056358078d00b00186436ac686mr12147482rwj.25.1714403225051; Mon, 29
 Apr 2024 08:07:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org>
 <Zi+e9M/f5b/Sto9H@shell.armlinux.org.uk> <CAMj1kXG_oLtPMEhnnpQjJUSgFnJv-rP_yC-BNJRr+aC5eycnWA@mail.gmail.com>
In-Reply-To: <CAMj1kXG_oLtPMEhnnpQjJUSgFnJv-rP_yC-BNJRr+aC5eycnWA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 29 Apr 2024 08:06:26 -0700
Message-ID: <CABCJKufirsoiOyPKfsD8NeTn=F5ZNGVe=ChNDfbwXbdp8tqQrA@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] CFI for ARM32 using LLVM
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 7:54=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> On Mon, 29 Apr 2024 at 15:22, Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > I've applied this to a separate branch, and it should be in
> > linux-next by tomorrow.
> >
> > As mentioned today on a previous iteration of the patch series,
> > I'm not all that happy with the introduction of delay-inducing
> > branches to solve CFI issues especially on the early CPUs where
> > a branch causes the CPUs pipeline to be flushed - thus making
> > branches expensive.
> >
> > Can we make these branches conditional on the use of CFI?
> >
> > Didn't Ard mention there was a way to do this using symbol aliases?
> >
>
> Yes, but only if the prototypes are identical. Not sure why Linus
> decided to keep this separate, but 9386/2 implements this for
> flush_user_cache_all() vs. flush_kern_cache_all().
>
> For coherent_user_range() vs. coherent_kern_range(), the return type
> is different (void vs int)
>
> So we could either make coherent_kern_range() return int as well, or
> alternatively, we could emit the branch instructions only when CFI is
> enabled (as in that case, SYM_TYPED_FUNC_START() expands to something
> that prevents a fall through)
>
> E.g.,
>
> --- a/arch/arm/mm/cache-v4wt.S
> +++ b/arch/arm/mm/cache-v4wt.S
> @@ -108,7 +108,9 @@ SYM_FUNC_END(v4wt_flush_user_cache_range)
>   *     - end    - virtual end address
>   */
>  SYM_TYPED_FUNC_START(v4wt_coherent_kern_range)
> +#ifdef CONFIG_CFI_CLANG
>         b       v4wt_coherent_user_range
> +#endif
>  SYM_FUNC_END(v4wt_coherent_kern_range)
>
>  /*
>
> AFAICT, SYM_TYPED_FUNC_START() does not prevent a fall through if
> CFI_CLANG is disabled, but someone should double check.

Correct, it's a normal function entry without CFI_CLANG and falling
through should work just fine.

Sami
