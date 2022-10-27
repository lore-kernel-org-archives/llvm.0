Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18BFF849B;
	Thu, 27 Oct 2022 17:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4hGgb27cTX++8isifWT9xPyeahfYycj+S4eTYQjsVes=; b=UIXAKxL/N5TusR3U8o8CQe+gjC
	p2G6ER+peColdR9pM128fhsX0DOvtLDX2TMN0Pmc4sSSoiU0B4JbqYSULzqyMCYNNJTYsV5KpKODe
	/ChrA+hiRQv+KYGcvqqJUdsi8tZaU2eWlYxw+YbFM7db9USrEyaj8AS6RHRjetx0fEz6Yz6W4Q819
	h/xUJTjc9wn3KKQxJSAAjU0wdAVdfkF6uAZ6aJqTVjp85GtmaEGwLEfr9iGNKPaCuTkLrHZvCCJkx
	piBuNIeC+hXM/TnAhd3vSRI9lqQBrFaI2wlocj1ePavmNPyTP+jIY2esdAyM8AKhLevWegSVfAsVN
	+700HA9g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo6Qw-006v8L-1u; Thu, 27 Oct 2022 17:12:47 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 73B5E30029C;
	Thu, 27 Oct 2022 19:12:45 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5CD632C450536; Thu, 27 Oct 2022 19:12:45 +0200 (CEST)
Date: Thu, 27 Oct 2022 19:12:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Ravi Bangoria <ravi.bangoria@amd.com>
Subject: Re: [tip:perf/core 1/2] kernel/events/core.c:181:48: error:
 redefinition of 'cpu_context' as different kind of symbol
Message-ID: <Y1q8DcG09Z0PYXEf@hirez.programming.kicks-ass.net>
References: <202210272227.jWuKg5y6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202210272227.jWuKg5y6-lkp@intel.com>

On Thu, Oct 27, 2022 at 10:03:53PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
> head:   dc39beffcfc19a8dd2a09c5818dcd1a4e9099033
> commit: 983bd8543b5ab8e9a2870ae258bccd4ce7a22c7c [1/2] perf: Rewrite core context handling
> config: mips-randconfig-r024-20221026
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mips64el-linux-gnuabi64
>         # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=983bd8543b5ab8e9a2870ae258bccd4ce7a22c7c
>         git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
>         git fetch --no-tags tip perf/core
>         git checkout 983bd8543b5ab8e9a2870ae258bccd4ce7a22c7c
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash kernel/
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/events/core.c:181:48: error: redefinition of 'cpu_context' as different kind of symbol
>    static DEFINE_PER_CPU(struct perf_cpu_context, cpu_context);
>                                                   ^
>    arch/mips/include/asm/mmu_context.h:106:19: note: previous definition is here
>    static inline u64 cpu_context(unsigned int cpu, const struct mm_struct *mm)

*sigh*.. robot people.. this patch has sat in my queue.git for weeks now
:/

anyway, lemme go fix, this shouldn't be hard.
