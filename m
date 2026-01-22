Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEBB340D90;
	Thu, 22 Jan 2026 09:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073369; cv=none; b=HSazoETCCm2afddusXWfhBvrdGsA8mRNNWQZD9T9iRoP0Yhaa3+VT4NObYC2/PzmgkZrAyD+uXCzYWfurSd5bSTXTenlM4d9qNIT7Mef/daNVdINvqJ5c2F4Q+bJUR8DNqWtMfdMf/8mBxkRnLuGAYSsrNfsq2uteOuarDcNYok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073369; c=relaxed/simple;
	bh=4Yqpu/3RDaqHHmpAmcfDLxY/3hh/yvHYJQNbjtdPfyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lm4qY78InXZEgfP8JcQzidepTg4P4WtEma2veFjIY3YcUHuQHq8j65O0AhlWVCz3l7+cO4QPrOzqYbDmenSmmN4x1PxsygjOrF4NXzICiCOGifXSj2hueeY5TD9o0ZEdsrnNcLdOJpZ0J3NQFIOziTGkC0qD0RQfr53zJ9YxEjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bYAQbliJ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bYAQbliJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C7U/N0bsUrzeq4Sw7kLjOn3QUgVvKp0M4t89FKQnaf0=; b=bYAQbliJucXy02Yg+l2Vf7BqsF
	Lwv/vTd0enRzZbB7RWSTjJutwdkGJiEH+Kz8pkajRosmh8y0zh9AOfwmtrkcpmnE9DbC1afTMnLrj
	TRkHkuVMrgKe8IDCuIRLfWQWKJL90B7RbjaiKX+FU9AGaQbRMDxU6FJuzNGixBSItXYsfRADKz63y
	/9udxfJCEJyM40lZykBmGWcdFKPiEUWKnOyL1fCqxtqmV3CUfnTa6ObzeZYYgBuDXxxhs4lSfgNPl
	dZmzfj893Lan9mJpDXK0kZkXrWNw812KMv8G/NoSaQp5AMifOxNiocUssurGKkk9APUaMTEvMblXA
	P4dfL75A==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viqnJ-000000001pK-2LI2;
	Thu, 22 Jan 2026 09:16:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9CE8A3030AC; Thu, 22 Jan 2026 10:16:00 +0100 (CET)
Date: Thu, 22 Jan 2026 10:16:00 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marco Elver <elver@google.com>
Subject: Re: [peterz-queue:locking/core 10/10] kernel/futex/core.c:982:1:
 warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the
 end of function
Message-ID: <20260122091600.GE171111@noisy.programming.kicks-ass.net>
References: <202601221040.TeM0ihff-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202601221040.TeM0ihff-lkp@intel.com>

On Thu, Jan 22, 2026 at 10:30:28AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
> head:   33d9e7fdf9c17417347d1f06ddebaf25f21ab62a
> commit: 33d9e7fdf9c17417347d1f06ddebaf25f21ab62a [10/10] futex: Convert to compiler context analysis
> config: arm64-randconfig-001-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221040.TeM0ihff-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221040.TeM0ihff-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
>      982 | }
>          | ^
>    kernel/futex/core.c:976:2: note: spinlock acquired here
>      976 |         spin_lock(lock_ptr);
>          |         ^
> >> kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
>      982 | }
>          | ^
>    kernel/futex/core.c:966:6: note: spinlock acquired here
>      966 | void futex_q_lockptr_lock(struct futex_q *q)
>          |      ^
>    2 warnings generated.

Urgh, this is the arm64 READ_ONCE() confusing the thing. It can't see
through that mess and realize: lockptr == q->lock_ptr.

Marco, any suggestion how to best fix that?
