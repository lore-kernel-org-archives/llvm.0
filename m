Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687F4A38
	for <llvm@lists.linux.dev>; Thu,  5 Jan 2023 09:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A84C4339B
	for <llvm@lists.linux.dev>; Thu,  5 Jan 2023 09:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672910838;
	bh=AoenQ7qr+Q+w0pYT0UssjkyKOV1r0ACZanFVsuqcXzA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=e/TMjCWVTXw05xrUmAEKmEF0btABjqM9NxgNFERQCosn7sNcPQkucCuuPuxxnr9os
	 mAgVMVZWTzp+AZoiZMmhoenf0ry2AQMlpr5HqbWjUcbCCv+Hnla1rwSfT5tZBYGad0
	 YXR2BUosolLeT/zRLZmVhfiROubw5U8Fyba/QsqMsiAusLniONfyh5ktiWZpVIPYGH
	 VAUYDuJTAlVLO0YAmBPQqdHv02BqFUkMVpWKwzFkIWkphDGwm0Nnpy95dHYhrdoI8W
	 t+xVtTXT/v/rnv/J//wGAE4+8kN4Q5/w2gyVVStK7E1MZldSTRovlKE34QcBGRLbxD
	 hF/Pinjhl2XjA==
Received: by mail-lj1-f180.google.com with SMTP id x37so31192658ljq.1
        for <llvm@lists.linux.dev>; Thu, 05 Jan 2023 01:27:18 -0800 (PST)
X-Gm-Message-State: AFqh2kpF+nwe1QI1QyT2p2A3bZIEw4CbiQ57Q6Sf3ie2HJCF128H+Hz3
	KcDcfuxO+p6R9E6KZMlih1aBZLznJKUnVqVwC1k=
X-Google-Smtp-Source: AMrXdXtdYGm8LcpOyH0MW0QgmaJupm5eiQxKVhh4tka36trdPSnLwz+z8R3UDFD6dBQvfBpWUL1v5udPzAAmS0wGFXs=
X-Received: by 2002:a2e:bd0c:0:b0:27f:bc58:3924 with SMTP id
 n12-20020a2ebd0c000000b0027fbc583924mr2884615ljq.352.1672910836054; Thu, 05
 Jan 2023 01:27:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221226184537.744960-1-masahiroy@kernel.org> <Y7Jal56f6UBh1abE@dev-arch.thelio-3990X>
 <CAK7LNAQ-MWhbiTX=phy3uzmNn+6ABZmi49D6d1n1-k-jxcQzgA@mail.gmail.com> <87fscp2v7k.fsf@igel.home>
In-Reply-To: <87fscp2v7k.fsf@igel.home>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 5 Jan 2023 10:27:04 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGD3wQUPsRhvD7bO9xBJ6NR=Z+y8wXmKSCs57Oeh3MzGw@mail.gmail.com>
Message-ID: <CAMj1kXGD3wQUPsRhvD7bO9xBJ6NR=Z+y8wXmKSCs57Oeh3MzGw@mail.gmail.com>
Subject: Re: [PATCH v2] arch: fix broken BuildID for arm64 and riscv
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, linux-arch@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Dennis Gilmore <dennis@ausil.us>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, 
	Jisheng Zhang <jszhang@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Jan 2023 at 10:21, Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Jan 05 2023, Masahiro Yamada wrote:
>
> > I do not understand why 99cb0d917ffa affected this.
> >
> >
> > I submitted a fix to shoot the error message "discarded section .exit.text"
> >
> > https://lore.kernel.org/all/20230105031306.1455409-1-masahiroy@kernel.org/T/#u
> >
> > I do not understand the binutils commit either,
> > but it might have made something good
> > because EXIT_TEXT appears twice, in .exit.text, and /DISCARD/.
>
> I think the issue is that the introdution of a second /DISCARD/
> directive early in script changes the order of evaluation of the other
> /DISCARD/ directive when binutils < 2.36 is used, so that the missing
> RUNTIME_DISCARD_EXIT started to become relevant.  As long as /DISCARD/
> only appears last, the effect of EXIT_TEXT inside it is always
> overridden by its occurence in the .exit.exit output section directive.
> When another /DISCARD/ occurs early (and binutils < 2.36 is used) the
> effect of EXIT_TEXT inside the second /DISCARD/ (when merged with the
> first) overrides its occurence in the .exit.text directive.  The
> binutils commit changed that because the new /DISCARD/ directive no
> longer affects the order of evaluation of the rest of the directives.
>

Exactly. The binutils change mentions output section merging, which
apparently applies to the /DISCARD/ pseudo section as well.

However, powerpc was also affected by this, and I suggested another
fix in the thread below

https://lore.kernel.org/all/20230103014535.GA313835@roeck-us.net/
