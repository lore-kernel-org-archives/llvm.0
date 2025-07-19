Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74760148838;
	Sat, 19 Jul 2025 14:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752934107; cv=none; b=NJP/Bx4pylxQcrHkr46l2yJdA99pCTVE1tVdoG2oRhUbqrCMMCtMqfA9SHRUQed8iYKWpXJpExVxjaf6NvCA0cIBySw6cfjEiL1P4Ar0AdGALe3D0snsPsRdkWJ8Otk4+Ia3KcEm9VK7FHWbsjdr6F6TW0/xFOUUpcMA4aaLZxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752934107; c=relaxed/simple;
	bh=5YNjeuxQxKoT/S7iNTkE3j3OS2cbQDz/IxvUwTJa3Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bSfAni2IC4M/4Sqrs1oIk3YsILYv9Cm9c/xSgNmdKbgRiND9Y3QF0PLD2VCv6io2R4r96hpTxSIA9/TlfhZdIOjBFw/NQU4Q1t02SJ0A1S6nD0ev71ZF99Xe15qrEE/vfht24QfauiBYcdI1iPPtx6Me859V4iwYxNpoiBl1yiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXTJQo0d; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXTJQo0d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752934105; x=1784470105;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5YNjeuxQxKoT/S7iNTkE3j3OS2cbQDz/IxvUwTJa3Hk=;
  b=bXTJQo0dj4GHrYrlYFZmjKJ/xq+o3XswyXkUEQr4oywGrd2KDQ9i4YeM
   Kdwwm0mRKk/qi06FqpWvK3gCg01x3YmltK8trMPDCSJyGWlnwvace7DrT
   08+jmq58i7sWcY/q9z8fJds4+69kjTeP2WxqVW726blscmDBeGusfQuP+
   skETVytvRK4K4t8abzbK0e1GYgylF1WbKmdAFQ+LqSVVcauUJ22Lfgu36
   IQhvPqbo3NDohVePe4Kh+7fhJ4JXFb77NKy3m8MfBpp0Cs1AOdx+bU7u/
   4/7/Wuk2k+ejp0nYGL9YJ5XJLV79IItFTvBD46kGu34k2muARVpNyOPPl
   g==;
X-CSE-ConnectionGUID: 7D0zaZytRp+rFfmeRVJ7XQ==
X-CSE-MsgGUID: TYq+yzAXQ5qqDpL+OXYiHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="72663576"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="72663576"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 07:08:25 -0700
X-CSE-ConnectionGUID: DOtpmV4YRkSKhG62m1Fm/g==
X-CSE-MsgGUID: ylIAg1+nRMuIq6s4CMTVfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="163953394"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Jul 2025 07:08:23 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud8Ef-000FXN-20;
	Sat, 19 Jul 2025 14:08:21 +0000
Date: Sat, 19 Jul 2025 22:08:01 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.16-rc5 62/80]
 drivers/platform/arm64/mpam/mpam_resctrl.c:355:2: warning: unannotated
 fall-through between switch labels
Message-ID: <202507192146.RlGCE0mv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi James,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.16-rc5
head:   b8e4905233fe45814b3c73be7e091f172cfb86ce
commit: 85cb8b2e516cf17f31528573039c63f42242ba81 [62/80] arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250719/202507192146.RlGCE0mv-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507192146.RlGCE0mv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507192146.RlGCE0mv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/arm64/mpam/mpam_resctrl.c:355:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     355 |         default:
         |         ^
   drivers/platform/arm64/mpam/mpam_resctrl.c:355:2: note: insert '__attribute__((fallthrough));' to silence this warning
     355 |         default:
         |         ^
         |         __attribute__((fallthrough)); 
   drivers/platform/arm64/mpam/mpam_resctrl.c:355:2: note: insert 'break;' to avoid fall-through
     355 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +355 drivers/platform/arm64/mpam/mpam_resctrl.c

72793604c0b57a James Morse 2021-06-25  333  
72793604c0b57a James Morse 2021-06-25  334  static void resctrl_arch_mon_ctx_free_no_wait(enum resctrl_event_id evtid,
72793604c0b57a James Morse 2021-06-25  335  					      u32 mon_idx)
72793604c0b57a James Morse 2021-06-25  336  {
72793604c0b57a James Morse 2021-06-25  337  	struct mpam_resctrl_mon *mon = &mpam_resctrl_counters[evtid];
72793604c0b57a James Morse 2021-06-25  338  
72793604c0b57a James Morse 2021-06-25  339  	if (!mon->class)
72793604c0b57a James Morse 2021-06-25  340  		return;
72793604c0b57a James Morse 2021-06-25  341  
72793604c0b57a James Morse 2021-06-25  342  	switch (evtid) {
72793604c0b57a James Morse 2021-06-25  343  	case QOS_L3_OCCUP_EVENT_ID:
72793604c0b57a James Morse 2021-06-25  344  		mpam_free_csu_mon(mon->class, mon_idx);
72793604c0b57a James Morse 2021-06-25  345  		wake_up(&resctrl_mon_ctx_waiters);
72793604c0b57a James Morse 2021-06-25  346  		return;
72793604c0b57a James Morse 2021-06-25  347  	case QOS_L3_MBM_TOTAL_EVENT_ID:
72793604c0b57a James Morse 2021-06-25  348  	case QOS_L3_MBM_LOCAL_EVENT_ID:
72793604c0b57a James Morse 2021-06-25  349  		if (mpam_monitors_free_running()) {
72793604c0b57a James Morse 2021-06-25  350  			WARN_ON_ONCE(mon_idx != USE_RMID_IDX);
72793604c0b57a James Morse 2021-06-25  351  			return;
72793604c0b57a James Morse 2021-06-25  352  		}
72793604c0b57a James Morse 2021-06-25  353  		mpam_free_mbwu_mon(mon->class, mon_idx);
72793604c0b57a James Morse 2021-06-25  354  		wake_up(&resctrl_mon_ctx_waiters);
72793604c0b57a James Morse 2021-06-25 @355  	default:
72793604c0b57a James Morse 2021-06-25  356  	case QOS_NUM_EVENTS:
72793604c0b57a James Morse 2021-06-25  357  		return;
72793604c0b57a James Morse 2021-06-25  358  	}
72793604c0b57a James Morse 2021-06-25  359  }
72793604c0b57a James Morse 2021-06-25  360  

:::::: The code at line 355 was first introduced by commit
:::::: 72793604c0b57a141ee01f1caac2b5abe4c31f10 arm_mpam: resctrl: Allow resctrl to allocate monitors

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: James Morse <james.morse@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
