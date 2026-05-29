Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB593DD50D;
	Fri, 29 May 2026 21:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780089295; cv=none; b=Nn6eTZ+Er322H7zceHDtdWkpOtQCInkQXfGWDwkpGgx1TtWpIdJUOjRU1ys7+xv2DuALoTzTwshcqOE5jUbUOyek2pGGFgM2MmXw3xJ5Rm15+9vRvrvJUj5tdxKLJwm4w1RD3vPS+KDvOAlnSSrDsWscdOQx7xwjQmtj4+Xefq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780089295; c=relaxed/simple;
	bh=tGZnTlSExOD3mXMQagHtGYZoWvA2J3/O3M14ofCbai0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Mf98bPywe+GpJfKsCnDnZpr8aC8PLQi6DaYEUK9073f6ZFA2Ht//kzC7Ai+/tbkjB+GtroCnWpftV7e74F0fD/VzSKgZQVjCLXoaEa5MG8qSS912Qrc8y1HAvL00eVKP/BRKzsuQDHozkNnsLxxPyF2ytdUMLF5eWaBbtfuk+CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWLUrG63; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWLUrG63"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780089295; x=1811625295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tGZnTlSExOD3mXMQagHtGYZoWvA2J3/O3M14ofCbai0=;
  b=dWLUrG63MxClNJYkTtzAUT8ZfPxBAN7J5ueAD5lzdq0bwC7PEDYu9cZW
   sEkaiVIHvlE13etOurvngdp0y3o/uFYO0sRbI365cp4kRrYQfYYONPhxq
   yylI/Gnw7PMuZvEsI8WSY3TxsxVwNgNjqUb//bW+Irq5dIN21m7IeTEcX
   K+WPF9OhtoqZgd+BKYbKUmF/Kga6X8TEeoPnb5JNH1NKvYW0HbrqooJRQ
   WxzYAOiMGoM3B6dEF6D8UriqlPJerybQv/20+oF/qG0QNamTmQ3hH/Y2n
   vEmVs9Zbujr/6thcejbaKP2SZipcmlvT49e1FMsexnabP374YDqtVHQ4w
   w==;
X-CSE-ConnectionGUID: ti1qFwzATDiQyDQmHFYDLg==
X-CSE-MsgGUID: +Cqxe8rKR5mqKIc7WAMaSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="79981078"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="79981078"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 14:14:54 -0700
X-CSE-ConnectionGUID: z5qi1B+8Qje3aJ6GATnmSg==
X-CSE-MsgGUID: tCeVSqMwSeSunKx1t1KlAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="247887545"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 May 2026 14:14:51 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT4XY-000000007i2-3pbc;
	Fri, 29 May 2026 21:14:48 +0000
Date: Sat, 30 May 2026 05:14:45 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Woodhouse <dwmw@amazon.co.uk>,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>,
 Jacob Keller <jacob.e.keller@intel.com>
Subject: [tglx-devel:timers/ptp/timekeeping 5/25]
 arch/arm64/kvm/hyp_trace.c:121:24: error: incompatible pointer to integer
 conversion passing 'struct system_time_snapshot *' to parameter of type
 'clockid_t' (aka 'int')
Message-ID: <202605300546.8ECpP0yn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/ptp/timekeeping
head:   cce2d296ed625dd88668132db78630d56cf395b8
commit: 3eefddc1140e90aca653f4234915cf65959d2fdc [5/25] KVM: arm64: Use ktime_get_snapshot_id() to retrieve CLOCK_BOOTTIME
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260530/202605300546.8ECpP0yn-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300546.8ECpP0yn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300546.8ECpP0yn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/hyp_trace.c:121:24: error: incompatible pointer to integer conversion passing 'struct system_time_snapshot *' to parameter of type 'clockid_t' (aka 'int') [-Wint-conversion]
     121 |         ktime_get_snapshot_id(&snap, CLOCK_BOOTTIME);
         |                               ^~~~~
   include/linux/timekeeping.h:355:45: note: passing argument to parameter 'clock_id' here
     355 | extern void ktime_get_snapshot_id(clockid_t clock_id, struct system_time_snapshot *systime_snapshot);
         |                                             ^
>> arch/arm64/kvm/hyp_trace.c:121:31: error: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct system_time_snapshot *' [-Wint-conversion]
     121 |         ktime_get_snapshot_id(&snap, CLOCK_BOOTTIME);
         |                                      ^~~~~~~~~~~~~~
   include/uapi/linux/time.h:56:26: note: expanded from macro 'CLOCK_BOOTTIME'
      56 | #define CLOCK_BOOTTIME                  7
         |                                         ^
   include/linux/timekeeping.h:355:84: note: passing argument to parameter 'systime_snapshot' here
     355 | extern void ktime_get_snapshot_id(clockid_t clock_id, struct system_time_snapshot *systime_snapshot);
         |                                                                                    ^
   2 errors generated.


vim +121 arch/arm64/kvm/hyp_trace.c

   108	
   109	static void hyp_trace_clock_enable(struct hyp_trace_clock *hyp_clock, bool enable)
   110	{
   111		struct system_time_snapshot snap;
   112	
   113		if (hyp_clock->running == enable)
   114			return;
   115	
   116		if (!enable) {
   117			cancel_delayed_work_sync(&hyp_clock->work);
   118			hyp_clock->running = false;
   119		}
   120	
 > 121		ktime_get_snapshot_id(&snap, CLOCK_BOOTTIME);
   122	
   123		hyp_clock->boot = ktime_to_ns(snap.systime);
   124		hyp_clock->cycles = snap.cycles;
   125		hyp_clock->mult = 0;
   126	
   127		init_completion(&hyp_clock->ready);
   128		INIT_DELAYED_WORK(&hyp_clock->work, __hyp_clock_work);
   129		schedule_delayed_work(&hyp_clock->work, msecs_to_jiffies(CLOCK_INIT_MS));
   130		wait_for_completion(&hyp_clock->ready);
   131		hyp_clock->running = true;
   132	}
   133	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
