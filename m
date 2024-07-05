Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240001B963;
	Fri,  5 Jul 2024 18:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720203300; cv=none; b=Ksiq8vHS7+7SxDplCx9ydexmpK/qNRy+/KtHHt7bYm4kvkCWFJw5tCg/f4yIzgnzq0CWgWOej5Q4C6Jp9Re6sEMSG0mQxhe9AfHF7QCOQqw/CWc711Jo0n2EVqi19m84vDOvvNOr2q+Mxj2JdK/mFNuCKyz1aKYowyGEBT/GW6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720203300; c=relaxed/simple;
	bh=1yUskJF5r77KmHf7/IA03V7zymkcDKZmE6W2B18ANvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hg9MkQFEALYz1TzjODzjPIRbSPZAYffq0gQYVOTRHb0/Re+HEDdj2YoelEafl1o6tnef7i8WtDE46Sd17H+Wc/aYE+aPw5dENubzD4m9LdT4U2pzau7aVu4xq54BXJAU9sg/ipKTum9/Iu/2kSKgrNILUaVHGEs5lVwhjEGg8M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RvBtvluy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RvBtvluy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720203298; x=1751739298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1yUskJF5r77KmHf7/IA03V7zymkcDKZmE6W2B18ANvE=;
  b=RvBtvluyzuve+3ny+742X9IgqJCQeg/SG2I8XRIjcD1uguVuKKQavMJy
   CySMsBcpHM54jfwEmAd6cTcSLRoCovcz11DSs0zm46JFb2uaUQ5X80XfS
   WNGQrqhHUKUDApXt16Re4yPepH+oP7/5WniF7lIbv6EROoQBrjjY5aEMe
   IZpxVBeDBJJIXMbYhk0AZqvOFoP56t8NQzpNen3ngGstiHmQbPCG/Kkgo
   nu/dRatKdETWuuikucnqsL3Ojh3ArF9jcEx7CsQmjahlBotWyHM6iPkt+
   IlmeJ5hDH73TirD2RtLpdDo1RaQ6iqg9DKFCIoP+VkRiYIVcDiugq6JUq
   A==;
X-CSE-ConnectionGUID: vnljpCVlTnuvetvS2YZejQ==
X-CSE-MsgGUID: CAN6RIAEQL6eH36H62GxNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="12410706"
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="12410706"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 11:14:56 -0700
X-CSE-ConnectionGUID: GJYPcKArQhiKKzOfZ7O6lg==
X-CSE-MsgGUID: Gp+QWFnRRYaVbHyDL/6kHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,185,1716274800"; 
   d="scan'208";a="51359316"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jul 2024 11:14:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPnSP-000Shc-2Y;
	Fri, 05 Jul 2024 18:14:53 +0000
Date: Sat, 6 Jul 2024 02:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:perf/uprobes 9/11] kernel/rcu/srcutree.c:724:1: error:
 expected identifier or '('
Message-ID: <202407060220.GLzM9U1O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/uprobes
head:   b9867ee7d141bc8791e501495bafdfdb97283196
commit: 6b39b0e14b07a435cba021ae102a95ded6e6cab1 [9/11] srcu: Add __srcu_clone_read_lock()
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240706/202407060220.GLzM9U1O-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240706/202407060220.GLzM9U1O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407060220.GLzM9U1O-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/srcutree.c:26:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/rcu/srcutree.c:724:1: error: expected identifier or '('
     724 | {
         | ^
   1 warning and 1 error generated.


vim +724 kernel/rcu/srcutree.c

   722	
   723	void __srcu_clone_read_lock(struct srcu_struct *ssp, int idx);
 > 724	{
   725		this_cpu_inc(ssp->sda->srcu_lock_count[idx].counter);
   726	}
   727	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
