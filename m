Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E2A2577
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 22:59:42 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id v5-20020a17090a7c0500b001df84fa82f8so378746pjf.5
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 15:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qH80CkGInLvkMX2JFapXe6/mirbCbTT5IsB0Ewh+rp8=;
        b=TOCV1Wq+ft6PCF6l/iA42zY/3oD/IM0GOcYS+7TP3YJrbCBQoBpGYcRJ4FxvAYjGS8
         Gg7ZH626PyNKxe6gsPGFcJ6V3ZdRL/vPUeoqYVEMEWtWXHFCjfx4Ox5QLjjGI8779p5h
         T+G2RVdvA3BaNACIhLLpoN8MhXMLEVheXyyvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qH80CkGInLvkMX2JFapXe6/mirbCbTT5IsB0Ewh+rp8=;
        b=OTq2zUHGmZl46kAImQtaJDLzPgQxAhFin7Q5e1939t7oNlq+qcKf6celJExay5NgLe
         SuB6AdOEmxr8W8Jf55TCp2Q2f4mYagPMgSCGLU+oj5rXg9BmQCZ5SFoADv74WtlYD9kh
         /JFk+kPN/Bal4Qz9ib1bDBL4rEd6HiIga9HatW/1METS7aegTZ5lN8sE4XT+3OzfcRd2
         Mj1HODSApSQDH+lmrB3D0LusJyjsh7l/DzluGQnaXl+8Urp0FUTMwNenBiaYih6aTa0j
         Uoe5lQLxoNuDuXvuKLezx/KJ588iUgQQpTI8nzZSrfsP57cQzuAzDb/n+3ILEIMVuSe9
         bhmg==
X-Gm-Message-State: AOAM532wxGzKtRQCQYYwyTpWc3si4BC9f4oYxyIbzvgjgayFcifi2Gmb
	JgYINJ1PMFGfT2MT4hEmUbntRA==
X-Google-Smtp-Source: ABdhPJyxSU6G5TXN+v5ykRQusfkdTnOToZozkVk2taUe7UjHwkwJqQkJiQdCp59lbUQJKd1uM61/1Q==
X-Received: by 2002:a17:90b:3b42:b0:1dc:5cdf:5649 with SMTP id ot2-20020a17090b3b4200b001dc5cdf5649mr33105926pjb.239.1652741982280;
        Mon, 16 May 2022 15:59:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e16-20020a17090301d000b0015f2d549b46sm7535303plh.237.2022.05.16.15.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 15:59:41 -0700 (PDT)
Date: Mon, 16 May 2022 15:59:41 -0700
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org,
	Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Joao Moreira <joao@overdrivepizza.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [RFC PATCH v2 20/21] x86: Add support for CONFIG_CFI_CLANG
Message-ID: <202205161531.3339CA95@keescook>
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-21-samitolvanen@google.com>
 <YoIfWENLV1AR2ijj@hirez.programming.kicks-ass.net>
 <CABCJKucXA2jbTc9TF1mLUsEDKu52t71tzxpnsGOXY3_ks+W4Bg@mail.gmail.com>
 <20220516183047.GM76023@worktop.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516183047.GM76023@worktop.programming.kicks-ass.net>

On Mon, May 16, 2022 at 08:30:47PM +0200, Peter Zijlstra wrote:
> On Mon, May 16, 2022 at 10:15:00AM -0700, Sami Tolvanen wrote:
> > On Mon, May 16, 2022 at 2:54 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Fri, May 13, 2022 at 01:21:58PM -0700, Sami Tolvanen wrote:
> > > > With CONFIG_CFI_CLANG, the compiler injects a type preamble
> > > > immediately before each function and a check to validate the target
> > > > function type before indirect calls:
> > > >
> > > >   ; type preamble
> > > >   __cfi_function:
> > > >     int3
> > > >     int3
> > > >     mov <id>, %eax
> > > >     int3
> > > >     int3
> > > >   function:
> > > >     ...
> > >
> > > When I enable CFI_CLANG and X86_KERNEL_IBT I get:
> > >
> > > 0000000000000c80 <__cfi_io_schedule_timeout>:
> > > c80:   cc                      int3
> > > c81:   cc                      int3
> > > c82:   b8 b5 b1 39 b3          mov    $0xb339b1b5,%eax
> > > c87:   cc                      int3
> > > c88:   cc                      int3
> > >
> > > 0000000000000c89 <io_schedule_timeout>:
> > > c89:   f3 0f 1e fa             endbr64
> > >
> > >
> > > That seems unfortunate. Would it be possible to get an additional
> > > compiler option to suppress the endbr for all symbols that get a __cfi_
> > > preaamble?
> > 
> > What's the concern with the endbr? Dropping it would currently break
> > the CFI+IBT combination on newer hardware, no?
> 
> Well, yes, but also that combination isn't very interesting. See,
> 
>   https://lore.kernel.org/all/20220420004241.2093-1-joao@overdrivepizza.com/T/#m5d67fb010d488b2f8eee33f1eb39d12f769e4ad2
> 
> and the patch I did down-thread:
> 
>   https://lkml.kernel.org/r/YoJKhHluN4n0kZDm@hirez.programming.kicks-ass.net
> 
> If we have IBT, then FineIBT is a much better option than kCFI+IBT.

I'm still not convinced about this, but I'm on the fence.

Cons:
- FineIBT does callee-based hash verification, which means any
  attacker-constructed memory region just has to have an endbr and nops at
  "shellcode - 9". KCFI would need the region to have the hash at
  "shellcode - 6" and an endbr at "shellcode". However, that hash is well
  known, so it's not much protection.
- Potential performance hit due to making an additional "call" outside
  the cache lines of both caller and callee.

Pros:
- FineIBT can be done without read access to the kernel text, which will
  be nice in the exec-only future.

I'd kind of like the "dynamic FineIBT conversion" to be a config option,
at least at first. We could at least do performance comparisons between
them.

> Removing that superfluous endbr also shrinks the whole thing by 4 bytes.
> 
> So I'm fine with the compiler generating working code for that
> combination; but please get me an option to supress it in order to save
> those pointless bytes. All this CFI stuff is enough bloat as it is.

So, in the case of "built for IBT but running on a system without IBT",
no rewrite happens, and no endbr is present (i.e. address-taken
functions have endbr emission suppressed)?

Stock kernel build:
	function:
		[normal code]
	caller:
		call    __x86_indirect_thunk_r11

IBT kernel build:
	function:
		endbr
		[normal code]
	caller:
		call    __x86_indirect_thunk_r11

CFI kernel build:

	__cfi_function:
		[int3/mov/int3 preamble]
	function:
		[normal code]
	caller:
		cmpl    \hash, -6(%r11)
		je      .Ltmp1
		ud2
	.Ltmp1:
		call    __x86_indirect_thunk_r11

CFI+IBT kernel build:

	__cfi_function:
		[int3/mov/int3 preamble]
	function:
		endbr
		[normal code]
	caller:
		cmpl    \hash, -6(%r11)
		je      .Ltmp1
		ud2
	.Ltmp1:
		call    __x86_indirect_thunk_r11

CFI+IBT+FineIBT kernel build:

	__cfi_function:
		[int3/mov/int3 preamble]
	function:
		/* no endbr emitted */
		[normal code]
	caller:
		cmpl    \hash, -6(%r11)
		je      .Ltmp1
		ud2
	.Ltmp1:
		call    __x86_indirect_thunk_r11

	at boot, if IBT is detected:
	- replace __cfi_function with:
		endbr
		call __fineibt_\hash
	- replace caller with:
		movl    \hash, %r10d
		sub     $9, %r11
		nop2
		call    *%r11
	- inject all the __fineibt_\hash elements via module_alloc()
		__fineibt_\hash:
			xor     \hash, %r10
			jz      1f
			ud2
		1:	ret
			int3



-- 
Kees Cook
