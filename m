Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4AC2798F3;
	Fri, 15 May 2026 16:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863636; cv=none; b=pQ23Bmy2OOFjsCz91o5lKbHkkUS4asbdnjTvLwvXKIGDxkGM0r0LXFxfwEgktAmvnQkMnc/fC1b/PY9Dl4MyQ96bo2+cZjxjkSMdyg8MHHVzEzBrRPvJNON1Bfqk0DTCscvLARiOR6G1oNxnDJzlPHRTg9mA1LKJ3TIcUbRZqZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863636; c=relaxed/simple;
	bh=EZ+7Uu3L/TfXCU+UonXXp9bbYUjHGYOLAEhUABJa0PM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pd9gjMeb+S3bzgHSed8IWqv4oHHyvCxIBceMSw6aI3zmh5r1Poima4kIc67RZpAparYsKTDD0uyC+CjWruO3lc8e5+CbdUuZJ/sO7XLiHwqxY9NKe54KjhhJmomzlB4RXgbkLeEVP92uHagMJqwEHTh+3GPPiWRUARDvHixy49o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DZi+LXti; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DZi+LXti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778863635; x=1810399635;
  h=date:from:to:cc:subject:message-id;
  bh=EZ+7Uu3L/TfXCU+UonXXp9bbYUjHGYOLAEhUABJa0PM=;
  b=DZi+LXtiXG/wOZzB8AzkYqS7r+HP7yqLaRkRvo2zJgaRnOzZ1e1/l1RC
   WX8bK+7UdGKiGXGJIs78VSRW7DjYEFFEO653fW2qMODU3ylCdQi5S5+Ui
   8fytMxsSRHJuuFjnzD9jW4ujyKqQEPvOjc/7QRqIOupTeKLH81cXh9XSi
   z2f+31Lk2rt28vt2/cd4nOAw2VavIVtvkOs5ay3Zsz5mbR1phPm2jEJtT
   fely+HYHDZ2gPddBIX/JJ7/wctexJAwHqwmmdHt6ySxLyuhajYy+IBccg
   897G+Xt4OOmHTEHd6+g9Uig+cgNfIb0Buj+SbO1YGvlRJMOant8gG5ctu
   Q==;
X-CSE-ConnectionGUID: 136KePbTTwKGjCg9ovSdOQ==
X-CSE-MsgGUID: zV3/+2AtTFC2bFtOta038w==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79677399"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79677399"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:47:14 -0700
X-CSE-ConnectionGUID: UeMT5Kq7SqOwT9a0Oy95Nw==
X-CSE-MsgGUID: QuD5rQ1jQxqKxe+nQTboWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="235697875"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 15 May 2026 09:47:13 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNvgt-0000000093N-1Ypy;
	Fri, 15 May 2026 16:47:11 +0000
Date: Fri, 15 May 2026 18:46:40 +0200
From: kernel test robot <lkp@intel.com>
To: Zide Chen <zide.chen@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: arch/x86/events/intel/uncore_snb.c:596:14: error:
 incompatible function pointer types initializing 'int (*)(struct
 intel_uncore_box *)' with an expression of type 'void (struct
 intel_uncore_box *)'
Message-ID: <202605151809.IdCavpnO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Zide-Chen/perf-x86-intel-uncore-Rename-refcount-fields-and-other-cleanups/20260515-133040
head:   c085f636ae022b2ae8e592275c3c8547a660c069
commit: bafd0d397ee00033633fc9a8383d5726a36d72ba perf/x86/intel/uncore: Let init_box() callback report failures
date:   11 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260515/202605151809.IdCavpnO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605151809.IdCavpnO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605151809.IdCavpnO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/events/intel/uncore_snb.c:596:14: error: incompatible function pointer types initializing 'int (*)(struct intel_uncore_box *)' with an expression of type 'void (struct intel_uncore_box *)' [-Wincompatible-function-pointer-types]
     596 |         .init_box       = adl_uncore_msr_init_box,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +596 arch/x86/events/intel/uncore_snb.c

772ed05f3c5ce7 Kan Liang 2021-04-12  594  
772ed05f3c5ce7 Kan Liang 2021-04-12  595  static struct intel_uncore_ops adl_uncore_msr_ops = {
772ed05f3c5ce7 Kan Liang 2021-04-12 @596  	.init_box	= adl_uncore_msr_init_box,
772ed05f3c5ce7 Kan Liang 2021-04-12  597  	.enable_box	= adl_uncore_msr_enable_box,
772ed05f3c5ce7 Kan Liang 2021-04-12  598  	.disable_box	= adl_uncore_msr_disable_box,
772ed05f3c5ce7 Kan Liang 2021-04-12  599  	.exit_box	= adl_uncore_msr_exit_box,
772ed05f3c5ce7 Kan Liang 2021-04-12  600  	.disable_event	= snb_uncore_msr_disable_event,
772ed05f3c5ce7 Kan Liang 2021-04-12  601  	.enable_event	= snb_uncore_msr_enable_event,
772ed05f3c5ce7 Kan Liang 2021-04-12  602  	.read_counter	= uncore_msr_read_counter,
772ed05f3c5ce7 Kan Liang 2021-04-12  603  };
772ed05f3c5ce7 Kan Liang 2021-04-12  604  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
