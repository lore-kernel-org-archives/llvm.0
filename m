Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF39A24E4C3;
	Mon,  3 Aug 2026 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785745661; cv=none; b=nYQUC9ZvJ4xF1DzgpbUuxhWgO3aDJz25rAhYeH/1RTBsKSoYcQwu6Uq7rBp8vSWjr2ydFBPJaEw1y5eUP0gmjIQ2hZxkN8RvCFolaIEb0Y/GK+YNNiqsZlMc1RaB7LdbLlO8H/fAbvKCJOoH6o/TD7wMiyUBVzJMei14z9gsouc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785745661; c=relaxed/simple;
	bh=0Sm0abNDpH36Fe1YFVKqb3fShhQJwOkQMhoejusgA1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxM05ojIJmC3hPqCWsvo6zcAt18n85+pZMIumYjbstjqFi7u0+mDQxzm7pDbqUDKw6FxUGHcIdTSgWHyzDqFowXpKZmFIXmqKE8wwOdlDuZXymoIhXBpCh/bpZVr+fLXlrgLjoXtPLiR7M16x67PW6L8YGsIfl7gU3k3vR5ZGYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eEKWAANx; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eEKWAANx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OWbs+Njv6/iQ76BZ183o1IYjnJc3wYOlspGOGhipnWo=; b=eEKWAANxVweBrtwbHXkTc9ypXD
	rYVEnqBegRiYPqk1vJY2plo3duJEkYyPJNpCZVwiPcZpFqFW4Z+XxkspavROaHlAyYd5lLEHkNzco
	wUNHUZgvgNzexjgxe9bYtv2harJlhg6SgCqkLCiDJlYzkW/qBJEh6ARjGbzDzwDizGJVUOG2abxxS
	nwbE/xlsy7ZwDlQZvMYuUpOZe3+dL/e1kX1+oWHS5YJ9V6BEmo0bcYzaNgSIjh2m8+UWd4lR9uDv/
	K8a/iLrK0gF1Z0RraKGCw+Ro/0JARgVrdsw5nK6W6Lqp7r4gKPurGObkD0leCKZ6TsW7qdp4EUuvX
	vMHr5MDQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqo1E-0000000B1Xl-46rY;
	Mon, 03 Aug 2026 08:27:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 59579301127; Mon, 03 Aug 2026 10:27:32 +0200 (CEST)
Date: Mon, 3 Aug 2026 10:27:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Fangrui Song <i@maskray.me>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] riscv/runtime-const: Disable linker relaxation for
 RUNTIME_MAGIC
Message-ID: <20260803082732.GZ49951@noisy.programming.kicks-ass.net>
References: <20260802174342.597092-1-i@maskray.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802174342.597092-1-i@maskray.me>

On Sun, Aug 02, 2026 at 10:43:42AM -0700, Fangrui Song wrote:
> Commit ee10b1028129 ("riscv/runtime-const: Replace open-coded
> placeholder with RUNTIME_MAGIC") switched the lui + addi[w] placeholder
> from hand-encoded immediates to %hi()/%lo() of RUNTIME_MAGIC.
> 
> GNU Assembler folds %hi()/%lo() of an absolute expression at assembly
> time. LLVM's integrated assembler since 21.1 defers it to the linker
> instead, which range checks it: on riscv64 R_RISCV_HI20 must fit a
> signed 20-bit field, and RUNTIME_MAGIC (0x89ABCDEF) is a positive 64-bit
> value rather than a sign-extended 32-bit one, so it does not:
> 
>     ld.lld: error: relocation R_RISCV_HI20 out of range: 563901 is not in
>     [-524288, 524287]
> 
> The sequence is patched at runtime and its instruction offsets are
> recorded via ".long 1b - .", so the linker must not touch it in the
> first place. Add ".option norelax", as is already done for
> ALTERNATIVE() and static keys; the integrated assembler then resolves
> %hi()/%lo() itself and emits no relocation, restoring the exact
> encoding the open-coded placeholder produced.
> 
> Fixes: ee10b1028129 ("riscv/runtime-const: Replace open-coded placeholder with RUNTIME_MAGIC")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2179
> Signed-off-by: Fangrui Song <i@maskray.me>
> ---
> Applies to tip/locking/core; the RISC-V tree (riscv/linux.git) does not
> carry ee10b1028129.

Thanks, I'll stick this on top.
