Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306CF68
	for <llvm@lists.linux.dev>; Thu,  9 Dec 2021 21:15:01 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id u80so6554620pfc.9
        for <llvm@lists.linux.dev>; Thu, 09 Dec 2021 13:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=idhxYsGIqFY0iC2foXmRO1Y7kKO1WrOHXiDZA3WqNNo=;
        b=IvRNfl/yHGNbaRuZUg5LCIynBFYEWDlaw/l17q8LxCmsXH13Xt4hnB2FTiA+CpIxlb
         IoajmcenI66bwwJALCjoJWVlKg31Du5jVorr6966uRrQxKt7EJk838gnpt2RfGP3ZGq7
         BInxfl8WVp4trftotf12fMsB5G1taS2LOAjLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=idhxYsGIqFY0iC2foXmRO1Y7kKO1WrOHXiDZA3WqNNo=;
        b=QBtouyOlEP/bCg/fV2q0RiztYX1zD4kYUdkmV9SXAIqBm5dn9Fo++yfrwjjGwZ4M0K
         2PDLX7xVLLIBff7elEQyzf6LjSoLNd+iTc81nAOiNrm4m1Th+e2MRuSPf9OoC3PQ4XQQ
         MzncUsNNVSSPGU7jxxJfHZX4oaJEEmhCuP7ZGnNBN4glY98gZcv2uQpuyoQ13sKxOF6p
         JCWZQVgAS6P5pOiibbKt/f0kd9XuLmVChUfn9KwsYF9A35kuDVlapsc11wFOieszFAtw
         Jzsxfxkkjj9q7u7eaywzVisybdKH0J4P8T3mAysazEA6VB0RmjkfgMp0yeneCsfxveed
         5ppg==
X-Gm-Message-State: AOAM532Bbv7h5R82cJa48De4HmHI4bkdkouJCBvipxOHhKHzEedY6rP3
	0t+c8rcl6WAt2Z081dltQl6xdw==
X-Google-Smtp-Source: ABdhPJyS+MH0ramfRpc8Q0VxQwzb/l4MW4LuS7YzA0o5Ikzly1HpEbdv8sATmINV6iWKr66GgdUKkQ==
X-Received: by 2002:a05:6a00:811:b0:4af:d1c9:fa3f with SMTP id m17-20020a056a00081100b004afd1c9fa3fmr14185879pfk.21.1639084500512;
        Thu, 09 Dec 2021 13:15:00 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q10sm8940664pjd.0.2021.12.09.13.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 13:15:00 -0800 (PST)
Date: Thu, 9 Dec 2021 13:14:59 -0800
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
Message-ID: <202112091308.600DA7FE63@keescook>
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

I actually can't reproduce this with the latest Clang. I see no memset
call with/without INIT_STACK_ALL_ZERO. I do see:

vmlinux.o: warning: objtool: fixup_bad_iret()+0x2f: call to memset() leaves .noinstr.text section

I assume that's from:

	struct bad_iret_stack tmp

But I'll try with Clang 11 and report back...

-- 
Kees Cook
