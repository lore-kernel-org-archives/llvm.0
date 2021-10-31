Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130CC68
	for <llvm@lists.linux.dev>; Sun, 31 Oct 2021 20:22:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F9E860FC2
	for <llvm@lists.linux.dev>; Sun, 31 Oct 2021 20:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635711728;
	bh=OV4mLA2HfSFKTFr/ywK4hMqZCwkktb6AU5o1Z5CXfPU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k7J966P1qoVmo8mQ/jwihh8G+KQ0VcIE9PU7aAqP/OUUr3FD11feERUPT4jjSOwUT
	 aojSFEPeGTBLJJR7AFFV8D2XVs1urWBlBA9PBd7la+RskrJlGIyc6d9Ijj1Vi+2MBm
	 bHf15ugE6Vn4fguVv2boeGMvpULZR6BTD5/S1p3nB47SbOYWYPW7VZ9+qlAhIjAzXh
	 NJsAZhiAPxXcErahYQrnxi7aIPOLIP4tKYkbBYGfu4e/Yldp6BYwtdJrCD2m/W7cBo
	 baTTptHhvzg83zWTmLSlnGdbBEHJmY/Bc1ocGq+oydFKqX3W0dY8ETLZlzd+Notqwd
	 wmsolstlN5V3Q==
Received: by mail-oi1-f169.google.com with SMTP id bd30so2372239oib.13
        for <llvm@lists.linux.dev>; Sun, 31 Oct 2021 13:22:08 -0700 (PDT)
X-Gm-Message-State: AOAM530zfZpLokrUeLB9SrePdgzIdiOpYyoBOK7Nl6qHdPWnPhS46azD
	urFtmCFCfts7g6IAPOZyLr168jOsZOrFLb+f/YE=
X-Google-Smtp-Source: ABdhPJwvgpTnogpnQrmg0n6dMaMGzHAElcQ+u5jRDQmIOckl0F4TZNlv66SgLABHTBydjT4IY8pmhDUosh19cAEqUvI=
X-Received: by 2002:a05:6808:20a6:: with SMTP id s38mr2002205oiw.47.1635711727713;
 Sun, 31 Oct 2021 13:22:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMj1kXECTdDLVMk2JduU5mV2TR0Cv=hZ9QOpYRsRM1jfvvNikw@mail.gmail.com>
 <CABCJKufpS4jJxHqk8=bd1JCNbKfmLDKBbjbhjrar2+YQJFiprg@mail.gmail.com>
 <20211029200324.GR174703@worktop.programming.kicks-ass.net>
 <20211030074758.GT174703@worktop.programming.kicks-ass.net>
 <CAMj1kXEJd5=3A_6Jhd4UU-TBGarnHo5+U76Zxxt7SzXsWp4CcA@mail.gmail.com>
 <20211030180249.GU174703@worktop.programming.kicks-ass.net>
 <CAMj1kXF4ZNAvdC8tP_H=v1Dn_Zcv=La11Ok43ceQOyb1Xo1jXQ@mail.gmail.com>
 <CAMj1kXEvemVOWf4M_0vsduN_kiCsGVmM92cE7KPMoNKViKp=RQ@mail.gmail.com>
 <20211031163920.GV174703@worktop.programming.kicks-ass.net>
 <CAMj1kXHk5vbrT49yRCivX3phrEkN6Xbb+g8WEmavL_d1iE0OxQ@mail.gmail.com> <YX74Ch9/DtvYxzh/@hirez.programming.kicks-ass.net>
In-Reply-To: <YX74Ch9/DtvYxzh/@hirez.programming.kicks-ass.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 31 Oct 2021 21:21:56 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG+MuGaG3BHk8pnE1MKVmRf5E+nRNoFMHxOA1y84eGikg@mail.gmail.com>
Message-ID: <CAMj1kXG+MuGaG3BHk8pnE1MKVmRf5E+nRNoFMHxOA1y84eGikg@mail.gmail.com>
Subject: Re: [PATCH] static_call,x86: Robustify trampoline patching
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	X86 ML <x86@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 31 Oct 2021 at 21:11, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Sun, Oct 31, 2021 at 05:44:04PM +0100, Ard Biesheuvel wrote:
>
> > > Is is also a terriblly gross hack. I really want the clang-cfi stuff to
> > > improve, not add layers of hacks on top of it.
> >
> > I'm just as annoyed as you are about the apparent need for this.
> > However, emitting an alias at build time is far better IMHO than
> > adding a magic byte sequence and having to check it at runtime.
>
> Oh, I'm keeping that magic sequence :-) That's hardening in general, and
> I don't want to ever want to debug a wrong poke like that again.
>
> Adding an extra label fixes this thing, but there's still the other
> cases where we need/want/desire a *real* function pointer.
>
> I'm very close to saying that anything that mucks up function pointers
> like this is a complete non-starter. Let's start re-start this whole CFI
> endeavour from the start.

Well, CFI is already in mainline for arm64, whereas static call
support is not. So we have to deal with it one way or the other.

So for the static call targets, I agree that we want to support any
expression that produces a function pointer, but that part is not
actually broken, it is just sub-optimal iff you are using CFI Clang.
For taking the address of the trampoline, I think the solutions we
have are sufficient (although I am not inclined to add the magic sig
to arm64 if the label is sufficient).

That means we can support static calls on arm64 now without breaking
Clang CFI, and work on a solution for the redundant jumps on a more
relaxed schedule.
