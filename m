Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FEF2931F7;
	Sun, 18 Oct 2026 01:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792287162; cv=none; b=a8MPD2SaJaE0M1ugCTk5ASbWIvi5zZmO5CteL3cBdlEAnQv0LV8kPEHb8r4yQgoXrCWzV92/qhhEuaQC4zA2H8Yx3UA+qlCyW4HGrXMCVSsPCSCmA2/pMOvylEZvM+lpbopfqM12G0JP10V6sZrAMtwB5o1BwgKIVj0H530Nlr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792287162; c=relaxed/simple;
	bh=n8EEY+mvGytS/9DOG3kh2xrwZpSAxVZ6DsODBJlTAAA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ppLTD26KEtaUZXnqbczoqWn92TFA7+DL2j41rMv6dB+/NHjlVAKme38mcdkBKJon/28/zERxHLAmw//Sfyfn5mT1zc/IC7z7j178jrP67XiiA3PASUTbnTipsYv0xVgxvQXRBWDtCyL10s3GFCiusn7ETYmRrcobAm9G+VK+us4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ppti0lpJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ppti0lpJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792287160; x=1823823160;
  h=date:from:to:cc:subject:message-id;
  bh=n8EEY+mvGytS/9DOG3kh2xrwZpSAxVZ6DsODBJlTAAA=;
  b=Ppti0lpJJVBSWW7IjccR/gG4Q7Fck7eHL2ZnjX5eaHKNtAO9jZ7eUJc3
   p0W9En6bVNb5mJLspFe6n1JuKv3F1TBJGcfcHFUuy4ZVoK6eSxqKs2rrp
   CNR0UtODrFh1RLzALlB25sfXx5I9xZ/jz/TCux7bPuBIA5LbXwJSXT8Bt
   e6eMV4CyvUQ5bfyTK6UEc+BKmi3EQX2J9pfMDBvwK7oka+KGZ+pvX4Nuc
   Vl5u0eOFquMsniLy7YpDcaebceLFtOpzhA49pjCNNBczaahvmYJbidGiP
   Wn32JlqP8H+hcWep3bX0/CHqDWkgeCKDHp+hByPIkBN452s3i+wOkujI1
   g==;
X-CSE-ConnectionGUID: ryxBv+tjQf+KdMHwMarxAw==
X-CSE-MsgGUID: 8jgkSUNRTdyUStWh50xHEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="1036305"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="1036305"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 18:32:39 -0700
X-CSE-ConnectionGUID: +qD0d3UKQReYilIaS6zG4w==
X-CSE-MsgGUID: tDVjDqlEQhCjKhQ7zAwPLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2239296"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Oct 2026 18:32:38 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIFlK-00000000Jxi-4Blf;
	Sun, 18 Oct 2026 01:32:34 +0000
Date: Sun, 18 Oct 2026 09:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:hardpps-filter-soak 32/33]
 drivers/ptp/ptp_gnss_extint.c:349:27: warning: variable 'raw_pre' set but not
 used
Message-ID: <202610180911.5VdX6eyB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux hardpps-filter-soak
head:   d2ddff11f0edd8219413b800af3cee8f28aa858d
commit: 2b23d81ff6919d919634c599e3f9bb18ddc6affb [32/33] [PROTOTYPE] ptp: ptp_gnss_extint: Synthesize a latency-free PPS source
config: arm-randconfig-1001-20261018 (https://download.01.org/0day-ci/archive/20261018/202610180911.5VdX6eyB-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610180911.5VdX6eyB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610180911.5VdX6eyB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ptp/ptp_gnss_extint.c:349:27: warning: variable 'raw_pre' set but not used [-Wunused-but-set-variable]
     349 |         u64 real_pre, real_post, raw_pre, raw_post;
         |                                  ^
>> drivers/ptp/ptp_gnss_extint.c:349:36: warning: variable 'raw_post' set but not used [-Wunused-but-set-variable]
     349 |         u64 real_pre, real_post, raw_pre, raw_post;
         |                                           ^
   2 warnings generated.


vim +/raw_pre +349 drivers/ptp/ptp_gnss_extint.c

   345	
   346	static void gnss_extint_pps_work(struct work_struct *work)
   347	{
   348		struct gnss_extint *ge = container_of(work, struct gnss_extint, pps_work);
 > 349		u64 real_pre, real_post, raw_pre, raw_post;
   350		s64 tgps, delta = 0;
   351		unsigned long flags;
   352		bool ok = false;
   353	
   354		mutex_lock(&ge->xts_lock);
   355		reinit_completion(&ge->tm2_done);
   356	
   357		local_irq_save(flags);
   358		gpiod_set_value(ge->extint, 0);		/* warm the set path */
   359		raw_pre = ktime_get_raw_ns();
   360		real_pre = ktime_get_real_ns();
   361		gpiod_set_value(ge->extint, 1);
   362		real_post = ktime_get_real_ns();
   363		raw_post = ktime_get_raw_ns();
   364		local_irq_restore(flags);
   365	
   366		if (wait_for_completion_interruptible_timeout(&ge->tm2_done,
   367						msecs_to_jiffies(1500)) > 0) {
   368			tgps = ktime_to_ns(ge->tm2_utc);
   369			delta = NSEC_PER_SEC * div64_s64(tgps + NSEC_PER_SEC / 2,
   370							 NSEC_PER_SEC) - tgps;
   371			ok = true;
   372		}
   373		gpiod_set_value(ge->extint, 0);
   374	
   375		if (ok) {
   376			struct ptp_clock_event evt = {
   377				.type = PTP_CLOCK_PPSUSR,
   378			};
   379	
   380			evt.pps_times.ts_real = ns_to_timespec64(
   381				(real_pre + real_post) / 2 + delta);
   382	#ifdef CONFIG_NTP_PPS
   383			evt.pps_times.ts_raw = ns_to_timespec64(
   384				(raw_pre + raw_post) / 2 + delta);
   385	#endif
   386			ptp_clock_event(ge->ptp, &evt);
   387		}
   388	
   389		/* steer the next edge onto the GPS second boundary */
   390		ge->pps_next = ktime_add_ns(ge->pps_next, NSEC_PER_SEC + delta);
   391		hrtimer_start(&ge->pps_timer, ge->pps_next, HRTIMER_MODE_ABS);
   392		mutex_unlock(&ge->xts_lock);
   393	}
   394	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
