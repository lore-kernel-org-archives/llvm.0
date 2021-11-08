Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B862C85
	for <llvm@lists.linux.dev>; Mon,  8 Nov 2021 12:08:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B2442B;
	Mon,  8 Nov 2021 04:00:27 -0800 (PST)
Received: from e113632-lin (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 596BD3F7F5;
	Mon,  8 Nov 2021 04:00:26 -0800 (PST)
From: Valentin Schneider <valentin.schneider@arm.com>
To: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH] sched: Tweak default dynamic preempt mode selection
In-Reply-To: <202111061341.QdauxAuH-lkp@intel.com>
References: <20211105104035.3112162-1-valentin.schneider@arm.com> <202111061341.QdauxAuH-lkp@intel.com>
Date: Mon, 08 Nov 2021 12:00:17 +0000
Message-ID: <878rxyeu26.mognet@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On 06/11/21 13:05, kernel test robot wrote:
>    kernel/sched/core.c:3439:6: error: no previous prototype for function 'sched_set_stop_task' [-Werror,-Wmissing-prototypes]
>    void sched_set_stop_task(int cpu, struct task_struct *stop)
>         ^
>    kernel/sched/core.c:3439:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    void sched_set_stop_task(int cpu, struct task_struct *stop)
>    ^
>    static
>>> kernel/sched/core.c:6576:2: error: use of undeclared identifier '__SCT__preempt_schedule'
>            static_call_update(preempt_schedule, __preempt_schedule_func);
>            ^

Doh, I broke the

  PREEMPT_DYNAMIC
    select PREEMPT

thing - the above happens with PREEMPT_DYNAMIC && !PREEMPT. Lemme fix.
