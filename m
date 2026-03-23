Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAE63112BC;
	Mon, 23 Mar 2026 23:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774308359; cv=none; b=YIXKW05JrYH1E0JRNFU9hNHb4eq6NYKGkP4GcfgKPJx3BSqcsYcYztYZt8pqZPhUC1Jcx3jWcaj7ySX5SNWGBjEexWzpTESaj6kRg8w0D6FLKoVwbS0CvkJYW/NY6zFdlDEWccFShxhAWHMlo6n/AcXkoJfxBNf1YjRSGafy3VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774308359; c=relaxed/simple;
	bh=AbXuB5XLeYp55kSHfswkm29uNIlm7/yVdmRsLLR5VWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEdE6shMKn2QgXmsP6tUCflOKseVQEsxAqT0k5FhApjgIN7vw3jM1JJJ+K+N0y0/P97nhXFChiAqRe+RhcEZRE8RDf/qJNWhppznKQgIGmCbkxM2iUyLjS/gkBsu80j8mEFa6tD/t/277oWhEmVj68ZBZ/rnECLitxfzACFz8o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iyPboCtf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iyPboCtf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066B5C4CEF7;
	Mon, 23 Mar 2026 23:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774308359;
	bh=AbXuB5XLeYp55kSHfswkm29uNIlm7/yVdmRsLLR5VWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iyPboCtfo5v+KS9g3rGGYXnABxSWTszyfL45GV7hY0yuAAGoBpOy9wzziSiEjjLh7
	 IJuGL9HCxkWPr1gFbZ7Xw/eqb++rHMq9vzNpuOvhFh932YMPTLVOCreTz39G8e2T29
	 96zkwOGBf9TouVsZuN5z7bfGAQFpaPoI2FqMmHVxhQy4pm74zvG1467W6hL28M5NL5
	 Oqd44zCYdk07Js1wptIc3Z+fb28JzgSydS6iP0Q8gb2A9HYTexk7KeU+5fMw5Gr1yc
	 23GN4NxfImL0yKNR+E9dgrdZddFqJtO+D84bVIf65mhPLMyIs7Dcn/2ocP0GYOIjYk
	 Mup9HpFXeXpbw==
Date: Mon, 23 Mar 2026 16:25:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	Bart Van Assche <bvanassche@acm.org>,
	David Laight <david.laight.linux@gmail.com>,
	linux-kernel@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH] compiler: Simplify generic RELOC_HIDE()
Message-ID: <20260323232552.GA4147808@ax162>
References: <20260319135245.1420780-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319135245.1420780-1-elver@google.com>

On Thu, Mar 19, 2026 at 02:52:38PM +0100, Marco Elver wrote:
> When enabling Context Analysis (CONTEXT_ANALYSIS := y) in arch/x86/kvm
> code, Clang's Thread Safety Analysis failed to recognize that identical
> per_cpu() accesses refer to the same lock:
> 
> |   CC [M]  arch/x86/kvm/vmx/posted_intr.o
> | arch/x86/kvm/vmx/posted_intr.c:186:2: error: releasing raw_spinlock '__ptr + __per_cpu_offset[vcpu->cpu]' that was not held [-Werror,-Wthread-safety-analysis]
> |   186 |         raw_spin_unlock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
> |       |         ^
> | ./include/linux/spinlock.h:276:32: note: expanded from macro 'raw_spin_unlock'
> |   276 | #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
> |       |                                         ^
> | arch/x86/kvm/vmx/posted_intr.c:207:1: error: raw_spinlock '__ptr + __per_cpu_offset[vcpu->cpu]' is still held at the end of function [-Werror,-Wthread-safety-analysis]
> |   207 | }
> |       | ^
> | arch/x86/kvm/vmx/posted_intr.c:182:2: note: raw_spinlock acquired here
> |   182 |         raw_spin_lock_nested(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu),
> |       |         ^
> | ./include/linux/spinlock.h:235:2: note: expanded from macro 'raw_spin_lock_nested'
> |   235 |         _raw_spin_lock(((void)(subclass), (lock)))
> |       |         ^
> | 2 errors generated.
> 
> This occurred because the default RELOC_HIDE() implementation (used by
> the per-CPU macros) is a statement expression containing an intermediate
> 'unsigned long' variable (this version appears to predate Git history).
> 
> While the analysis strips away inner casts when resolving pointer
> aliases, it stops when encountering intermediate non-pointer variables
> (this is Thread Safety Analysis specific and irrelevant for codegen).
> This prevents the analysis from concluding that the pointers passed to
> e.g. raw_spin_lock() and raw_spin_unlock() were identical when per-CPU
> accessors are used.
> 
> Simplify RELOC_HIDE() to a single expression. This preserves the intent
> of obfuscating UB-introducing out-of-bounds pointer calculations from
> the compiler via the 'unsigned long' cast, but allows the alias analysis
> to successfully resolve the pointers.
> 
> Using a recent Clang version, I observe that generated code remains the
> same for vmlinux; the intermediate variable was already being optimized
> away (for any respectable modern compiler, not doing so would be an
> optimizer bug). Note that GCC provides its own version of RELOC_HIDE(),
> so this change only affects Clang builds.
> 
> Add a test case to lib/test_context-analysis.c to catch any regressions.
> 
> Link: https://lore.kernel.org/all/e3946223-4543-4a76-a328-9c6865e95192@acm.org/
> Reported-by: Bart Van Assche <bvanassche@acm.org>
> Reported-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Marco Elver <elver@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  include/linux/compiler.h    |  5 +----
>  lib/test_context-analysis.c | 11 +++++++++++
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
> index af16624b29fd..cb2f6050bdf7 100644
> --- a/include/linux/compiler.h
> +++ b/include/linux/compiler.h
> @@ -149,10 +149,7 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
>  #endif
>  
>  #ifndef RELOC_HIDE
> -# define RELOC_HIDE(ptr, off)					\
> -  ({ unsigned long __ptr;					\
> -     __ptr = (unsigned long) (ptr);				\
> -    (typeof(ptr)) (__ptr + (off)); })
> +# define RELOC_HIDE(ptr, off) ((typeof(ptr))((unsigned long)(ptr) + (off)))
>  #endif
>  
>  #define absolute_pointer(val)	RELOC_HIDE((void *)(val), 0)
> diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
> index 140efa8a9763..06b4a6a028e0 100644
> --- a/lib/test_context-analysis.c
> +++ b/lib/test_context-analysis.c
> @@ -596,3 +596,14 @@ static void __used test_ww_mutex_lock_ctx(struct test_ww_mutex_data *d)
>  
>  	ww_mutex_destroy(&d->mtx);
>  }
> +
> +static DEFINE_PER_CPU(raw_spinlock_t, test_per_cpu_lock);
> +
> +static void __used test_per_cpu(int cpu)
> +{
> +	raw_spin_lock(&per_cpu(test_per_cpu_lock, cpu));
> +	raw_spin_unlock(&per_cpu(test_per_cpu_lock, cpu));
> +
> +	raw_spin_lock(per_cpu_ptr(&test_per_cpu_lock, cpu));
> +	raw_spin_unlock(per_cpu_ptr(&test_per_cpu_lock, cpu));
> +}
> -- 
> 2.53.0.851.ga537e3e6e9-goog
> 
