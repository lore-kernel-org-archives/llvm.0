Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3572C82
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 21:15:30 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id k17so13720267plk.0
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 13:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cxXm9S9rBUGO+n/qf1n3on2rs5DZHI4UmQ2+ms2iYP4=;
        b=Qo7cE3plH59PbdtmImyac1lX+en/JDRgSaa4LMeLw6ph0k1EzlPT/BWVNjItFxgULh
         uYEe69YWJNHzuLftpsMRKtLU9Yx+i9KI7fKy9zSLAwleJOGwAdqbSQ8bIZt8/KNOt0iP
         XZyBHj77OOJEJ+b4ZrtXZqGJFZNNPAs6Aio2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cxXm9S9rBUGO+n/qf1n3on2rs5DZHI4UmQ2+ms2iYP4=;
        b=oiYmQPTzNeOqQPB7KYcYHT4OxLE2iRzJdS5QKmKSPhT2ZkK4u0rFBE0LRpJw1HBWSy
         uEw41xykGsfGoVlZ9DWDZ8ikcUq/afASSvkG8UHfsy9LV1+pevMkUX3U0zD+Crl7qDai
         j1ixDx53Y/zDy7OBPY9Dn+xyxZWXpszllyhoq/jCvXpRZZ2HBZrduGwb2kxplfJ0JBFT
         +hq8YPjmmJGkp0tfhx9XKN8tnxiWxqvPyRwBsRhcaG7b/d324964u2QNKch+pnlyZ0Pv
         kDodoezs4eGoZnn3YypQZtEy4Birbrf8wgivV0pr6mP/r+/ljzFeJhhAjSevTIKs8awD
         R+0w==
X-Gm-Message-State: AOAM530RaexmwtU8LFPhbZA8uQVfC6CUBF6EojJMvullgnRoX1RNxQcN
	BD+bNfWvc2uBgRpW9KQvRE+bFw==
X-Google-Smtp-Source: ABdhPJyul6M9uc+iYppo5Cuy0vy4tnGlURb4dMZAIkzric/Dse5pGkQPhJdFSZKL4eflCMSBcXWnew==
X-Received: by 2002:a17:902:d509:: with SMTP id b9mr22602105plg.3.1643663730410;
        Mon, 31 Jan 2022 13:15:30 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id mi18sm219840pjb.35.2022.01.31.13.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 13:15:30 -0800 (PST)
Date: Mon, 31 Jan 2022 13:15:29 -0800
From: Kees Cook <keescook@chromium.org>
To: Marco Elver <elver@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Alexander Potapenko <glider@google.com>, llvm@lists.linux.dev,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] stack: Constrain and fix stack offset
 randomization with Clang builds
Message-ID: <202201311315.B9FDD0A@keescook>
References: <20220131090521.1947110-1-elver@google.com>
 <20220131090521.1947110-2-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131090521.1947110-2-elver@google.com>

On Mon, Jan 31, 2022 at 10:05:21AM +0100, Marco Elver wrote:
> All supported versions of Clang perform auto-init of __builtin_alloca()
> when stack auto-init is on (CONFIG_INIT_STACK_ALL_{ZERO,PATTERN}).
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
> A x86_64 defconfig kernel with Clang 11 and CONFIG_VMLINUX_VALIDATION shows:
> 
>  | vmlinux.o: warning: objtool: do_syscall_64()+0x9d: call to memset() leaves .noinstr.text section
>  | vmlinux.o: warning: objtool: do_int80_syscall_32()+0xab: call to memset() leaves .noinstr.text section
>  | vmlinux.o: warning: objtool: __do_fast_syscall_32()+0xe2: call to memset() leaves .noinstr.text section
>  | vmlinux.o: warning: objtool: fixup_bad_iret()+0x2f: call to memset() leaves .noinstr.text section
> 
> Clang 14 (unreleased) will introduce a way to skip alloca initialization
> via __builtin_alloca_uninitialized() (https://reviews.llvm.org/D115440).
> 
> Constrain RANDOMIZE_KSTACK_OFFSET to only be enabled if no stack
> auto-init is enabled, the compiler is GCC, or Clang is version 14+. Use
> __builtin_alloca_uninitialized() if the compiler provides it, as is done
> by Clang 14.
> 
> Link: https://lkml.kernel.org/r/YbHTKUjEejZCLyhX@elver.google.com
> Fixes: 39218ff4c625 ("stack: Optionally randomize kernel stack offset each syscall")
> Signed-off-by: Marco Elver <elver@google.com>

Thanks for the tweaks; this looks good to me now.

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
