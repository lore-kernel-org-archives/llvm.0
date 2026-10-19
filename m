Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8937F34C806;
	Mon, 19 Oct 2026 02:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792378270; cv=none; b=NbKrvFyZCOFTixwOGwBLtHOWmJ9mTv1A7+IkDNK68rzTmkrPrrVLGl7hwYDLIQFGWxBKsUOzEkwB6yyKoFTkhX9g8fQyaxxCZ2M3+7KKb++RBcWpMK2lu895/wNMtTuvZJGhkr3YYOa0mi+pIrQanLzH7vjz5jRyBaQdtyi6DpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792378270; c=relaxed/simple;
	bh=rqqznpB6RL6UhhaFCSI/HnuBnhCMQphoZMngQU+jJi4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GiNMNx96XyQaHfvtYr5e2L+5PseoDlXoQABFKD1F/4s12Mgm2YE4UVOLPGVkGECebVVYGg/p+K7qXHPLwryLauxQxHe9Iop8NKFahjPrGRJZmo0sPGvaSS3896gyRTFiBpPrWLp/u8cwaglfCK+tywjU7kn72hsqrU62wqMN7cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FY+Z/S2W; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FY+Z/S2W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792378269; x=1823914269;
  h=date:from:to:cc:subject:message-id;
  bh=rqqznpB6RL6UhhaFCSI/HnuBnhCMQphoZMngQU+jJi4=;
  b=FY+Z/S2WNKwZBG07IVzWWobYuY6PtNj1xan+VBIf2m5cw3v27ftiLbvJ
   o/t+mw4HQII3uRpYbY9/8nLV9qeI9YID8CL1tWwnTyGopfIVvvGiEgMhp
   aue8SHozbNZJtQWaCb2P69DaYy0evBhS5Aq+hcxnenFrE8KTWgX8uf6QD
   KZL9LCkJHYM9QPPAqvEmNq8Z98Jah1eTEMDtwKODNvV0/yNcfL1G+W2dc
   ngmDz3fjn6R0d/wN4nWgfiy9MrHe7XyU0CwIo9NHmfgDChwRDcqg6oMke
   VNgasKBKgQwXhDm3WcpDK3puLZYgxv/cclALNSPC7tsQn8Jw1UT6vxizR
   g==;
X-CSE-ConnectionGUID: IC5tcYH2QVyZmLHxyCVrcw==
X-CSE-MsgGUID: OBwhApM+QHiwZjTcsRm3QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1162907"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1162907"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 19:51:08 -0700
X-CSE-ConnectionGUID: dfJbzmhiRb+a9vJKLyws4g==
X-CSE-MsgGUID: CwXB0qM3Q8efTEbaSSpjuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2410356"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Oct 2026 19:51:05 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIdSo-00000000L8s-2JKC;
	Mon, 19 Oct 2026 02:51:02 +0000
Date: Mon, 19 Oct 2026 10:50:06 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:core/hotplug 45/49]
 kernel/irq_work.c:184:44: warning: omitting the parameter name in a function
 definition is a C23 extension
Message-ID: <202610191031.4PaHWif2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git core/hotplug
head:   6cbb08c40db1f93e15aaef964883729494f3a478
commit: 8b3cdb229529280585c5ac39daa446e735bce900 [45/49] irq_work: Introduce irq_work_kick_cpu()
config: um-x86_64_defconfig (https://download.01.org/0day-ci/archive/20261019/202610191031.4PaHWif2-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610191031.4PaHWif2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610191031.4PaHWif2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq_work.c:184:44: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
     184 | static void irq_work_kick(struct irq_work *)
         |                                            ^
   1 warning generated.


vim +184 kernel/irq_work.c

   183	
 > 184	static void irq_work_kick(struct irq_work *)
   185	{
   186		/*
   187		 * Kick the CPU, typically so that it takes action:
   188		 * * On IRQ exit (nohz_full dependency changed and tick must be restarted)
   189		 * * On the idle path so that the next tick is re-evaluated.
   190		 */
   191	}
   192	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
