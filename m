Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A609336605A;
	Fri, 22 May 2026 18:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779472951; cv=none; b=u2F9VmyJpm55RnejKi3B8onLz3c2y/Lx3AjYnuP3gjmSYCIrJ5rSnTIdJubrFitb5N4mWh8lxOXQWtssJUBdJ+4PM6GRLNNoKfTsrvmomv1Sh61fxHZY1+Kho/akNo6XWA03RTOry0K+oJ2dT5noMxSZhb+XexhBNxYmxtW0eeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779472951; c=relaxed/simple;
	bh=l8ODfZgffWhTHTNDJn/mQ2hY1Ih7Z3HZW4fAEarFVBg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AB1B3wqjLX07SwOPbpdAe7cHBYzY5UGlDqfU3efXzFhB7vtspHsej8td9oDZmAaDY8Rm/vFB5a+djRP6HDTRUo6wuOjzc4veXlTsGDUNi/ii7wo+zJVUXdtfKtQMjWuit8Y987HPsaxAipUPYDQ9XiW9BBJdmCaIZcRzjbIXXp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gg0Ws3W6; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gg0Ws3W6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779472949; x=1811008949;
  h=date:from:to:cc:subject:message-id;
  bh=l8ODfZgffWhTHTNDJn/mQ2hY1Ih7Z3HZW4fAEarFVBg=;
  b=gg0Ws3W6mfPR1b2/LDnKNzZvGQQAvbfeBSeHRf+Jbu8bsBCw+Zdvcnmf
   DB9gGIQTEGP87Mfz79ssHdeDv/CykWnrywHLYsWI+W7kGGDrd0NiaWhou
   7XSS8I1gjd0JE3GvMAy6rUIBgE7/B1N6Nq/YGJwK/1Z/F96tNatyhc/sb
   Ec0BfHb9m5dYmWu4dX+/c0NSw0OW7abEfA4D/+AGXL7RJ8AzyLN44JN+b
   HZTHsoWIn7vfGGF7VYTVXNHmoqK6hbLL80YOJIs3P0IisXqjUb8anEb+Z
   2aVU1RqxGtudcsa9AR/v/Z0kC7Z6yhypB/1Aj9LpfR+0GAGkiKHWkWr/u
   Q==;
X-CSE-ConnectionGUID: /4m6WDR3Th6ft6+PW4nd3Q==
X-CSE-MsgGUID: uGVO8U9DQtGOBJFUUn4ofg==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="97832237"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="97832237"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 11:02:29 -0700
X-CSE-ConnectionGUID: 2dH2sRdzQq64RinRheDw8A==
X-CSE-MsgGUID: pYAYzQNXTQSwz9NnVERgcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="241043530"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 22 May 2026 11:02:27 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQUCX-000000002pZ-1T0h;
	Fri, 22 May 2026 18:02:25 +0000
Date: Sat, 23 May 2026 02:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 1057/1130]
 drivers/usb/misc/sisusbvga/sisusbvga.c:2748:47: error: call to undeclared
 function 'compat_ptr'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605230126.Pb5CR8Zy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: cbf08e7e214ff0b91ce6944b628a22044f0b893c [1057/1130] cheri: compat64: usb: Enable compat64 handling in usb/
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260523/202605230126.Pb5CR8Zy-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605230126.Pb5CR8Zy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605230126.Pb5CR8Zy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/misc/sisusbvga/sisusbvga.c:2748:47: error: call to undeclared function 'compat_ptr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2748 |                 return sisusb_ioctl(f, cmd, (user_uintptr_t)compat_ptr(arg));
         |                                                             ^
   1 error generated.


vim +/compat_ptr +2748 drivers/usb/misc/sisusbvga/sisusbvga.c

  2739	
  2740	#ifdef CONFIG_COMPAT
  2741	static long sisusb_compat_ioctl(struct file *f, unsigned int cmd,
  2742			unsigned long arg)
  2743	{
  2744		switch (cmd) {
  2745		case SISUSB_GET_CONFIG_SIZE:
  2746		case SISUSB_GET_CONFIG:
  2747		case SISUSB_COMMAND:
> 2748			return sisusb_ioctl(f, cmd, (user_uintptr_t)compat_ptr(arg));
  2749	
  2750		default:
  2751			return -ENOIOCTLCMD;
  2752		}
  2753	}
  2754	#endif
  2755	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
