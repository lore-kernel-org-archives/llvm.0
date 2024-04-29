Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE15280603
	for <llvm@lists.linux.dev>; Mon, 29 Apr 2024 14:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714402492; cv=none; b=Eq7veAYt4F/Yn+bpBkWkqjuoSEWdfXjwDJzXsAynoLx8Ss7MTLCBrdkEH6onPH2dID5NFdtJz9FX1855Sm4xLDyLJqGgUJ0wGwyFTrRo+uavlWx3ixmeUIEC3NaXzEbt0ls9Lie5RVzMm86MVwCuztCWVbB95Y4V2+d5f5BLEPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714402492; c=relaxed/simple;
	bh=8DM51W9tiEcmuXpPGhHEdCnkLqP13qpOgpuxXtHOJRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KBjC5B+lH4v4DgPh80lvsiBSQzCaU9yO+nWRdKuh4XtEmMvOQHxpu6F6BJXVgdVqHaLNnIXVEdlPZiM67ZWCDTTArsN7FMTbozPY79sGWG/jQ7rW8aQfAGoYdxMLta5K3mE2OVWyj1D+oa3GtJmudisA8FfPUW9L8D7sz/dZilU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnHKOw/c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnHKOw/c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C55C4AF1C
	for <llvm@lists.linux.dev>; Mon, 29 Apr 2024 14:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714402492;
	bh=8DM51W9tiEcmuXpPGhHEdCnkLqP13qpOgpuxXtHOJRE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qnHKOw/chkWBVUxojZ3Qz88v+gbaupxa+gUAyZ3/NTPFthiXSS4HxNrLvNDUBbrwl
	 E2WkPUa64wOYlYbDlNX4SxR0mU49917IMLzpHBYKLjN4/afSpcJUPF5SLl5YUzA2Xm
	 zAZX1trphPOy01xwhFwsj65xgkieIHYYEobCiyb46XSDTti/KcJct7ENEMs0jhigka
	 s6oe1Rld9EV2+vuLDCWTHr+pPW9vmkJRLKFtljXAV+4Wu032PgzE7oNVC+e/MHg/mC
	 dR8qwPPe0e3PSUpcqmixp5O2V5prQ7pxBTImoCl/hdIe3Ds2KCjElUN2Lyqz4l8DvJ
	 Qmd6Zt4EqI/qg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-516d68d7a8bso4235116e87.1
        for <llvm@lists.linux.dev>; Mon, 29 Apr 2024 07:54:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIrwJZrM5t3qQbSCv9v9vJD9wsrT3iryT2hn+cMLpkTgj2qp15XMRUQ687YzCRTMmmJZehzISELy+PqCjwkAgJD3UirA==
X-Gm-Message-State: AOJu0YwmmFhljlJM9m2ZBIx/pSQCB86aGt9iKr1LSEkh/SB88aQv9E19
	P1CExTq1elTVE7dJCkINL5nZ6NvuXW+kZ/6GAZlnSlAwBdLdt0uwhUjPQw8ClxK4fLuiSV9cAgU
	ANZl6anZKh6JHIas7mEYcf59LHO8=
X-Google-Smtp-Source: AGHT+IFMxdc7q7n4vsnXATmU6Ukw2OWEXLM+9DQfXNJyKv5vh18nLmDtSY08R7py6ufxGishc+U8UEoiDGYz9rWlZg4=
X-Received: by 2002:a05:6512:3b91:b0:519:5fb9:832b with SMTP id
 g17-20020a0565123b9100b005195fb9832bmr2780019lfv.12.1714402491069; Mon, 29
 Apr 2024 07:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240423-arm32-cfi-v8-0-08f10f5d9297@linaro.org> <Zi+e9M/f5b/Sto9H@shell.armlinux.org.uk>
In-Reply-To: <Zi+e9M/f5b/Sto9H@shell.armlinux.org.uk>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 29 Apr 2024 16:54:39 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG_oLtPMEhnnpQjJUSgFnJv-rP_yC-BNJRr+aC5eycnWA@mail.gmail.com>
Message-ID: <CAMj1kXG_oLtPMEhnnpQjJUSgFnJv-rP_yC-BNJRr+aC5eycnWA@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] CFI for ARM32 using LLVM
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Apr 2024 at 15:22, Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> I've applied this to a separate branch, and it should be in
> linux-next by tomorrow.
>
> As mentioned today on a previous iteration of the patch series,
> I'm not all that happy with the introduction of delay-inducing
> branches to solve CFI issues especially on the early CPUs where
> a branch causes the CPUs pipeline to be flushed - thus making
> branches expensive.
>
> Can we make these branches conditional on the use of CFI?
>
> Didn't Ard mention there was a way to do this using symbol aliases?
>

Yes, but only if the prototypes are identical. Not sure why Linus
decided to keep this separate, but 9386/2 implements this for
flush_user_cache_all() vs. flush_kern_cache_all().

For coherent_user_range() vs. coherent_kern_range(), the return type
is different (void vs int)

So we could either make coherent_kern_range() return int as well, or
alternatively, we could emit the branch instructions only when CFI is
enabled (as in that case, SYM_TYPED_FUNC_START() expands to something
that prevents a fall through)

E.g.,

--- a/arch/arm/mm/cache-v4wt.S
+++ b/arch/arm/mm/cache-v4wt.S
@@ -108,7 +108,9 @@ SYM_FUNC_END(v4wt_flush_user_cache_range)
  *     - end    - virtual end address
  */
 SYM_TYPED_FUNC_START(v4wt_coherent_kern_range)
+#ifdef CONFIG_CFI_CLANG
        b       v4wt_coherent_user_range
+#endif
 SYM_FUNC_END(v4wt_coherent_kern_range)

 /*

AFAICT, SYM_TYPED_FUNC_START() does not prevent a fall through if
CFI_CLANG is disabled, but someone should double check.
