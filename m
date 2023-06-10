Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C159679C6;
	Sat, 10 Jun 2023 08:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wUlEklFYuWhHyvAtlnR016iuXj9mQqWZrP76no8Tm3s=; b=h7EKdnQsriV0Mf1oObds381scV
	GGpkxQRdrvz1lD7gTutg7H96Hw5w3ikwN95709PFRHBcN35CWCd4x9ZpXZJ4w+k/Rn2xlwVhwItZS
	UnLmRJH96wglxkeAS/x2g57qwCAe4JIaYz87CaxE3q98ECjBp7DuPrPf++54EHWGF69/JEG7pepVf
	RMbU455MuSMIlnqnXsG+C59Q4C5HMn1nmr+6Uxo31vimcWfcE6NIbp6PKugmPSjJ7+ntIrM6oT0Qk
	hcRYn4JxKDeiF/kWv+D4PZ16F3K8pHE3sNtohYe16vYl/Ty/tsMH6DRvIKYydOP9/9qsYI8kX5Jz1
	u0mNGoTQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q7tWV-007sDu-1J;
	Sat, 10 Jun 2023 08:00:35 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 72D3C3002CE;
	Sat, 10 Jun 2023 10:00:33 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3BD82245F9D8A; Sat, 10 Jun 2023 10:00:33 +0200 (CEST)
Date: Sat, 10 Jun 2023 10:00:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [peterz-queue:core/guards 57/58] kernel/events/core.c:7980:2:
 error: expected expression
Message-ID: <20230610080033.GA1370249@hirez.programming.kicks-ass.net>
References: <202306100841.VgslriZP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306100841.VgslriZP-lkp@intel.com>

On Sat, Jun 10, 2023 at 08:55:40AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards
> head:   dd132e83d180b932488bcf612576529e6163a1ea
> commit: a814a98b2c087f7cdb2b6c08d227b25eacecb08c [57/58] perf: Simplify perf_pmu_output_stop()
> config: arm64-buildonly-randconfig-r004-20230610 (https://download.01.org/0day-ci/archive/20230610/202306100841.VgslriZP-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce (this is a W=1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=a814a98b2c087f7cdb2b6c08d227b25eacecb08c
>         git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
>         git fetch --no-tags peterz-queue core/guards
>         git checkout a814a98b2c087f7cdb2b6c08d227b25eacecb08c
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/events/
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306100841.VgslriZP-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> kernel/events/core.c:7980:2: error: expected expression
>     7980 |         guard(rcu)();
>          |         ^
>    include/linux/cleanup.h:105:2: note: expanded from macro 'guard'
>      105 |         CLASS(name, __UNIQUE_ID(guard))
>          |         ^
>    include/linux/cleanup.h:82:2: note: expanded from macro 'CLASS'
>       82 |         class_##name##_t var __cleanup(class_##name##_destructor) =     \
>          |         ^
>    <scratch space>:36:1: note: expanded from here
>       36 | class_rcu_t
>          | ^
>    kernel/events/core.c:11321:6: warning: no previous prototype for function '__perf_pmu_unregister' [-Wmissing-prototypes]
>     11321 | void __perf_pmu_unregister(struct pmu *pmu)
>           |      ^
>    kernel/events/core.c:11321:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>     11321 | void __perf_pmu_unregister(struct pmu *pmu)
>           | ^
>           | static 
>    1 warning and 1 error generated.
> 
> 
> vim +7980 kernel/events/core.c
> 
>   7973	
>   7974	static void perf_pmu_output_stop(struct perf_event *event)
>   7975	{
>   7976		struct perf_event *iter;
>   7977		int err, cpu;
>   7978	
>   7979	restart:
			;
> > 7980		guard(rcu)();

Makes it work... For some raisin it doesn't like having a label point to
a decl for some builds -- I can't seem to reproduce this on x86, but I
can make aargh64-linux-gcc give me the same complaint.

Can a compiler person eludicate this matter?
