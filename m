Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BBC37FF44;
	Tue, 12 May 2026 18:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610039; cv=none; b=NTrOp+2Cv1KJlJSj2VmHeBdFCqy42Is1hy1kqpD3eKpMKrflhgmGfUh90/zlG7SzoLs2UYzO+Uy7PIZjZO7lBRMnDKVGHD08tmsXDxEVYWQPDGQnwYlJv7FeZxBXAEweqKu7Zd79KiYxTiqbAwVfx6DZh5rDxKpHZb+AWh4DDLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610039; c=relaxed/simple;
	bh=ZiDplz0jJKgi0DXPK64nrWVWN3hNSITxV4LYB3hd4Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f484EvxoyFVWGH0KdiC6jJIa3G8dl/miAwunh8xPyp9oh4rP7ubZF3jXXuntzuLx7vOsQiqnT/pXLE3Zi5w2ZNLs7yBVOcKLRXdinnyFSziSLfAL77gv3B0+/hH8SudNNYYaaNyt7Bae17DIkLzfJpSZpWkIeVx1XjuSNNsGpZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNJ/+mFx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNJ/+mFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778610036; x=1810146036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZiDplz0jJKgi0DXPK64nrWVWN3hNSITxV4LYB3hd4Ac=;
  b=BNJ/+mFxqtCQQD1qmN+0Q1gXcNXrn5yv8yyKmVPm52GaUFZT2O9VRX22
   kB1JVajWtCzHnKurMXLSjMn6orlDZynTwjErCxh2bBmfRhbVWeyWWRQAo
   sxwJDF0FIoXQqQeztqU/7UbNNJBzU4lKz6vwlBwfKcRGT7oaN4oZ6ElwJ
   hAtBb3HBjXePZXlwBoq70bozLYMI23fdr2ht2ZP1VnecTFzLgPlczfJyy
   Ya5E8A/IaliyxtENr/eEeZwLdLQZ8cflXR2jceE675Qu/Ybv2Jh1xqhUB
   ZjWFQ0eoB4RxJjE1UR65iRZOh26UvxdC3l8L9mEUm31ZX39j6ug2KkPI7
   g==;
X-CSE-ConnectionGUID: 7tcEjv62RTGR+5uKkY8d+Q==
X-CSE-MsgGUID: dl5bhfZgSsijihGcar7dpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="97100237"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="97100237"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 11:20:35 -0700
X-CSE-ConnectionGUID: svoH8TkYRQG8wPaqx8GhAg==
X-CSE-MsgGUID: hZvsv3BYQAO1ENK6j49SPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="242192184"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 12 May 2026 11:20:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMriU-000000008JV-2MYb;
	Tue, 12 May 2026 18:20:26 +0000
Date: Tue, 12 May 2026 20:19:35 +0200
From: kernel test robot <lkp@intel.com>
To: John Stultz <jstultz@google.com>, LKML <linux-kernel@vger.kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	John Stultz <jstultz@google.com>,
	Vineeth Pillai <vineethrp@google.com>,
	Sonam Sanju <sonam.sanju@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Kunwu Chan <kunwu.chan@linux.dev>, Tejun Heo <tj@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Qais Yousef <qyousef@layalina.io>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Metin Kaya <Metin.Kaya@arm.com>,
	Xuewen Yan <xuewen.yan94@gmail.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Suleiman Souhlal <suleiman@google.com>,
	kuyo chang <kuyo.chang@mediatek.com>, hupu <hupu.gm@gmail.com>,
	kernel-team@android.com
Subject: Re: [PATCH v2 2/2] locking: mutex: Fix proxy-exec potentially
 deactivating tasks marked TASK_RUNNING
Message-ID: <202605122052.5KWIaVj6-lkp@intel.com>
References: <20260430215103.2978955-3-jstultz@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430215103.2978955-3-jstultz@google.com>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/locking/core tip/master next-20260508]
[cannot apply to tip/auto-latest linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Stultz/sched-proxy-exec-Close-race-causing-workqueue-work-being-delayed/20260504-045026
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20260430215103.2978955-3-jstultz%40google.com
patch subject: [PATCH v2 2/2] locking: mutex: Fix proxy-exec potentially deactivating tasks marked TASK_RUNNING
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260512/202605122052.5KWIaVj6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605122052.5KWIaVj6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605122052.5KWIaVj6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/test_bitops.c:10:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:11:
   In file included from arch/x86/include/asm/msr.h:16:
   In file included from include/linux/percpu.h:12:
>> include/linux/sched.h:2209:10: error: expression which evaluates to zero treated as a null pointer constant of type 'struct mutex *' [-Werror,-Wnon-literal-null-conversion]
    2209 |                 return false;
         |                        ^~~~~
   1 error generated.


vim +2209 include/linux/sched.h

  2205	
  2206	static inline struct mutex *task_is_blocked_on(struct task_struct *p)
  2207	{
  2208		if (!sched_proxy_exec())
> 2209			return false;
  2210		return (struct mutex *)((unsigned long)p->blocked_on & PROXY_BLOCKED_LATCH);
  2211	}
  2212	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
