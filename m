Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E3237C114
	for <llvm@lists.linux.dev>; Thu, 22 Jan 2026 18:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769106685; cv=none; b=mIbGGyPSSAt4H8CzGvEO5cXSoFgFqpmh0jwahMX8DjlHoIzi5gMGLYXvypHmVFF7RKyLloFPf8k34rEnCOZ62oLFgDEVt6ZmFA8jKWr3mw6rWzo5H0IEJ8KTz/Nzwmfg1+j2GgI+CnkaannLt4YgVNjZWviknkhjDk51X6w2dlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769106685; c=relaxed/simple;
	bh=V/YWVCkksI3r+GuGClBoLZVL9TzMOkDP/a4rG8gzipY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6Hy9Lyd9oQaga6JiedjRZOV7+Fq1gMEQH3wcTvSmzrwjkwrMH7YCCKhIEHjEJ5addvE5EwWXPOAFK3OpAjwga5Gnu/bvF7gC6idmpxusPwiskXE4GmU9c2YMuUqeUBxdr+mZJxTeLviIOmE7PDKCLQX+QXla/4hVxPI2RmK9I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RFvikP3l; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RFvikP3l"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee3da7447so10248665e9.0
        for <llvm@lists.linux.dev>; Thu, 22 Jan 2026 10:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769106675; x=1769711475; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHcGMjkyTHznibSHVyswUIfEQEbbN74bslm02im2fbg=;
        b=RFvikP3lVsPRrcRFaRAjVm6qhkluuyvoDD+/8fWKsWITJZzR08zzGiDq81aaP1f2sB
         ja3C1yWy0z+j5fz+kGZ0/6wUnMD9N57+KQIVhA5pC1N9XZ2aPZvKr2bGjLDWMJrly6N3
         1JSm8xzng0dRnmAGN3bhkhut6odh7Yhry/Y8jPwTqZfZ5YlSgdKuc/WRd8oj/DjiB8tp
         +6Ct/bSa0LSxIUslmemEs8gGPC9NoklEhjEx3R7MjHGlk8C/t1sGaDeo8ssp1r3nAp1T
         PQ0mQBtfn/3UMosdQYczZWIsVjynYU3KoQfr6Ln6qrMkbndlBwAloHyY2RU0MYTwTyXk
         notw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769106675; x=1769711475;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sHcGMjkyTHznibSHVyswUIfEQEbbN74bslm02im2fbg=;
        b=iOaiCiAruY67KmQ8OS10oQC+RjtUb5Lv6igrc9G7dw0N0Py103dCFfF+Fz0xUybF+X
         n6oSdjeCB5+Y1EcG0TEYGZau9NnOm19dgmqm52WN5R9qhJmeCZXCs5BUSEJOiod7GckC
         uxhedNY13t7IevMeDHPcJlhtCHU/1Yq6Fnd94lvj4XSc4mrdNSpeMrOWCCu5iBhatIBU
         QfpcIKiIe90X5yhOpo1goYmprgTN5U9E58o4k6MnP3uqn8GN3UcRG56Tu6Fou1WH2K6t
         rc5ruZa1QQpM9zNLvXePMHCpq9bG2mC02Y2pGdSggJaE4WX/cE8lfEF759nzfhwVGzQA
         72EA==
X-Forwarded-Encrypted: i=1; AJvYcCUiHdsrBeLJB9xW3VTUF4T6bOlq6eSbyWkomOksey9bqWauXP6M0arHdDGe3cISNKGtTPfY@lists.linux.dev
X-Gm-Message-State: AOJu0YxEcURVdGvc7kPnwGw3Lk77e0kLAJLxdRSqeBXM9cmtablOv8WV
	V+v/OP2Z9yQQBe4UZnUFXySBjJmhUJTlyXt4RDnvTS2SSJ0OLjcIBKv/UKgKbI6pa/ceOfRKIlD
	ZqesDXnkd
X-Gm-Gg: AZuq6aJL3pxh4lvqg8mSJqwihEBKJuyapAkGxfubjt9KxOpg5HtXPsH9s/biOqozLqS
	nXJYDqQQrSTKl9IQozBRiOYWmOMTcKg97b9mX2eFlct0sP0pVENtXvuZR3KHd0Y4U5HvZx0tatv
	2G/MN8XjzU20eJcmUQ0g20GHky4iTU41LDPioUtZgO+c2XlINI5UjyR98BCINBss2zVNwf+6rzP
	BnD0r9twxLqD8Dva0zaeEfVkCQtGz/WullL0qxUf19mJftisw9DPtDD4Fidy3oJk0dqoA9ky/bq
	TcWPjKidxvASje6jElPaWh5o90Kz0gwSijre7YA7D5rU9V/1bgnydFRFYAgz9Y3Z666p8h8g6mH
	AbdwI4ciiZR7yJJBd++x96TWCWjIemCGHzZ32ke8YEP8yoq8nNb1XCKOWHTUyqIklMC1CLzmPOx
	IgpdPvDg4ubL1ABcimaqZRjpcOC9euE2JH7VH/hhCHd2vln5o0rN35EoQ/
X-Received: by 2002:a05:600c:83c5:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-4804c95e234mr9651355e9.15.1769106674888;
        Thu, 22 Jan 2026 10:31:14 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:bb08:c2:8cd9:1733])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm130174555e9.2.2026.01.22.10.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 10:31:14 -0800 (PST)
Date: Thu, 22 Jan 2026 19:31:08 +0100
From: Marco Elver <elver@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>
Subject: Re: [peterz-queue:locking/core 10/10] kernel/futex/core.c:982:1:
 warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the
 end of function
Message-ID: <aXJs7Hi90iOIoeMM@elver.google.com>
References: <202601221040.TeM0ihff-lkp@intel.com>
 <20260122091600.GE171111@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122091600.GE171111@noisy.programming.kicks-ass.net>
User-Agent: Mutt/2.2.13 (2024-03-09)

+Cc Will

On Thu, Jan 22, 2026 at 10:16AM +0100, Peter Zijlstra wrote:
> On Thu, Jan 22, 2026 at 10:30:28AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
> > head:   33d9e7fdf9c17417347d1f06ddebaf25f21ab62a
> > commit: 33d9e7fdf9c17417347d1f06ddebaf25f21ab62a [10/10] futex: Convert to compiler context analysis
> > config: arm64-randconfig-001-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221040.TeM0ihff-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221040.TeM0ihff-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
> >      982 | }
> >          | ^
> >    kernel/futex/core.c:976:2: note: spinlock acquired here
> >      976 |         spin_lock(lock_ptr);
> >          |         ^
> > >> kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
> >      982 | }
> >          | ^
> >    kernel/futex/core.c:966:6: note: spinlock acquired here
> >      966 | void futex_q_lockptr_lock(struct futex_q *q)
> >          |      ^
> >    2 warnings generated.
> 
> Urgh, this is the arm64 READ_ONCE() confusing the thing. It can't see
> through that mess and realize: lockptr == q->lock_ptr.
> 
> Marco, any suggestion how to best fix that?

I have a tentative solution:

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 78beceec10cd..75265012ff2d 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -31,9 +31,8 @@
  */
 #define __READ_ONCE(x)							\
 ({									\
-	typeof(&(x)) __x = &(x);					\
-	int atomic = 1;							\
-	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
+	typeof(&(x)) __x = &(x), *__xp = &__x;				\
+	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
 	switch (sizeof(x)) {						\
 	case 1:								\
 		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
@@ -56,9 +55,10 @@
 			: "Q" (*__x) : "memory");			\
 		break;							\
 	default:							\
-		atomic = 0;						\
+		__u.__val = (*(volatile typeof(__x))__x);		\
 	}								\
-	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(__x))__x);\
+	*__xp = &__u.__val;						\
+	*__x;								\
 })
 
 #endif	/* !BUILD_VDSO */

This works because the compiler doesn't analyze alias reassignment
through pointer-to-alias within the same function. An alternative is to
do the alias reassignment via an __always_inline function that takes the
alias as a const pointer, and then cast the const away and do the
assignment. But I think the above is cleaner. Only compile-tested.

It also gets rid of the "atomic" flag, and switches to TYPEOF_UNQUAL
which fixes a latent bug where __unqual_scalar_typeof was applied to a
const non-integer variable that is less than 8 bytes, resulting in __val
being "const" itself (likely benign).

Before:

  File: vmlinux
  Size: 59628672  	Blocks: 116472     IO Block: 4096   regular file

After:

  File: vmlinux
  Size: 59563056  	Blocks: 116336     IO Block: 4096   regular file

So this claims we're saving space. But the couple functions I inspected
that use READ_ONCE were identical. I need to double-check the asm, see
where the differences are and if we're actually producing better code,
and write a commit message that makes sense.
