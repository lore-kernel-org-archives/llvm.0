Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A7312838C
	for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 09:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714469851; cv=none; b=dyhwj4pBnlq8A4dJRfLDicCL3neMqeVvyUufGohexmqWGZgzTvru5vKsFUsBNoqFvFCiXJ0T0ukhoSIg3IXCCY3kflwWN0Zk8dOj4zpsS9guE9u8L3tHFdrbckCoxsllLzlP++aroDxFxQzv+jBj3sey+fpecZILx1JB1NEpn9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714469851; c=relaxed/simple;
	bh=RK7MVzHAlT7XPnJeGYAU/VUh3YlQqJzA8v7yzwLuntg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p+gQYr+iN12p+FJXnxQrWMyd7PqTEgZFTFr25y0Hopg9EtHZ0UX3Jecr+7pCHtWpkFgKeinnwcDd9FRvdrZ/A3CeuhkGIysXfFcYGBJwIsduzzi8nCr1sk+jle5przg3qBgOPdDisWkr5oMA/koXjxR8mP589iHKLufHfMC6Rxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XfWvnIov; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XfWvnIov"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7107C4AF1C
	for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 09:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714469850;
	bh=RK7MVzHAlT7XPnJeGYAU/VUh3YlQqJzA8v7yzwLuntg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XfWvnIovn3oK4XsAcNmDi7aeAjWk2EtwcXBgb+GAxBwhUBLsLDjjRS7UJ0V6e90OA
	 UJ0ygyUFKL33M+HVW9iP4OOHK+5sH3qqEqJaIqWLbK4cKa7Et3FpA/qcnRZqqeDcd5
	 /nZWJ0VF1aBNM6A1bv/tGREJQIyO/7ntFsWndU3Mv016b7Dzm1FpSPP3LM8stLlNob
	 jq1UkabzYrp9Z+I5upovFoRE9q7EbkQx/SFnWjEKp+vYPcRbcYR4b4KssaitYXbKGo
	 8U5940xdol/CPIU8B95rHPRyUYimICgZ76+WEVJnOKvoZX8aY1yFWm31c0Az7Xji9f
	 aCpaUPE8Vc/Gw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2db13ca0363so87193071fa.3
        for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 02:37:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvx/lM1kQ+R3xAsTs6RsgAbQD7cyUh47PxGSWyX7Kb/zyKzC4h27ms6eLCBPSoUI7YuxlyJRLViOTAN7r9U/KKNhcYWA==
X-Gm-Message-State: AOJu0Yw9Eo0Ut+QT/69DW0lu84X6yvYHv7+Q+xJpto8tV0yexx4k2PkD
	9/QDWHSyOFUPJ0FRIzuALgRFibWKnoXtQxfVsDnjEnTvVrFFpGx99dtOj5OB82igb4ouJg6K90M
	9LNKcEnHoDM1O4FHxtoAtVmj06JA=
X-Google-Smtp-Source: AGHT+IHFAHRZkZ9XbjEdLc7xU0pc5QKL3sBU69X0EnuCqeSrsdfBkfanK+/k7wGjRu8x/Mh5NEKpJik0ppGJ5ANYwoo=
X-Received: by 2002:a2e:9145:0:b0:2df:b2d5:5935 with SMTP id
 q5-20020a2e9145000000b002dfb2d55935mr8052194ljg.28.1714469849063; Tue, 30 Apr
 2024 02:37:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240430-arm32-cfi-topping-v1-1-4cb6a15552aa@linaro.org>
 <CAMj1kXEfQYMk-PHBDBJS-LxTcx72+6ZZVffGtnoiHB4KcdoaSQ@mail.gmail.com> <ZjC4iL7lAvReKbx0@shell.armlinux.org.uk>
In-Reply-To: <ZjC4iL7lAvReKbx0@shell.armlinux.org.uk>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 30 Apr 2024 11:37:16 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHBMT9FLFoxtTJU+SKTtqmzdwvYRFOFLDA+VUTkLyRBuw@mail.gmail.com>
Message-ID: <CAMj1kXHBMT9FLFoxtTJU+SKTtqmzdwvYRFOFLDA+VUTkLyRBuw@mail.gmail.com>
Subject: Re: [PATCH] ARM: Use conditionals for CFI branches
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Apr 2024 at 11:23, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, Apr 30, 2024 at 11:18:55AM +0200, Ard Biesheuvel wrote:
> > On Tue, 30 Apr 2024 at 10:26, Linus Walleij <linus.walleij@linaro.org> wrote:
> > > diff --git a/arch/arm/mm/cache-fa.S b/arch/arm/mm/cache-fa.S
> > > index db454033b76f..4a3668b52a2d 100644
> > > --- a/arch/arm/mm/cache-fa.S
> > > +++ b/arch/arm/mm/cache-fa.S
> > > @@ -112,7 +112,9 @@ SYM_FUNC_END(fa_flush_user_cache_range)
> > >   *     - end    - virtual end address
> > >   */
> > >  SYM_TYPED_FUNC_START(fa_coherent_kern_range)
> > > +#ifdef CONFIG_CFI_CLANG /* Fallthrough if !CFI */
> >
> > These functions are only called indirectly if MULTI_CACHE is enabled,
> > right? If so, this could be
> >
> > #if defined(CONFIG_CFI_CLANG) && defined(MULTI_CACHE)
>
> I don't see that makes any difference. Whether or not they're called
> indirectly, the symbol is the entry point to the function. If called
> directly and the useless branch is there, we'll incur the overhead of
> the BL instruction flushing the pipeline followed immediately by the
> overhead of the B instruction flushing the pipeline again.

That is not what I meant.

I meant that, if you decide to enable CFI clang for these targets, you
still only need the branch if MULTI_CACHE is enabled.

IOW, we can avoid the branch entirely in even more situations.
