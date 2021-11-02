Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3055068
	for <llvm@lists.linux.dev>; Tue,  2 Nov 2021 18:19:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1BE661058
	for <llvm@lists.linux.dev>; Tue,  2 Nov 2021 18:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635877146;
	bh=h3FsxzoZsN4ni/4lI/yEk7+MdpyXKG1ci08/Ok2la5g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hWPt9XW3nVDGVvqzjQYUqgfumWPiYtangbEBaE3Px55WQTYw+sG9+3lqDRZvtAtkd
	 cMztv0svVeIGV3boaaIBY7KkKd8Ur7AvJgZZBH//s5ck2FRxU9/2FzVPk61908Ub/o
	 UbNm1lHX+/K03QzDQ9ta14+AjBh82tESzPS8oYU0mc4tl6D38z60esOoLSRzmf99k0
	 KnDVvRu2u0lviEd4yKUz9KUUOPJNmXprVe5P+/tPHQi7zkh+lOJ7HrdqXMNxZzrS9n
	 CXf/M6djB7IPiGhmsYQQ8ERUM/HCn9wM05WDNguMIoqidIKbg8qyk0Dws9LM/BzN+j
	 Ewnh7sIYbkuZA==
Received: by mail-ot1-f43.google.com with SMTP id o10-20020a9d718a000000b00554a0fe7ba0so54049otj.11
        for <llvm@lists.linux.dev>; Tue, 02 Nov 2021 11:19:06 -0700 (PDT)
X-Gm-Message-State: AOAM533Xl0RqwI4HW2qXu31HYun2hwW7v4hKGjC+/Q30FnZEGtpJFVOS
	hJ2GgeLJGvPdorAI+vS/I/zG33AIDj+ncOlO2m4=
X-Google-Smtp-Source: ABdhPJxrWULj7AK5fSXolNdR3bzb7riOJO8zZJ4Vmi6cbfk/UgM4PodTzpd9r0hc5QUTvTb2q4BmPq+wwUCTkAi9VFY=
X-Received: by 2002:a05:6830:1d6e:: with SMTP id l14mr28007931oti.147.1635877146217;
 Tue, 02 Nov 2021 11:19:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMj1kXHk5vbrT49yRCivX3phrEkN6Xbb+g8WEmavL_d1iE0OxQ@mail.gmail.com>
 <YX74Ch9/DtvYxzh/@hirez.programming.kicks-ass.net> <CAMj1kXG+MuGaG3BHk8pnE1MKVmRf5E+nRNoFMHxOA1y84eGikg@mail.gmail.com>
 <YX8AQJqyB+H3PF1d@hirez.programming.kicks-ass.net> <CAMj1kXF3n-oQ1WP8=asb60K6UjSYOtz5RVhrcoCoNq3v7mZdQg@mail.gmail.com>
 <20211101090155.GW174703@worktop.programming.kicks-ass.net>
 <CAMj1kXGhRmdM3om289Q2-s1Pzfob3D2iSDMorzggfhSk1oj53A@mail.gmail.com>
 <YYE1yPClPMHvyvIt@hirez.programming.kicks-ass.net> <YYFWEnBb/UaZKGzz@hirez.programming.kicks-ass.net>
 <CAMj1kXFQSitDY5WT246YEXXFphUv_HSjBrgvGzQGiCr4jLrM+g@mail.gmail.com> <YYGAAVG5aRDKRHso@hirez.programming.kicks-ass.net>
In-Reply-To: <YYGAAVG5aRDKRHso@hirez.programming.kicks-ass.net>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 2 Nov 2021 19:18:53 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHm99QNdHXUUAAJFD+M5VC-xFqjUoEVyg+oGkiJM51daA@mail.gmail.com>
Message-ID: <CAMj1kXHm99QNdHXUUAAJFD+M5VC-xFqjUoEVyg+oGkiJM51daA@mail.gmail.com>
Subject: Re: [PATCH] static_call,x86: Robustify trampoline patching
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	X86 ML <x86@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-hardening@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	joao@overdrivepizza.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Nov 2021 at 19:14, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Nov 02, 2021 at 06:44:56PM +0100, Ard Biesheuvel wrote:
> > On Tue, 2 Nov 2021 at 16:15, Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Tue, Nov 02, 2021 at 01:57:44PM +0100, Peter Zijlstra wrote:
> > >
> > > > So how insane is something like this, have each function:
> > > >
> > > > foo.cfi:
> > > >       endbr64
> > > >       xorl $0xdeadbeef, %r10d
> > > >       jz foo
> > > >       ud2
> > > >       nop     # make it 16 bytes
> > > > foo:
> > > >       # actual function text goes here
> > > >
> > > >
> > > > And for each hash have two thunks:
> > > >
> > > >
> > > >       # arg: r11
> > > >       # clobbers: r10, r11
> > > > __x86_indirect_cfi_deadbeef:
> > > >       movl -9(%r11), %r10             # immediate in foo.cfi
> > > >       xorl $0xdeadbeef, %r10          # our immediate
> > > >       jz 1f
> > > >       ud2
> > > > 1:    ALTERNATIVE_2   "jmp *%r11",
> > > >                       "jmp __x86_indirect_thunk_r11", X86_FEATURE_RETPOLINE
> > > >                       "lfence; jmp *%r11", X86_FEATURE_RETPOLINE_AMD
> > > >
> >
> > So are these supposed to go into the jump tables? If so, there still
> > needs to be a check against the boundary of the table at the call
> > site, to ensure that we are not calling something that we shouldn't.
> >
> > If they are not going into the jump tables, I don't see the point of
> > having them, as only happy flow/uncomprised code would bother to use
> > them.
>
> I don't understand. If you can scribble your own code, you can
> circumvent pretty much any range check anyway.

A function pointer is data not code.

> But if you can't scribble
> your own code, you get to use the branch here and that checks the
> callsite and callee signature.
>

OK, so the call site has a direct branch to this trampoline then? That
wasn't clear to me.

> The range check isn't fundamental to CFI, having a check is the
> important thing AFAIU.

Agreed. If the call site has a direct branch, it doesn't need the range check.
