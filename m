Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE2B153BE4;
	Mon, 18 Nov 2024 23:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731971499; cv=none; b=mFk0gFIts3YLsDrP/fL9Xq7iZdeUK2FQUwL9OB8e8ITsidk2dllS8QRDv9ahu5irSTHwUzBoxFCXvNvY4a3AypTg7nb+2I4Z1zxuwQ+R4wLDGvP3b83/23VRR0IudqKscFjdQItBneGL5L/hYIF6B2CAfb6NRJ0G2PF4P8FFnoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731971499; c=relaxed/simple;
	bh=8V0NmFdKnE9/i/57to7ll3rJ1CtZOkRFCCnJ3dHwd+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mpo4D3o1tVWlCk+Y5oG5c4OwiVEg7AgPBS01XaNDjMTEOHG+JTatu2lIL0UW+4yIyGhoFWcHiv/+BKyhz4mbeOn7XFzR6mPcS8reg6gtRwp1NvZbqYdIgmieVu1yeIuVOTTIMGO6FyGEZP1+XL93KwUprAoZeP8NkH1tcxgT4/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gsV3U6Jt; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gsV3U6Jt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731971497; x=1763507497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8V0NmFdKnE9/i/57to7ll3rJ1CtZOkRFCCnJ3dHwd+8=;
  b=gsV3U6JtwseFr8rz1ooI8ZodSeZ2rV3O1S32YZE8PzalrbE0+F37WkbW
   k0O7GQhfzU/4vdtxvUQk3lmblLTiYKhqy5gjx+cmbglutfVXpwOuX2ORn
   os1t0OVpEh4luNP7vweObGfy4rQQlTzHAU+DHVE5bEBwAKT8GOXJBave6
   2VQtxI62t/FpeRbt+ivdDOOk5EpbLqPxq7Ocd10ToU76E4sUSOrt2LOrk
   bT/8Y01jWK8TChumWqC+H2NbEdOKFlS+C3uwcgsIRcgiijB2HZ0956pWo
   3QfUPrGP9btlHvVrUG1qOcz6k1yHfvTsT6aQLxFiCxCCca2tGx/X1E4l7
   g==;
X-CSE-ConnectionGUID: W1IRZiTJQ/eKJL+Aqnrqqw==
X-CSE-MsgGUID: I7/dDICdSAqC85J8zJWU2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32010677"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="32010677"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 15:11:36 -0800
X-CSE-ConnectionGUID: 6FBRzFVFSYGoM+/DL4zCbg==
X-CSE-MsgGUID: pjTOGwr+SV2rAEpP/u8Cow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="94445902"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Nov 2024 15:11:36 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDAu4-0002gb-2N;
	Mon, 18 Nov 2024 23:11:32 +0000
Date: Tue, 19 Nov 2024 07:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/ptp/tkntp 145/147]
 kernel/time/timekeeping.c:1462: warning: Function parameter or struct member
 'tkd' not described in '__timekeeping_inject_offset'
Message-ID: <202411190715.qfq1uOHH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/ptp/tkntp
head:   a4bce60c005c044a73440e5bdade846cce1c3d02
commit: 45ea865d5146235421f9f9e6f079e49c95e81e5a [145/147] timekeeping: Make timekeeping_inject_offset() reusable
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241119/202411190715.qfq1uOHH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190715.qfq1uOHH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190715.qfq1uOHH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/timekeeping.c:1462: warning: Function parameter or struct member 'tkd' not described in '__timekeeping_inject_offset'


vim +1462 kernel/time/timekeeping.c

8524070b7982d7 John Stultz        2007-05-08  1454  
c528f7c6c208f1 John Stultz        2011-02-01  1455  /**
36c2195dacb38a Thomas Gleixner    2024-11-09  1456   * __timekeeping_inject_offset - Adds or subtracts from the current time.
6e5a91901c2dff Alex Shi           2020-11-13  1457   * @ts:		Pointer to the timespec variable containing the offset
c528f7c6c208f1 John Stultz        2011-02-01  1458   *
c528f7c6c208f1 John Stultz        2011-02-01  1459   * Adds or subtracts an offset value from the current time.
c528f7c6c208f1 John Stultz        2011-02-01  1460   */
45ea865d514623 Thomas Gleixner    2024-08-04  1461  static int __timekeeping_inject_offset(struct tk_data *tkd, const struct timespec64 *ts)
c528f7c6c208f1 John Stultz        2011-02-01 @1462  {
45ea865d514623 Thomas Gleixner    2024-08-04  1463  	struct timekeeper *tks = &tkd->shadow_timekeeper;
36c2195dacb38a Thomas Gleixner    2024-11-09  1464  	struct timespec64 tmp;
36c2195dacb38a Thomas Gleixner    2024-11-09  1465  
1572fa03784831 Arnd Bergmann      2017-10-19  1466  	if (ts->tv_nsec < 0 || ts->tv_nsec >= NSEC_PER_SEC)
c528f7c6c208f1 John Stultz        2011-02-01  1467  		return -EINVAL;
c528f7c6c208f1 John Stultz        2011-02-01  1468  
82214756d35f48 Anna-Maria Behnsen 2024-10-09  1469  	timekeeping_forward_now(tks);
c528f7c6c208f1 John Stultz        2011-02-01  1470  
4e8b14526ca7fb John Stultz        2012-08-08  1471  	/* Make sure the proposed value is valid */
82214756d35f48 Anna-Maria Behnsen 2024-10-09  1472  	tmp = timespec64_add(tk_xtime(tks), *ts);
82214756d35f48 Anna-Maria Behnsen 2024-10-09  1473  	if (timespec64_compare(&tks->wall_to_monotonic, ts) > 0 ||
7a8e61f8478639 Thomas Gleixner    2019-03-23  1474  	    !timespec64_valid_settod(&tmp)) {
45ea865d514623 Thomas Gleixner    2024-08-04  1475  		timekeeping_restore_shadow(tkd);
82214756d35f48 Anna-Maria Behnsen 2024-10-09  1476  		return -EINVAL;
4e8b14526ca7fb John Stultz        2012-08-08  1477  	}
1e75fa8be9fb61 John Stultz        2012-07-13  1478  
82214756d35f48 Anna-Maria Behnsen 2024-10-09  1479  	tk_xtime_add(tks, ts);
82214756d35f48 Anna-Maria Behnsen 2024-10-09  1480  	tk_set_wall_to_mono(tks, timespec64_sub(tks->wall_to_monotonic, *ts));
45ea865d514623 Thomas Gleixner    2024-08-04  1481  	timekeeping_update_from_shadow(tkd, TK_UPDATE_ALL);
36c2195dacb38a Thomas Gleixner    2024-11-09  1482  	return 0;
82214756d35f48 Anna-Maria Behnsen 2024-10-09  1483  }
c528f7c6c208f1 John Stultz        2011-02-01  1484  

:::::: The code at line 1462 was first introduced by commit
:::::: c528f7c6c208f1fae6b4025957173dec045e5f21 time: Introduce timekeeping_inject_offset

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
