Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B053B895F;
	Fri, 22 May 2026 11:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779450840; cv=none; b=VlfIYZolyzVTnT6gsuDnClcA9p8uEqXKN/ozp9IUnq0HxC6vm8xL2AF/eiIjxOHl76y0iqe9gf+gAgjAj+uvj4Nob80B4so14EtbM7mkWYdqBNuBjCQLz1+pqEsOpvc3Y13PCJztuUgtDhrmgCHMF7bswyL2yrwxx1ZJ94FzvhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779450840; c=relaxed/simple;
	bh=z0wgJWO5DkDvtdScBByuYtzyDldVAQs6Ya8dwsUvxuM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JEzq6DwjA/J+NsUhl5OJgjRZ8Uwa+Lzur97/LWeCbYJxrKzbksygpYcdDBhNNyTrKVmPGQ0J7ZP5d+Y/hcTAxnl35I0jbK2nHue9Rz/u0aEwew0z7wwqXYjD6yjXOgojkfux/xVyEqpFv0LhQtAF0hW1D9SQIxi6hiZct1SRGSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GPShf2dR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GPShf2dR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779450840; x=1810986840;
  h=date:from:to:cc:subject:message-id;
  bh=z0wgJWO5DkDvtdScBByuYtzyDldVAQs6Ya8dwsUvxuM=;
  b=GPShf2dRcuSMEBDfv+9atQrNrA1pxLZzLjZkfSLKDwCUfXWeK/rByq2U
   ladjRXZVr/ldno5xIS4y42D1bsJjVcuucimTsCdBan7Xf6E7LMsOKZKwA
   EWJFX44OIrQ5zCwsQHT7u7y+r0fU5pM4fe5CYvQTbnRsw5lI4w95myFWc
   sWHs7QJwxtWKf5ObQm0eAWEEP+6M2jEG3+BVLu9e8T+y8Gf5T/5Tk84WW
   X4gf9OdlPgveQjjuvqW5jM0VqZtNONCMgaH9IBEQIEsTfYp2CFi1imRMk
   95punA7gO3p/io/avxhztmimfr1Qr0gmewwchDN+cnTM0H7zcC60+KsIk
   Q==;
X-CSE-ConnectionGUID: GdCRZwYaSti7s5m/977tZw==
X-CSE-MsgGUID: HSa66FzYS2GRhd1O4u9MRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80348429"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80348429"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 04:53:59 -0700
X-CSE-ConnectionGUID: fLAg6iZDQKOJDbVT6dHQNg==
X-CSE-MsgGUID: HoB/gGiCSNSLLb8Ja7jUgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="237853119"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 May 2026 04:53:57 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQORu-000000002JL-3Ysf;
	Fri, 22 May 2026 11:53:54 +0000
Date: Fri, 22 May 2026 19:52:56 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Kaiser <martin.kaiser@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 872/1130]
 drivers/misc/lkdtm/bugs.c:177:24: warning: variable 'magic' is uninitialized
 when passed as a const pointer argument here
Message-ID: <202605221927.wxVO8Wqj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 939c5fd4657aa2955f137e4aed26c66ffe5bb4dd [872/1130] lkdtm: fix cheri warnings from clang-tidy
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605221927.wxVO8Wqj-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221927.wxVO8Wqj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605221927.wxVO8Wqj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/lkdtm/bugs.c:177:24: warning: variable 'magic' is uninitialized when passed as a const pointer argument here [-Wuninitialized-const-pointer]
     177 |                 stack_addr = __c_pa(&magic);
         |                                      ^~~~~
   1 warning generated.


vim +/magic +177 drivers/misc/lkdtm/bugs.c

   168	
   169	static void lkdtm_REPORT_STACK(void)
   170	{
   171		volatile uintptr_t magic;
   172		pid_t pid = task_pid_nr(current);
   173	
   174		if (pid != stack_pid) {
   175			pr_info("Starting stack offset tracking for pid %d\n", pid);
   176			stack_pid = pid;
 > 177			stack_addr = __c_pa(&magic);
   178		}
   179	
   180		pr_info("Stack offset: %d\n", (int)(stack_addr - __c_pa(&magic)));
   181	}
   182	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
