Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFBD68
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 20:48:47 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id f18-20020a17090aa79200b001ad9cb23022so5821079pjq.4
        for <llvm@lists.linux.dev>; Thu, 09 Dec 2021 12:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2E9kDLwwNQ0Gbn3Uwe88OJMa9WjF0vo6Kuu7UJb0mUg=;
        b=BYG7unjb4oJBjQXDwmJe7IMGw01lsC5JVhUrrtmNkgsX52TRDJUTmboGRQdbpT+o1g
         j9KUbDE0v9xUhFaLYhQ3ldiUvMfYIufWFT/SlJ8pf6nhSA2No8MmXgFAyTcwgT2urGME
         2ktYdpkYq/M/ZgU3QBNf6cfjg5WUfR4IbMcpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2E9kDLwwNQ0Gbn3Uwe88OJMa9WjF0vo6Kuu7UJb0mUg=;
        b=7IJX9eAj0UDt3FhMX/1dC2UIZGT9lJPYU61quTgtIUkaOBajUKx00VbhUUspkyTEO4
         oAe8I8TEkmOlRdg9u8TQL379/arg/KgX6iyFvOL0tAeR+TdoQ+CAl0eYPVzbFr0XnvFa
         NCixMjFtraef9IUWqlZfVzTSlXdmTh7bBxIDeAzwSHlCREhXfmtBXX5lmC1S8lKnHDm2
         cr9J6E6bNpROJOHd72edhc5PPRThVhSgELFLmI/0cphnHaitt/boAkpQO8Bd3wMDPiAL
         IwU7G/0jJbWKGKROcSYTh49EU3+v0S9FRX5EfRG+bUKwaIsp19c4GV6xY6KhoQn+l2/8
         aCxg==
X-Gm-Message-State: AOAM531vzj9MncG9uPi/F32g2LKf/riX/vstst2u2jNia1HlopTEjqM3
	eoEq8Gkmez4We9FkMQyaeMxNxw==
X-Google-Smtp-Source: ABdhPJygNj+tslfTSFbQM3Med1wMuC/7qfQDHXEA98gBbSPtHemrkTPjLSeWLzE5oSIz+n+GiFUpbg==
X-Received: by 2002:a17:902:bd02:b0:142:728b:e475 with SMTP id p2-20020a170902bd0200b00142728be475mr58367811pls.15.1639082927017;
        Thu, 09 Dec 2021 12:48:47 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y12sm568512pfe.140.2021.12.09.12.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 12:48:46 -0800 (PST)
Date: Thu, 9 Dec 2021 12:48:45 -0800
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Alexander Potapenko <glider@google.com>,
	Jann Horn <jannh@google.com>, Peter Collingbourne <pcc@google.com>,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Subject: Re: randomize_kstack: To init or not to init?
Message-ID: <202112091232.51D0DE5535@keescook>
References: <YbHTKUjEejZCLyhX@elver.google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YbHTKUjEejZCLyhX@elver.google.com>

On Thu, Dec 09, 2021 at 10:58:01AM +0100, Marco Elver wrote:
> Clang supports CONFIG_INIT_STACK_ALL_ZERO, which appears to be the
> default since dcb7c0b9461c2, which is why this came on my radar. And
> Clang also performs auto-init of allocas when auto-init is on
> (https://reviews.llvm.org/D60548), with no way to skip. As far as I'm
> aware, GCC 12's upcoming -ftrivial-auto-var-init= doesn't yet auto-init
> allocas.
> 
> add_random_kstack_offset() uses __builtin_alloca() to add a stack
> offset. This means, when CONFIG_INIT_STACK_ALL_{ZERO,PATTERN} is
> enabled, add_random_kstack_offset() will auto-init that unused portion
> of the stack used to add an offset.
> 
> There are several problems with this:
> 
> 	1. These offsets can be as large as 1023 bytes. Performing
> 	   memset() on them isn't exactly cheap, and this is done on
> 	   every syscall entry.
> 
> 	2. Architectures adding add_random_kstack_offset() to syscall
> 	   entry implemented in C require them to be 'noinstr' (e.g. see
> 	   x86 and s390). The potential problem here is that a call to
> 	   memset may occur, which is not noinstr.
> 
> A defconfig kernel with Clang 11 and CONFIG_VMLINUX_VALIDATION shows:
> 
>  | vmlinux.o: warning: objtool: do_syscall_64()+0x9d: call to memset() leaves .noinstr.text section
>  | vmlinux.o: warning: objtool: do_int80_syscall_32()+0xab: call to memset() leaves .noinstr.text section
>  | vmlinux.o: warning: objtool: __do_fast_syscall_32()+0xe2: call to memset() leaves .noinstr.text section
>  | vmlinux.o: warning: objtool: fixup_bad_iret()+0x2f: call to memset() leaves .noinstr.text section
> 
> Switching to INIT_STACK_ALL_NONE resolves the warnings as expected.
> 
> To figure out what the right solution is, the first thing to figure out
> is, do we actually want that offset portion of the stack to be
> auto-init'd?
> 
> There are several options:
> 
> 	A. Make memset (and probably all other mem-transfer functions)
> 	   noinstr compatible, if that is even possible. This only solves
> 	   problem #2.

I'd agree: "A" isn't going to work well here.

> 
> 	B. A workaround could be using a VLA with
> 	   __attribute__((uninitialized)), but requires some restructuring
> 	   to make sure the VLA remains in scope and other trickery to
> 	   convince the compiler to not give up that stack space.

I was hoping the existing trickery would work for a VLA, but it seems
not. It'd be nice if it could work with a VLA, which could just gain the
attribute and we'd be done.

> 	C. Introduce a new __builtin_alloca_uninitialized().

Hrm, this means conditional logic between compilers, too. :(

-- 
Kees Cook
