Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BD22C81
	for <llvm@lists.linux.dev>; Sun, 31 Oct 2021 16:44:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E20460FC1
	for <llvm@lists.linux.dev>; Sun, 31 Oct 2021 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635698656;
	bh=KqBG5a72r0SwoJh6oXNmY014kyMvBMiK1GbA0SDqhtU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rrx3JAFte+bnvxLfREs8Zp20Ei3Bb1lLKJrtUB9esdLJCRgWdCgoHc+CGNMids0KG
	 qnZAEUIuC8q4WXIK7jKkSrvCvHUVd3Bzk5eLs15cudtrXG4QgkPi1Hl/wcsLepl1RI
	 Pti3Zv5ihR+DtzhZveeLN7XABULJ0VQtAog6jUrOKJup6Ix2Bx9i4/WIREjInGBeDD
	 iX++m3Qql9J3u5vGjy+5PsNYR6GUJKxP5L5SfFh636t/wznOK9ttikuBaEV2SfcXVA
	 RlaNSAJ4dEALQQlsrpU57OYGErMVpszXE8OqqEB2DdRQNGFCNoVShgeuRwmyCf2YFk
	 txlOtPEE/WeGg==
Received: by mail-oi1-f173.google.com with SMTP id k8so8462528oik.7
        for <llvm@lists.linux.dev>; Sun, 31 Oct 2021 09:44:16 -0700 (PDT)
X-Gm-Message-State: AOAM531ZiipZ/rI+OsK3xrtrg7riiVBlT/XNg6f8vX/n52ZyKFpFY/kU
	otS9duYgr2TtWyNVbDGs3Gj8y/NiYYn12fOmXV0=
X-Google-Smtp-Source: ABdhPJxKU2EGRHrAToCd0HlO2UumUt4CUFcQUJowbmnFLPnafpbFSx3tFuxcW5bZyH55Sp1P1HD0Ik2UzfxEmtF0TmM=
X-Received: by 2002:a05:6808:4d9:: with SMTP id a25mr16521518oie.33.1635698655833;
 Sun, 31 Oct 2021 09:44:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMj1kXHKh7wv6JqusVnoiQDMm7ApFq2ujzbfWmM9AzLKFehhAA@mail.gmail.com>
 <YXlcMluaysPBF92J@hirez.programming.kicks-ass.net> <CAMj1kXECTdDLVMk2JduU5mV2TR0Cv=hZ9QOpYRsRM1jfvvNikw@mail.gmail.com>
 <CABCJKufpS4jJxHqk8=bd1JCNbKfmLDKBbjbhjrar2+YQJFiprg@mail.gmail.com>
 <20211029200324.GR174703@worktop.programming.kicks-ass.net>
 <20211030074758.GT174703@worktop.programming.kicks-ass.net>
 <CAMj1kXEJd5=3A_6Jhd4UU-TBGarnHo5+U76Zxxt7SzXsWp4CcA@mail.gmail.com>
 <20211030180249.GU174703@worktop.programming.kicks-ass.net>
 <CAMj1kXF4ZNAvdC8tP_H=v1Dn_Zcv=La11Ok43ceQOyb1Xo1jXQ@mail.gmail.com>
 <CAMj1kXEvemVOWf4M_0vsduN_kiCsGVmM92cE7KPMoNKViKp=RQ@mail.gmail.com> <20211031163920.GV174703@worktop.programming.kicks-ass.net>
In-Reply-To: <20211031163920.GV174703@worktop.programming.kicks-ass.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 31 Oct 2021 17:44:04 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHk5vbrT49yRCivX3phrEkN6Xbb+g8WEmavL_d1iE0OxQ@mail.gmail.com>
Message-ID: <CAMj1kXHk5vbrT49yRCivX3phrEkN6Xbb+g8WEmavL_d1iE0OxQ@mail.gmail.com>
Subject: Re: [PATCH] static_call,x86: Robustify trampoline patching
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	X86 ML <x86@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 31 Oct 2021 at 17:39, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Sun, Oct 31, 2021 at 05:24:13PM +0100, Ard Biesheuvel wrote:
> > On Sat, 30 Oct 2021 at 20:55, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Sat, 30 Oct 2021 at 20:03, Peter Zijlstra <peterz@infradead.org> wrote:
> > > >
> > > > On Sat, Oct 30, 2021 at 07:19:53PM +0200, Ard Biesheuvel wrote:
> > > > > I just realized that arm64 has the exact same problem, which is not
> > > > > being addressed by my v5 of the static call support patch.
> > > >
> > > > Yeah, it would.
> > > >
> > > > > As it turns out, the v11 Clang that I have been testing with is broken
> > > > > wrt BTI landing pads, and omits them from the jump table entries.
> > > > > Clang 12+ adds them properly, which means that both the jump table
> > > > > entry and the static call trampoline may start with BTI C + direct
> > > > > branch, and we also need additional checks to disambiguate.
> > > >
> > > > I'm not sure, why would the static_call trampoline need a BTI C ? The
> > > > whole point of static_call() is to be a direct call, we should never
> > > > have an indirect call to the trampoline, that would defeat the whole
> > > > purpose.
> > >
> > > This might happen when the distance between the caller and the
> > > trampoline is more than 128 MB, in which case we emit a veneer that
> > > uses an indirect call as well. So we definitely need the landing pad
> > > in the trampoline.
> >
> > Something like the below seems to work to prevent getting the wrong
> > trampoline address into arch_static_call_transform:
>
> Is is also a terriblly gross hack. I really want the clang-cfi stuff to
> improve, not add layers of hacks on top of it.

I'm just as annoyed as you are about the apparent need for this.
However, emitting an alias at build time is far better IMHO than
adding a magic byte sequence and having to check it at runtime.
