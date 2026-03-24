Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589BE2288CB;
	Tue, 24 Mar 2026 14:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774361258; cv=none; b=lzzJJtR4BSqKq6BtvBgN4vrMWEGbxpE1ZPH6fY+DekgGi78Acv0XdZd12h4tWFG62+isvmrFelUj5Bh3CmD5ovfC3uH317/rX+8Kfqb8Dd9Flv/GQ8nZ2vRtwS6vqEFM0kWBMVYsM/DyOhWa8tPO33dcXk/6MAd26tEgZr5C2Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774361258; c=relaxed/simple;
	bh=SCxa3xd4g+Ka0xX5I9m3yhybixLiBqymnaytTg/1zE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKF8frXsp4no7nC2z9gGFLyt+6TI5+zsbwfmgscHxZoVX3IoK6VeHvs4DOcW4u+t1QsC1RR+Gz0YIsJgUVNGfl2tGMyICUqWWS1946Plvt5UvLevLOp7M2LayjdPILJJo3pBFr9bOdy1x9TweDvCQXriPpk4EHzjH3h5l/4TImc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ihWkDJQA; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ihWkDJQA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fK/JIZhe4JNezEAaTybJu36gqJghSew930BWOPgwcvs=; b=ihWkDJQA07OSVjUlNjLGIjVRN/
	1Y0rbz4BllAl65YRvdl24DbgSBtKHqcL66QCN4yrG1rVyduLzBYdDK6xziALXVxKk5Rl+45nhnNqG
	L60vIncBCLaa5NB+HawaKP7u98NDM+IUF3tD0SYdsDEYhwiHki+2OSmbjNhxllFBnMP20Mq8LaBIj
	c5LKzx4VLRU3bBSIm8nxUP4jy5bqhk1DN4hFLYl0VdPfHQ+ZgZf3Ig2qXhPaiTVzzOzC9M+atGLIF
	8lfW7pynOuIdeonjISKnCInYHS6moeU252d4JzENvh/OsoBO7ukHbfmP4bonJPN5Xey8qCH6IGkLu
	yEMC8Q8Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52Pu-0000000E7zL-39mh;
	Tue, 24 Mar 2026 14:07:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 29AC23002D8; Tue, 24 Mar 2026 15:07:34 +0100 (CET)
Date: Tue, 24 Mar 2026 15:07:34 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Marco Elver <elver@google.com>, Ingo Molnar <mingo@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	Bart Van Assche <bvanassche@acm.org>,
	David Laight <david.laight.linux@gmail.com>,
	linux-kernel@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH] compiler: Simplify generic RELOC_HIDE()
Message-ID: <20260324140734.GF3738010@noisy.programming.kicks-ass.net>
References: <20260319135245.1420780-1-elver@google.com>
 <20260323232552.GA4147808@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323232552.GA4147808@ax162>

On Mon, Mar 23, 2026 at 04:25:52PM -0700, Nathan Chancellor wrote:
> On Thu, Mar 19, 2026 at 02:52:38PM +0100, Marco Elver wrote:
> > When enabling Context Analysis (CONTEXT_ANALYSIS := y) in arch/x86/kvm
> > code, Clang's Thread Safety Analysis failed to recognize that identical
> > per_cpu() accesses refer to the same lock:
> > 
> > |   CC [M]  arch/x86/kvm/vmx/posted_intr.o
> > | arch/x86/kvm/vmx/posted_intr.c:186:2: error: releasing raw_spinlock '__ptr + __per_cpu_offset[vcpu->cpu]' that was not held [-Werror,-Wthread-safety-analysis]
> > |   186 |         raw_spin_unlock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
> > |       |         ^
> > | ./include/linux/spinlock.h:276:32: note: expanded from macro 'raw_spin_unlock'
> > |   276 | #define raw_spin_unlock(lock)           _raw_spin_unlock(lock)
> > |       |                                         ^
> > | arch/x86/kvm/vmx/posted_intr.c:207:1: error: raw_spinlock '__ptr + __per_cpu_offset[vcpu->cpu]' is still held at the end of function [-Werror,-Wthread-safety-analysis]
> > |   207 | }
> > |       | ^
> > | arch/x86/kvm/vmx/posted_intr.c:182:2: note: raw_spinlock acquired here
> > |   182 |         raw_spin_lock_nested(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu),
> > |       |         ^
> > | ./include/linux/spinlock.h:235:2: note: expanded from macro 'raw_spin_lock_nested'
> > |   235 |         _raw_spin_lock(((void)(subclass), (lock)))
> > |       |         ^
> > | 2 errors generated.
> > 
> > This occurred because the default RELOC_HIDE() implementation (used by
> > the per-CPU macros) is a statement expression containing an intermediate
> > 'unsigned long' variable (this version appears to predate Git history).
> > 
> > While the analysis strips away inner casts when resolving pointer
> > aliases, it stops when encountering intermediate non-pointer variables
> > (this is Thread Safety Analysis specific and irrelevant for codegen).
> > This prevents the analysis from concluding that the pointers passed to
> > e.g. raw_spin_lock() and raw_spin_unlock() were identical when per-CPU
> > accessors are used.
> > 
> > Simplify RELOC_HIDE() to a single expression. This preserves the intent
> > of obfuscating UB-introducing out-of-bounds pointer calculations from
> > the compiler via the 'unsigned long' cast, but allows the alias analysis
> > to successfully resolve the pointers.
> > 
> > Using a recent Clang version, I observe that generated code remains the
> > same for vmlinux; the intermediate variable was already being optimized
> > away (for any respectable modern compiler, not doing so would be an
> > optimizer bug). Note that GCC provides its own version of RELOC_HIDE(),
> > so this change only affects Clang builds.
> > 
> > Add a test case to lib/test_context-analysis.c to catch any regressions.
> > 
> > Link: https://lore.kernel.org/all/e3946223-4543-4a76-a328-9c6865e95192@acm.org/
> > Reported-by: Bart Van Assche <bvanassche@acm.org>
> > Reported-by: Sean Christopherson <seanjc@google.com>
> > Signed-off-by: Marco Elver <elver@google.com>
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks, I'll go stick it in tip/locking/core.
