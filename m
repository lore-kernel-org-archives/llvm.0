Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E239B168
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 18:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F77C340E7
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 18:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643136949;
	bh=5F88GmWg6j8n65h4aHguokjv0SXNemVtjdZvA3vQSR0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HYXw9yyYMOYOQFW5JAu9FQGi6OKCuSXgz2IcXwffpRMwNxY6O2YXJftvb2Zdhw+Fq
	 COKdYx0YTka0gidwppTRt7UV+k0jAseafhKubtkxncLHmxdLKZ3LRf5J54t2+fiCv4
	 TJ4jJq0jFlXloRENmgQGKu9Ir2y+UNHk4Oabnym6mVhNkNczbe5CE0Xn4TncxC1DZU
	 U3uA+LkYhF5Nvu1nHhH6OLNuPf4CNNR5CCPTiXsfcqjdz2a1kqmCUkz/x8kXs8jk6o
	 BPyO/7tXKPrJDu5N0ziIwzQRdoUuc11Sui2Lt0XfWwiLoOJglaI8X5r5OTqHc0vpgg
	 H2slYyPr0mYWA==
Received: by mail-wr1-f52.google.com with SMTP id l25so21599647wrb.13
        for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 10:55:49 -0800 (PST)
X-Gm-Message-State: AOAM532HgGuz1Ck/FW7GP7tOX0+m4pKFasTEVjuLdPRp3e10y/kHo1a1
	xHF1gYlAidg1XXeKGRSot1AU4O2Rze06zIChBQY=
X-Google-Smtp-Source: ABdhPJwpdk/Qdpw6Sj4wAwpVxIyxJ3kXP/wMgvaY/3Jr+vWqqP8fbDCWTH9NwCkO0JgEWjapsYOf18VdKvPBUSZayOM=
X-Received: by 2002:a5d:4944:: with SMTP id r4mr19661667wrs.550.1643136947873;
 Tue, 25 Jan 2022 10:55:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211021142516.1843042-1-ardb@kernel.org> <YfBGg+zmIlHmTIm/@dev-arch.archlinux-ax161>
In-Reply-To: <YfBGg+zmIlHmTIm/@dev-arch.archlinux-ax161>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 25 Jan 2022 19:55:37 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFgcoWU2XnL-arTKoA0Sk2AoQVjZ-xVLryGR=fkS89FVA@mail.gmail.com>
Message-ID: <CAMj1kXFgcoWU2XnL-arTKoA0Sk2AoQVjZ-xVLryGR=fkS89FVA@mail.gmail.com>
Subject: Re: [PATCH] ARM: stackprotector: prefer compiler for TLS based
 per-task protector
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Jan 2022 at 19:50, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Oct 21, 2021 at 04:25:16PM +0200, Ard Biesheuvel wrote:
> > Currently, we implement the per-task stack protector for ARM using a GCC
> > plugin, due to lack of native compiler support. However, work is
> > underway to get this implemented in the compiler, which means we will be
> > able to deprecate the GCC plugin at some point.
> >
> > In the meantime, we will need to support both, where the native compiler
> > implementation is obviously preferred. So let's wire this up in Kconfig
> > and the Makefile.
> >
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> I see this patch in the KSPP tree as commit 151bbc8be85e ("ARM:
> stackprotector: prefer compiler for TLS based per-task protector"),
> which breaks booting aspeed_g5_defconfig in QEMU with clang-14. It seems
> like this patch depends on Ard's patch "ARM: decompressor: disable stack
> protector" [1]; applying that on top of next-20220125 allows me to boot
> again.
>
> This patch is still queued up in Russell's devel-stable branch as
> commit f05eb1d24eb5 ("ARM: stackprotector: prefer compiler for TLS based
> per-task protector") so perhaps this patch should be dropped from the
> KSPP tree? I assume once Ard's recent fixes series [2] is applied to
> devel-stable, it will be added back to for-next?
>
> [1]: https://lore.kernel.org/r/20220124174744.1054712-9-ardb@kernel.org/
> [2]: https://lore.kernel.org/r/20220125091453.1475246-1-ardb@kernel.org/
>

Yeah. better drop it from KSPP.

The problem is that the compiler version of the per-task
stackprotector feature does not get disabled when building the
decompressor, which means it ends up dereferencing bogus TLS register
values.
