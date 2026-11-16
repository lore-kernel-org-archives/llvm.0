Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857946;
	b=HorCRbNRZRKybssLCr5wFceL84ku8LHkpY9nUFxHAHpfULKuyiCRwVpl5i2v6QI2N19F
	 CXctNlIPIshXEChuAzmLs3lOkbaYMZw8uKOJAyHGsRyyF6Z5oRsH8TR82dnJTjnyQV7/j
	 5MTkQElhNs56a0/ITR3Z09H2j9S/x3xCGAvgKn9oPcnoLnIOQ+LzCoxbesztFCfXgChRM
	 kmrjMiV2xxGHw5Z+h48cBQ9U3tFDWI3/2Naf1wemEaUgLG1cF80HRn7W8xULaKDADOFXr
	 /ZxRCWMed1RAcWca91EDoD1N8YyTErANGEEGsnIPx3YfmziCPC52cGcuLQ3O+aNpYBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857946;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=XSrD94cLp+aFWvtYg7yPqUaSsfnhrS+s9J7K3EwFKFA=;
	b=rymfB7AFxGup4Wk284jdYgF2GJWZJ7iTl3vXVWhMD9nK6HxHnGTWiAWuDuMnBn6WtBYv
	 1QcYcn9P6Mm3iSLq4F4Brm6vxHpzF930uK0+ywxPCgpYty7jVcLEGhVrWQWl9Bfe72aNK
	 FOXng/idtYl754SHybpmrKHrL2Wpk+2EYhk62Yhz/t8gqpcb83XfmzaEFeQgnDXh/8NnH
	 3mipnIDT/OGymbZ09gvdE0SDxkwdp90zKDyLplAlOhpHvJlaB32bIDyi2PEpJFFkLAH5g
	 uC39t7PMXIt8EIQrrEvwnCybMnWKCWtaQfbFvctmIz/NsGw8yD3kck4NxJGzr1WlLHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZATBVlba;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515DB606A31C;
	Mon, 16 Nov 2026 19:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZATBVlba
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C4E1F000C4;
	Mon, 16 Nov 2026 19:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794857946;
	bh=XSrD94cLp+aFWvtYg7yPqUaSsfnhrS+s9J7K3EwFKFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZATBVlbaOIbrv8L1W8WmvvvEQnkugSgwhqr7UDldPRqA4S8+ZklVXZV8j/BcA+imM
	 338sRioeumRIBORQE0TBQuDrOyuUrJgoOE7fsX5NT4fS02WsI2avhUasO7sh6SGX1p
	 gfOJIza6mN/GY81kHygQmBtknxLpEtuoQ6VaF42U93TqO+g/XWZprhCWH5TS+vmFp0
	 tcMIp2f68AmpkDEKEkLwUVSKd5mmm7+Z2iKjQgDMSa6s2g+KdzerHW/CPTnXPy8iHY
	 M/G8PEw7fVc/ghctiqxOrIqRZEhgzUGIVhi9WRbauQdspH2SuR0zLIBwQeQQTKkVk7
	 1dcaLA8eaYBBA==
From: Sasha Levin <sashal@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	Bill Wendling <morbo@google.com>,
	Chuck Wolber <chuck@wolber.net>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH v2 11/20] objtool: Detect code coverage instrumentation in noinstr code
Date: Mon, 16 Nov 2026 14:39:03 -0500
Message-ID: <20261116193903.227017-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avdUyFTijaXU5MwM@jpoimboe>
References: <20261103015238.3780910-1-sashal@kernel.org> <20261103015238.3780910-12-sashal@kernel.org> <avVaaxKUA2ArB6RG@jpoimboe> <20261112130906.1316655-1-sashal@kernel.org> <20261112151232.GC1813469@noisy.programming.kicks-ass.net> <avX80WkCFuGyS1y0@jpoimboe> <20261113150920.1953634-1-sashal@kernel.org> <avdUyFTijaXU5MwM@jpoimboe>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 13, 2026 at 10:22:51AM -0800, Josh Poimboeuf wrote:
>That seems circular though, I'm still trying to figure out what the
>actual problem is.

Right, sorry, I'm still trying to piece things together myself :)

From what I get from Peter[1], a counter update is a store, and a store can
trap:

  Because you can get exceptions from memory accesses just fine, which, if
  you're inside an exception handler and haven't dealt with recursion
  conditions yet, can be fatal.

So if I try to play with it and produce #DB by placing a data breakpoint, I can
observe:

 - exc_debug_kernel() bumps __gcov0.local_db_save twice before it reads
   DR7. With a write breakpoint on that counter the next kernel #DB
   never returns, the CPU spins between asm_exc_debug and
   exc_debug_kernel with DR7 still armed.

 - exc_page_fault() bumps __gcov0.read_cr2 right before "mov %cr2". If
   the breakpoint on it samples user callchains, the #DB handler faults
   walking the user frame pointer and CR2 is gone. I tried 300 writes to
   freshly mapped pages with %rbp pointing into a PROT_NONE page, and
   all 300 got a SIGSEGV for the %rbp address.

I don't think it's a "keep the pieces" thing, since we already refuse
breakpoints on the other data that code touches. So for example,
within_cpu_entry(), and 3943abf2dbfa ("x86/debug: Prevent data breakpoints on
cpu_dr7") is a very similar case I think: something local_db_save() reads
before DR7 is cleared.

It's not only a coverage problem either (I think I just got this as "additional
homework" from Peter :p ). The within_cpu_entry() list is kept by hand (having
objtool enforce it has been on the TODO list since 2021 [2]), and the same
kernel without coverage has holes in it too:

 - A read/write breakpoint on cpu_current_top_of_stack gives the same
   300 of 300 wrong fault addresses, as sync_regs() reads it before CR2
   is read.

 - With spectre_v2=ibrs, a read/write breakpoint on
   x86_spec_ctrl_current hangs the CPU in paranoid_entry(), which reads
   it before DR7 is cleared.

So what coverage adds is thousands more of these in places nobody can list, and
with GCC they're ordinary .data/.bss that can't be blacklisted. That's what the
objtool rewrite gets rid of.

>FYI, a partial objtool port (without the more controversial CFG
>reverse-engineering bits) is likely coming to arm64 soon to support
>klp-build, in which case this should be possible there as well.

Nice. Without the CFG, can it still tell what's inside
instrumentation_begin()/end()? If not it could just drop every counter
in .noinstr.text, I think that's fine.

[1] https://lore.kernel.org/all/20210614190700.GF68749@worktop.programming.kicks-ass.net/
[2] https://lore.kernel.org/all/YB0+P3LiduCpWctO@hirez.programming.kicks-ass.net/

-- 
Thanks,
Sasha
