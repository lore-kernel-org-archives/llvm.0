Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8338836;
	Sat, 10 Jun 2023 08:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gWKqc15+EXQAtpyqltNf7kL8HfK2rfuZrC722LYUk6k=; b=MXxUg3LkTPXrUiF2SyIoRW14lG
	+OkA13KqE53DCJcWzOiMXLjMaROnNjlfGgWhF92sdXKCGA1vDbzlFBgpj+5teHBEzkeAPG+aPVxzq
	IQQmelRUsLH8DLmsEpFg6Lr7rwEHxaQ1HUDa2c0gbfe4mX86Qe3K+9DbSnG+QuSc0ltCu+mfuiESP
	tKtI3jJm670DNi8NklWw+/cLUaGUPH7vEz5d+7WzU9j91hc0AYD/3x7O3z1FYV1okZjAgKr0Cc3x5
	s3tdNrwBE0m+UUBTI242pJy1Q3rgFr/YtGMMlzQSvayBZwM99fSsB2DCyr8f4H8Msb4hBwgU0rKyF
	Yv6ECCwQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q7tpO-007sOR-0q;
	Sat, 10 Jun 2023 08:20:07 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A9C423001AE;
	Sat, 10 Jun 2023 10:20:05 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8851D243C7B63; Sat, 10 Jun 2023 10:20:05 +0200 (CEST)
Date: Sat, 10 Jun 2023 10:20:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [peterz-queue:core/guards 37/58] kernel/events/core.c:4815:4:
 error: cannot jump from this asm goto statement to one of its possible
 targets
Message-ID: <20230610082005.GB1370249@hirez.programming.kicks-ass.net>
References: <202306101109.PqwXuQIY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306101109.PqwXuQIY-lkp@intel.com>

On Sat, Jun 10, 2023 at 11:13:14AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards
> head:   dd132e83d180b932488bcf612576529e6163a1ea
> commit: bbca204d731b08997a60a4ca0530fdee8b6f429c [37/58] perf: Simplify find_get_pmu_context()
> config: powerpc-gamecube_defconfig (https://download.01.org/0day-ci/archive/20230610/202306101109.PqwXuQIY-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce (this is a W=1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc cross compiling tool for clang build
>         # apt-get install binutils-powerpc-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=bbca204d731b08997a60a4ca0530fdee8b6f429c
>         git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
>         git fetch --no-tags peterz-queue core/guards
>         git checkout bbca204d731b08997a60a4ca0530fdee8b6f429c
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306101109.PqwXuQIY-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 

> >> kernel/events/core.c:4815:4: error: cannot jump from this asm goto statement to one of its possible targets
>     4815 |                         WARN_ON_ONCE(epc->ctx != ctx);
>          |                         ^
>    include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON_ONCE'
>      112 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
>          |                 ^
>    arch/powerpc/include/asm/bug.h:101:2: note: expanded from macro '__WARN_FLAGS'
>      101 |         WARN_ENTRY("twi 31, 0, 0", BUGFLAG_WARNING | (flags), __label_warn_on); \
>          |         ^
>    arch/powerpc/include/asm/bug.h:77:2: note: expanded from macro 'WARN_ENTRY'
>       77 |         asm_volatile_goto(                              \
>          |         ^
>    include/linux/compiler_types.h:328:33: note: expanded from macro 'asm_volatile_goto'
>      328 | #define asm_volatile_goto(x...) asm goto(x)
>          |                                 ^
>    kernel/events/core.c:4784:4: note: possible target of asm goto statement
>     4784 |                         WARN_ON_ONCE(epc->ctx != ctx);
>          |                         ^
>    include/asm-generic/bug.h:112:3: note: expanded from macro 'WARN_ON_ONCE'
>      112 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
>          |                 ^
>    arch/powerpc/include/asm/bug.h:104:9: note: expanded from macro '__WARN_FLAGS'
>      104 |                                                                 \
>          |                                                                 ^
>    kernel/events/core.c:4791:8: note: jump exits scope of variable with __attribute__((cleanup))
>     4791 |         void *new __free(kfree) = kzalloc(sizeof(*epc), GFP_KERNEL);
>          |               ^
>    kernel/events/core.c:4784:4: error: cannot jump from this asm goto statement to one of its possible targets
>     4784 |                         WARN_ON_ONCE(epc->ctx != ctx);
>          |                         ^

So I can't reproduce this using GCC for ARCH=powerpc gamecube_defconfig,
and I can't figure out WTF the compiler is trying to do. The code in
question reads:

  static struct perf_event_pmu_context *
  find_get_pmu_context(struct pmu *pmu, struct perf_event_context *ctx,
		       struct perf_event *event)
  {
	  struct perf_event_pmu_context *epc;
	  void *task_ctx_data = NULL;

	  if (!ctx->task) {
		  /*
		   * perf_pmu_migrate_context() / __perf_pmu_install_event()
		   * relies on the fact that find_get_pmu_context() cannot fail
		   * for CPU contexts.
		   */
		  struct perf_cpu_pmu_context *cpc;

		  cpc = per_cpu_ptr(pmu->cpu_pmu_context, event->cpu);
		  epc = &cpc->epc;
		  raw_spin_lock_irq(&ctx->lock);
		  if (!epc->ctx) {
			  atomic_set(&epc->refcount, 1);
			  epc->embedded = 1;
			  list_add(&epc->pmu_ctx_entry, &ctx->pmu_ctx_list);
			  epc->ctx = ctx;
		  } else {
			  WARN_ON_ONCE(epc->ctx != ctx);

And for some mysterious raisin this ^^ WARN wants to continue..

			  atomic_inc(&epc->refcount);
		  }
		  raw_spin_unlock_irq(&ctx->lock);
		  return epc;
	  }

	  void *new __free(kfree) = kzalloc(sizeof(*epc), GFP_KERNEL);
	  if (!new)
		  return NULL;

.. here or so? even though it has a return statement before this decl.


	  if (event->attach_state & PERF_ATTACH_TASK_DATA) {
		  task_ctx_data = alloc_task_ctx_data(pmu);
		  if (!task_ctx_data)
			  return NULL;
	  }

	  __perf_init_event_pmu_context(new, pmu);


Help?
