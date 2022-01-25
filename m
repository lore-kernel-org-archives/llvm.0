Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5692CA7
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 20:58:21 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id i17so3342515pfq.13
        for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 12:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PUYqmPkBvQIdGU58jwht3HN/0yzGfx8qaQRsB+UNiy0=;
        b=GQGmBB1DYw8/WmXT+ZpwruOtWZCF/qyI617MKboXaKLvTx8ABhBi0H+J/pYvhrLRMw
         33cPD0VliF2igzkBK3n7iiwAcFOBDA7my4ywLqovD98nfw3yIixprfAw/WExFlS3ReyT
         zor0+7rEnTcGVrnObxdq1OSaJor/ORgM+z1io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PUYqmPkBvQIdGU58jwht3HN/0yzGfx8qaQRsB+UNiy0=;
        b=ESl+6XVEjDhIQIfvil2Sz7T1rcto2AI6HVZ2dHEuXk4q45FrSmX3lgancVYK+xu0Zd
         Z6yCLIlIM5iYXKL2Zd0T/tcINiW/nzKtcYkiG4199DGlAB/THN4tc4gUhBgT6KuF3qlq
         y+Z5EJcITEPj5icDKo6ujOzuic73VBThHhJAHdhimGbG9EkfXrHneQvTzMwm+0rTm6Sf
         4V3+3g/p6o/NJ1Yy03V37ytg5KqOrLnPWaTeQBY+GdyBegn/iuE7igjpRebKaLrSLMIc
         bXWdsrt1TzlTBXO2yxVOCh9jOgsSWIuU0w6S1KGzgjNm6RhjLovpFdVQeOorjbhKfiMY
         ++hQ==
X-Gm-Message-State: AOAM533P8mMFge0jo3SCbyJzMTGnlpyaEj/QnC/yugzHfcU6Kq1UoEqL
	NyXr98YP7iy4E3C806clilUEOQ==
X-Google-Smtp-Source: ABdhPJw2O9JF37i0mzVfYkjnoM1KRfH+UcS6dsMeXv3AbRyHDSJglWOnK4x1rGSswLJsPisNjQ+bsw==
X-Received: by 2002:a63:9712:: with SMTP id n18mr16616112pge.594.1643144301071;
        Tue, 25 Jan 2022 12:58:21 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q12sm11984967pfk.199.2022.01.25.12.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 12:58:20 -0800 (PST)
Date: Tue, 25 Jan 2022 12:58:20 -0800
From: Kees Cook <keescook@chromium.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Subject: Re: [PATCH] ARM: stackprotector: prefer compiler for TLS based
 per-task protector
Message-ID: <202201251258.35AAAB07E5@keescook>
References: <20211021142516.1843042-1-ardb@kernel.org>
 <YfBGg+zmIlHmTIm/@dev-arch.archlinux-ax161>
 <CAMj1kXFgcoWU2XnL-arTKoA0Sk2AoQVjZ-xVLryGR=fkS89FVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFgcoWU2XnL-arTKoA0Sk2AoQVjZ-xVLryGR=fkS89FVA@mail.gmail.com>

On Tue, Jan 25, 2022 at 07:55:37PM +0100, Ard Biesheuvel wrote:
> On Tue, 25 Jan 2022 at 19:50, Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Thu, Oct 21, 2021 at 04:25:16PM +0200, Ard Biesheuvel wrote:
> > > Currently, we implement the per-task stack protector for ARM using a GCC
> > > plugin, due to lack of native compiler support. However, work is
> > > underway to get this implemented in the compiler, which means we will be
> > > able to deprecate the GCC plugin at some point.
> > >
> > > In the meantime, we will need to support both, where the native compiler
> > > implementation is obviously preferred. So let's wire this up in Kconfig
> > > and the Makefile.
> > >
> > > Cc: Kees Cook <keescook@chromium.org>
> > > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> >
> > I see this patch in the KSPP tree as commit 151bbc8be85e ("ARM:
> > stackprotector: prefer compiler for TLS based per-task protector"),
> > which breaks booting aspeed_g5_defconfig in QEMU with clang-14. It seems
> > like this patch depends on Ard's patch "ARM: decompressor: disable stack
> > protector" [1]; applying that on top of next-20220125 allows me to boot
> > again.
> >
> > This patch is still queued up in Russell's devel-stable branch as
> > commit f05eb1d24eb5 ("ARM: stackprotector: prefer compiler for TLS based
> > per-task protector") so perhaps this patch should be dropped from the
> > KSPP tree? I assume once Ard's recent fixes series [2] is applied to
> > devel-stable, it will be added back to for-next?
> >
> > [1]: https://lore.kernel.org/r/20220124174744.1054712-9-ardb@kernel.org/
> > [2]: https://lore.kernel.org/r/20220125091453.1475246-1-ardb@kernel.org/
> >
> 
> Yeah. better drop it from KSPP.
> 
> The problem is that the compiler version of the per-task
> stackprotector feature does not get disabled when building the
> decompressor, which means it ends up dereferencing bogus TLS register
> values.

Ooh! Whoops, sorry. Dropping.

-- 
Kees Cook
