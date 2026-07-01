Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD2E34AB00;
	Wed,  1 Jul 2026 22:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782944410; cv=none; b=c2IgrKIw/NGdBSfmYyVE+CN7ge5++Mptfe0pfQPQ1mkonyleKemQaivHIpox5wot5gIDMjKJFNKer+EGxTAqqrcqAbGFgEARdt5aCfpcnmwJbR51oNlpVvlfFveYHYUp851WLemjnWytpH2leAluMzJmcqKraGHxmX0iEHiuTcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782944410; c=relaxed/simple;
	bh=nFTnH9yZ3jv37i2WVKcsEgiTVniDDkbAcYksl6iWM44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=upcywTAhrBn55V1tg5Y2xi/lbuDChBWTJufJjkH0baA1KO+bi6Z8hkam4qdm0+Fw8ZPFlFA5iu8alo59TWaCux0cpbCB8DLCqg7B6DXkMJxsIZB5PkW8/xz9jI82zCC4drbvRSJgzte5wP/ccxuh15hAShGepBXXVt6zNoEfZhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NbglvKM4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbglvKM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782944409; x=1814480409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nFTnH9yZ3jv37i2WVKcsEgiTVniDDkbAcYksl6iWM44=;
  b=NbglvKM4bPw7C5HJtBhecZUxoEmmZ6mrKJU98I9+VYm9xXhGFCcTfBye
   dW3xdjq1d4rEPOhoEdvG2EcICYoh5Sj9IBhuof9V4kV31gBHcGHx84gp3
   MKYuYRNgJMdBX6VGBJsbjV0WaTpuKULL+zDU9TUKAGoS97hNnMeoV2a6g
   kQuf/t+ICLUJz1rARUR/W0Z+VfXQdPreMlWUbagM4klNGnPiKV/3sitn4
   8FT3+ssjQ6k1/Jog6T/yUyB15/C3Klv323xng8O5t4eCagHy+jnNTazW5
   +6hpbRFEQzDqwWnIgoLAgXTe2XADPFuqqJG/yPFSXF1o2s7C6VoycaBpA
   A==;
X-CSE-ConnectionGUID: jaycg0j8Sd2TM4dJHsSoAg==
X-CSE-MsgGUID: kBR0bc1cS6KYJKwvTENnoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83884713"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="83884713"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 15:20:08 -0700
X-CSE-ConnectionGUID: 2YaEsRWzQ+aJawT+e02e5w==
X-CSE-MsgGUID: XFxKGMxRSKSNftB/3KLl8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="248711254"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jul 2026 15:20:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf3Ho-000000009g5-3Ja7;
	Wed, 01 Jul 2026 22:20:04 +0000
Date: Thu, 02 Jul 2026 06:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 21/60]
 kernel/time/hrtimer.c:2092:55: warning: variable 'timer' is uninitialized
 when used here
Message-ID: <202607020630.c13YhNOy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   80d7be4639ebb1f847fd06f3b8ad6b60389a6399
commit: ab89377d780b43204be2991594e25d64d4de0c88 [21/60] validation
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260702/202607020630.c13YhNOy-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020630.c13YhNOy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020630.c13YhNOy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/hrtimer.c:2092:55: warning: variable 'timer' is uninitialized when used here [-Wuninitialized]
    2092 |                 if (trace_hrtimer_run_queues_deviation_enabled() && timer) {
         |                                                                     ^~~~~
   kernel/time/hrtimer.c:2090:24: note: initialize the variable 'timer' to silence this warning
    2090 |                 struct hrtimer *timer;
         |                                      ^
         |                                       = NULL
   1 warning generated.


vim +/timer +2092 kernel/time/hrtimer.c

  2081	
  2082	static void __hrtimer_run_queues(struct hrtimer_cpu_base *cpu_base, ktime_t now,
  2083					 unsigned long flags, unsigned int active_mask)
  2084	{
  2085		unsigned int active = cpu_base->active_bases & active_mask;
  2086		struct hrtimer_clock_base *base;
  2087	
  2088		for_each_active_base(base, cpu_base, active) {
  2089			ktime_t basenow = ktime_add(now, base->offset);
  2090			struct hrtimer *timer;
  2091	
> 2092			if (trace_hrtimer_run_queues_deviation_enabled() && timer) {
  2093				timer = clock_base_next_timer(base);
  2094	
  2095				if (timer) {
  2096					ktime_t real_basenow = hrtimer_cb_get_time(timer);
  2097	
  2098					/* Should never be negative */
  2099					trace_hrtimer_run_queues_deviation(cpu_base, base->clockid,
  2100									   ktime_sub(real_basenow, basenow));
  2101				}
  2102			}
  2103	
  2104			while ((timer = clock_base_next_timer(base))) {
  2105				/*
  2106				 * The immediate goal for using the softexpires is
  2107				 * minimizing wakeups, not running timers at the
  2108				 * earliest interrupt after their soft expiration.
  2109				 * This allows us to avoid using a Priority Search
  2110				 * Tree, which can answer a stabbing query for
  2111				 * overlapping intervals and instead use the simple
  2112				 * BST we already have.
  2113				 * We don't add extra wakeups by delaying timers that
  2114				 * are right-of a not yet expired timer, because that
  2115				 * timer will have to trigger a wakeup anyway.
  2116				 */
  2117				if (basenow < hrtimer_get_softexpires(timer))
  2118					break;
  2119	
  2120				__run_hrtimer(cpu_base, base, timer, basenow, flags);
  2121				if (active_mask == HRTIMER_ACTIVE_SOFT)
  2122					hrtimer_sync_wait_running(cpu_base, flags);
  2123			}
  2124		}
  2125	}
  2126	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
