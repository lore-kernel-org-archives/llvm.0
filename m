Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5DD68
	for <llvm@lists.linux.dev>; Tue,  2 Nov 2021 17:35:32 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id n8so6750497plf.4
        for <llvm@lists.linux.dev>; Tue, 02 Nov 2021 10:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O3RaY5lV5jwKKt/q1CRIChZ7HnFnQKYTu/U28LOt44c=;
        b=aGoZgLwxU+YXDbNoh4xcc2s+7ia4/gVJFCf17LZ4V/0/7I0d+XW4fItrqE3pSMLgmb
         OErb+j01QPgYhJfGCEZofXj5VA4IctPZwEIrGKxaDzlJrX4fLSFpFPtc909bi2Y5xvgi
         fe8OJzPjBcMKf3Q+UEBSpVveX6RrE34Utt6tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O3RaY5lV5jwKKt/q1CRIChZ7HnFnQKYTu/U28LOt44c=;
        b=rqfzhxOnWpjTsfPQjei8OPu9FKfqs0fJUgYmSe+gG5FLoGSjrkCslYUCwPtYyuD4CD
         ooPAXfkOsmuP4sJpVCvEy9cb9YVSUHSHQLjWyJAi3buLrH7FadxwNACrEvBPOQmSNzMS
         cIlZ4KIPxQo4D/ckOy+oYGCS0rAYasrB0HWPFZJ9C0DD0ijQCZtOMMBqgd/LMvvVxDRM
         rmWKQOfwRBM6V1G1xU///CwKtwBkdmMpGUcY/mGM3c4Qq5Tt4KUZvDssyXe8oi0icWSh
         yhndD4VXtdgFZP8qU62Z+dVvbMBSbktFu4QVvhk4s8OfVqc+0v0V68R/VWfem2/TB9WZ
         rUsQ==
X-Gm-Message-State: AOAM531/R6fONNghjInjRHkE3LJWQ72GNB8pD094ELdX5Wr7AUkYQ4rz
	cYYqj4N5ItTMM7anqkC2iykl3g==
X-Google-Smtp-Source: ABdhPJwK/3mwzawQkfDkbyqKFJyoCj1lB4WANIjaZOTexmG7DKz5GSJJ+LCAs7Vm8PpsCXOjkwixYg==
X-Received: by 2002:a17:902:ea11:b0:141:c6c8:823a with SMTP id s17-20020a170902ea1100b00141c6c8823amr20593621plg.29.1635874531887;
        Tue, 02 Nov 2021 10:35:31 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 21sm2979010pjg.57.2021.11.02.10.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 10:35:31 -0700 (PDT)
Date: Tue, 2 Nov 2021 10:35:30 -0700
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, X86 ML <x86@kernel.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev, joao@overdrivepizza.com
Subject: Re: [PATCH] static_call,x86: Robustify trampoline patching
Message-ID: <202111021029.79D81E590@keescook>
References: <CAMj1kXEx10gC8eH7rV-GbZZj2M3uDue6HYsKb+A5J01zOxm_FA@mail.gmail.com>
 <20211027124852.GK174703@worktop.programming.kicks-ass.net>
 <YXlOd1lyKZKAcJfA@hirez.programming.kicks-ass.net>
 <CAMj1kXHKh7wv6JqusVnoiQDMm7ApFq2ujzbfWmM9AzLKFehhAA@mail.gmail.com>
 <YXlcMluaysPBF92J@hirez.programming.kicks-ass.net>
 <CAMj1kXECTdDLVMk2JduU5mV2TR0Cv=hZ9QOpYRsRM1jfvvNikw@mail.gmail.com>
 <CABCJKufpS4jJxHqk8=bd1JCNbKfmLDKBbjbhjrar2+YQJFiprg@mail.gmail.com>
 <20211029200324.GR174703@worktop.programming.kicks-ass.net>
 <20211030074758.GT174703@worktop.programming.kicks-ass.net>
 <20211030081631.GF174730@worktop.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211030081631.GF174730@worktop.programming.kicks-ass.net>

On Sat, Oct 30, 2021 at 10:16:31AM +0200, Peter Zijlstra wrote:
> foo.cfi:
> 	endbr
> 	xorl $0xdeadbeef, %r10d
> 	jz foo
> 	ud2
> 	nop	# make it an even 16 bytes
> foo:
> 	# actual function text
> 
> 
> Then have the address of foo, be the address of foo, like any normal
> sane person would expect. Have direct calls to foo, go to foo, again, as
> expected.
> 
> When doing an indirect call (to r11, as clang does), then, and only
> then, do:
> 
> 	movl $0xdeadbeef, %r10d
> 	subq $0x10, %r11
> 	call *%r11
> 
> 	# if the r11 lives, add:
> 	addq $0x10, %r11
> 
> 
> Then only when caller and callee agree 0xdeadbeef is the password, does
> the indirect call go through.
> 
> Why isn't this a suitable CFI scheme even without IBT?

The trouble is that the callee is doing the verification. There's no
protection against calling into a callee that doesn't perform a check
(e.g. BPF JIT, or otherwise constructed executable memory, etc). The
caller needs to do the verification that what they're calling into is
safe before it makes the call.

-- 
Kees Cook
