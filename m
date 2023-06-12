Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815B48828
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HSJpGOrjCtJnZnFroylDCf7Rjcbog3OzeJBiNYZJX7o=; b=Qq3MKPI5zRqgK1FJ0hVcozO4BO
	meHwIp9pt6YLsbqbob9R6P1YB6uxMNTinsjTb1JoJ+o+HPtl21ExDslFFrlwq31X6cVWOlE8laTwN
	+JNpn/8gkd9aJUAbDc683nYjkQrtbJRcuCuMgL+GtHaKmf1YIrUTV/j/Do6S4l1NNrLDkJTf7UtPQ
	oY+1+96sn1wZvF74P78rSfWvZGpwQoqYeD8VJvsXDm9VYIBwKD0sVKHZXupzEZHTk6dFgGkhDrK25
	kanqBMn53e5TXEVSq4d1iSGbY1i0xH8fksV1SNe3aKxD6nnmlidqTOatSGNjjwr8+oUq3Rj8OFIbZ
	TGJLTDMQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eDQ-008kz1-0m;
	Mon, 12 Jun 2023 09:52:00 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4DCE2300322;
	Mon, 12 Jun 2023 11:51:59 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2F59F2C17E189; Mon, 12 Jun 2023 11:51:59 +0200 (CEST)
Date: Mon, 12 Jun 2023 11:51:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: torvalds@linux-foundation.org, keescook@chromium.org,
	gregkh@linuxfoundation.org, pbonzini@redhat.com
Cc: masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
	nicolas@fjasle.eu, catalin.marinas@arm.com, will@kernel.org,
	vkoul@kernel.org, trix@redhat.com, ojeda@kernel.org,
	mingo@redhat.com, longman@redhat.com, boqun.feng@gmail.com,
	dennis@kernel.org, tj@kernel.org, cl@linux.com, acme@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, namhyung@kernel.org, irogers@google.com,
	adrian.hunter@intel.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, paulmck@kernel.org,
	frederic@kernel.org, quic_neeraju@quicinc.com,
	joel@joelfernandes.org, josh@joshtriplett.org,
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
	rientjes@google.com, vbabka@suse.cz, roman.gushchin@linux.dev,
	42.hyeyoo@gmail.com, apw@canonical.com, joe@perches.com,
	dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
	serge@hallyn.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	llvm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	rcu@vger.kernel.org, linux-security-module@vger.kernel.org,
	tglx@linutronix.de, ravi.bangoria@amd.com, error27@gmail.com,
	luc.vanoostenryck@gmail.com
Subject: Re: [PATCH v3 00/57] Scope-based Resource Management
Message-ID: <20230612095159.GH4253@hirez.programming.kicks-ass.net>
References: <20230612090713.652690195@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612090713.652690195@infradead.org>

On Mon, Jun 12, 2023 at 11:07:13AM +0200, Peter Zijlstra wrote:
> Hi,
> 
> After a wee bit of bike-shedding on the syntax/API of the thing I think we're
> in a reasonable shape.
> 
> There's still the no_free_ptr() vs take_ptr() thing, but that can be easily
> sorted with a little script over the patches if we reach consensus.
> 
> I've taken to converting kernel/sched/core.c and kernel/events/core.c to see
> how well this stuff actually works. Unlike last time, I've split them up into a
> gazillion little patches. Both for my sanity -- bisect is genius when you're
> trying to debug stuff in the middle of the night as well as reviewer sanity.
> 
> These are by no means 'complete' convertions, I've mostly focussed on functions
> that had 'goto' in them. Since that's a large part of why I started on all this.
> 
> x86_x64-defconfig boots and passes perf test. I'll go figure out how to point
> syzcaller at it.
> 
> The patches have gone through a few cycles of 0day over the weekend, and mostly
> builds fine now.
> 
> Dan Carpenter poked me about how sparse doesn't yet understand the __cleanup__
> attribute and seems to suffer from decl-after-stmt issues, so that might be
> something that needs attention.
> 
> Anyway, does this look like something we can live with?

Forgot to mention; also available at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards2

(core/guards also exists, but that is a previous version that I kept
because I wanted to discuss some 'interesting' clang build fails)

> 
> ---
>  Makefile                            |    6 +-
>  arch/arm64/kernel/vdso32/Makefile   |    2 -
>  drivers/dma/ioat/dma.c              |   12 +-
>  include/linux/cleanup.h             |  167 ++++
>  include/linux/compiler-clang.h      |    9 +
>  include/linux/compiler_attributes.h |    6 +
>  include/linux/cpu.h                 |    2 +
>  include/linux/device.h              |    7 +
>  include/linux/file.h                |   11 +
>  include/linux/irqflags.h            |    7 +
>  include/linux/mutex.h               |    4 +
>  include/linux/percpu.h              |    4 +
>  include/linux/perf_event.h          |   14 +-
>  include/linux/preempt.h             |    5 +
>  include/linux/rcupdate.h            |    3 +
>  include/linux/rwsem.h               |    8 +
>  include/linux/sched/task.h          |    2 +
>  include/linux/slab.h                |    3 +
>  include/linux/spinlock.h            |   31 +
>  include/linux/srcu.h                |    5 +
>  kernel/events/core.c                | 1642 +++++++++++++++--------------------
>  kernel/sched/core.c                 |  931 +++++++++-----------
>  kernel/sched/sched.h                |   40 +
>  scripts/checkpatch.pl               |    2 +-
>  security/apparmor/include/lib.h     |    6 +-
>  25 files changed, 1433 insertions(+), 1496 deletions(-)
> 
