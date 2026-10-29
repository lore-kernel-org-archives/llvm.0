Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277586;
	b=cl3L3u+/zznxnxn2yY7HP+esP2XkcDc0Xj1k+CrTXZljbKljArRo5ItFy7hQbnUubYVj
	 lCGnUSCDQoI9RlwrgalPFPtMoCimClmskDtOxidl5w3oYx8Al1J48xcrmT/455Uhwf9bI
	 vZPdEt8qnDfuhK6uHX6HJjfdIlA/Aa2Qd5x18nmVruWuvOWOm9lSXY8c+iMy6mJtv6qQm
	 cvYOraA5jnCIjeUWJzyboXv+vV8Jg3abLYJ1hug9+aOXVx5d909syYayfK4oikbcF0kS9
	 eaPYO8pOO5v5lT1VaFQT3Rrqx/I9Qmei/ZJCnJ7KFS2wvvmkpTnEC7aHGFkTQtPER6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277586;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8QpU4Pn+1DJj4PNQiajvyOF9nu660N/WWYTEj5PETZc=;
	b=HNgCwwk2zw85mUGoJEftlbEFLkvZkoZorH7z8cWpbjYEBiJ+rxLscM08sQ0M8/Rzv/VP
	 JLMLTxcUUhTs82OuAtxyNvN6XPXhgIaFuPkAhQ/h6uG6mW+Snzsu0XPj16OmP0gHaPNgl
	 0fymXNBZEwqxf9Gsm+EaOTJ8FO8nsgC/ECV/JZk5MwDFpncfnh9VTQAfkvbVXl1+/A/El
	 /XVpNa3F/S6B0/RmOgV/wqVd5N5IC1K8Yb5VDPwnWphGm9veCJ/dN1fpme1D2tDYEYfaH
	 97sdRAQ4nf/w/oJb4uybvFtRbQ5FV5Putc1JS2WYR2XNpPoiFnxuPKXdBa/ErwYbUIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=iy1mfYZb;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F7F606A31A;
	Thu, 29 Oct 2026 12:39:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89F7F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=iy1mfYZb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8QpU4Pn+1DJj4PNQiajvyOF9nu660N/WWYTEj5PETZc=; b=iy1mfYZb+71jxBenkjCENAAZON
	2No1qgOBJc/TNdetu+OUtN7AS/MdFZS+U5xSzBBxNtralcqsbsxT6XTTM5y3xHD3pPXOq7MI0AVkd
	VpcuVFDeNkCFSIrcBNQqfbU5B5Y64hWb0ENwMH7LA+onG4SwWXIzESdFtdONPVSVOsoqO2AfPFPOk
	SGPqaUS1AA6BFNGx0HzahGLJJ77RBUH4PMVau6f3tON/V4JSEamJAWbVnWW5cRLMhXK6Gh+kUkME+
	7TS5VCumXmLN1/YxrMfVsoHL10zas9O7n6ZrBlqM0c0mELJ0Ei5Fulh/3Xs6ezAtvbnFCuv9mfL9B
	1nvF1VZQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPPw-0000000GyEe-0Izb;
	Thu, 29 Oct 2026 12:39:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9EE86300312; Thu, 29 Oct 2026 13:39:37 +0100 (CET)
Date: Thu, 29 Oct 2026 13:39:37 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Breno Leitao <leitao@debian.org>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-team@meta.com
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when
 Spectre v2 and BHI are off
Message-ID: <20261029123937.GD1813469@noisy.programming.kicks-ass.net>
References: <20261029-syscall-table-dispatch-v1-1-bca9dbb886de@debian.org>
 <20261029104938.GC1813469@noisy.programming.kicks-ass.net>
 <auM6mSXz-BVIjYBc@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auM6mSXz-BVIjYBc@gmail.com>

On Thu, Oct 29, 2026 at 05:30:25AM -0700, Breno Leitao wrote:
> Hello Peter,
> 
> On Thu, Oct 29, 2026 at 11:49:38AM +0100, Peter Zijlstra wrote:
> > On Thu, Oct 29, 2026 at 03:27:23AM -0700, Breno Leitao wrote:
> > Bah, this reminds me I still have these patches:
> > 
> >  https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=x86/syscall
> > 
> > which make your patch impossible. The reason for not dispatching through
> > the syscall table is that syscall hijacking becomes a _LOT_ more
> > difficult.
> 
> Cool, this would in fact solve my problem as well.
> 
> My goal is to make booting with mitigations=off equivalent to building
> with CONFIG_CPU_MITIGATIONS=n, so we can ship a single kernel and pick
> the mitigations at boot time. Your patches get there in a different way,
> but that doesn't matter for my use case.
> 
> With "x86_64/entry: Unconditionally use -fno-jump-table", x64_sys_call()
> becomes a compare tree on every x86_64 build, so system call dispatch is
> the same whether the mitigations are disabled at boot or at build time,
> which is basically my end goal.
> 
> Also, KBUILD_RISTFLAGS in that patch looks like a typo for
> KBUILD_RUSTFLAGS.

Haha, good one, let me fix.

> That said, can I do anything to help those patches land? I see they are
> from June, and I am wondering if anything is blocking them.
 
Mostly I just completely forgot about them :/

I've since rebased them and went back to look for robot reports on the
tree, and found one weird case where GCC-14 with an UNWIND_FP=y build
insists on not doing tail-calls which then trips up objtool noinst
validation.

I need to figure a way out of the noinstr validation puzzle. Also, lunch
and a school run. I'll try and post them soon.

Thanks!
