Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D000738C2D0;
	Thu,  4 Jun 2026 10:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780569076; cv=none; b=ZEDZPwxknIaMycmopDs7rkxCkXromNOHLKhcBxErVBw9MTYtV5RQh/UFeJKfZPWfPk4ZNOQNmgT87geFmMv76fFv3bqD0vRZ1bak8E3o03lW4C0rDO+VfzWaU4HQffrb8T2k+S+rZxNtC9EDWoU9F6CjZZl9pJKNhW8nLtmzY5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780569076; c=relaxed/simple;
	bh=4Zsg27HLHHxhAkTDy+lW27lhyVLE2+tX2v5oBBbCbmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NUgACZeM2+vjI83KEURx8ZBSvF5Nik8XjhuCHfT7LmyJA4+iy9wsu8nHbWtgfDxg19VoiKlzDiadEwvh7PZfAL5vXOmeCHPPPDLikGDLv7eFYzhRYJ2y9fAfyMVq1Orn7KbcvwQCuqqJ1+1nRghAuroTpajYKaxQ/D2jRIRUax8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iGStBw/b; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iGStBw/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780569074; x=1812105074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Zsg27HLHHxhAkTDy+lW27lhyVLE2+tX2v5oBBbCbmE=;
  b=iGStBw/bmSetLTL9/YT5ncRynDo/JBvCtHf41oQ91cG3mO6NuQvQi1VE
   Prnv6qwHs4vw6/AgOFh9yqoGa3oxXznBy2uAB51QetR7tBaSaTwoGscPF
   GYi2EE//DTr05KVhSzGB96nz28zAKzN9wX1+632+vNrpa5UrC7wXPYPzN
   A36AP5/E9JXAV2FU3bKCezE1vObEYTraIAf3RKJ0L0TfiAChcw3b4Nluv
   Jp7XDBLzY692iviH/QFMn+Ek0jxT9uIfPyOqzsTEA1AAzMvjcHhp580WC
   oWA2JjXbu1KfWiCgVE5hnt+RKKsz7dN+e1C7KFy7JLuMfyE/D5sQ9Eaho
   w==;
X-CSE-ConnectionGUID: Kg7sbrnDTmSnO77gRC4g7Q==
X-CSE-MsgGUID: 7M1XQN3eRV2SNR3Fym/0yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="91969624"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="91969624"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 03:31:13 -0700
X-CSE-ConnectionGUID: sldVB1xGQ3OiBGsQWxGQgg==
X-CSE-MsgGUID: OmjRoIn7QOuN2+Dq1DUl2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="249429977"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Jun 2026 03:31:10 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wV5Lv-00000000Ebo-1sDz;
	Thu, 04 Jun 2026 10:31:07 +0000
Date: Thu, 04 Jun 2026 18:30:59 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 David Woodhouse <dwmw@amazon.co.uk>,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>,
 Jacob Keller <jacob.e.keller@intel.com>
Subject: [tip:timers/ptp 5/25] arch/arm64/kvm/hyp_trace.c:121:24:
 error: incompatible pointer to integer conversion passing 'struct
 system_time_snapshot *' to parameter of type 'clockid_t' (aka 'int')
Message-ID: <202606041827.OZlaB99X-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/ptp
head:   571287cd351fcda7df3050009786f110cfd30bd9
commit: d09439210441efbadd8b0aa32c1ddb1eab2f3abd [5/25] KVM: arm64: Use ktime_get_snapshot_id() to retrieve CLOCK_BOOTTIME
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260604/202606041827.OZlaB99X-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606041827.OZlaB99X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606041827.OZlaB99X-lkp@intel.com/

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
