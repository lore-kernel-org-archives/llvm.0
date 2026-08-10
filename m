Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F93F233941;
	Mon, 10 Aug 2026 05:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786340740; cv=none; b=f7QDF7e34CeP3vVfvx/vxDwon3Wu3p/4QLd2jFCvoHagtu6i4tpermeBPNO0aR94tDEMlgI2s+GEWxIRuWopayC8i+VAUAoyo95ckiyBIJpWR8erpLMabNkO/eemRFNZWFrZrGbnz8XGRuyQc/1a+qWPmV5eDhSJb1IEZDWGex0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786340740; c=relaxed/simple;
	bh=5Bjr3uylJ+wHh2qUC/f27yURuqXA/hRiXW+d1uBv/Yk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bhGURWDUonKMy/YkPYi8/V6/YCcvu5qL/TzkgysfsM5KfqIuGOgLhJf+Y+QXiHpPgzt6W0lgQ9KJw/kdmGAqFhWBk8TR+FE855hYZS5/HXxzYuPApEOoaSdXI31/d46c5bCZGBLfJ1MxIiE/n21sfzjY0bD+XsQetlI9pYqApT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iiJTEYQv; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iiJTEYQv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786340738; x=1817876738;
  h=date:from:to:cc:subject:message-id;
  bh=5Bjr3uylJ+wHh2qUC/f27yURuqXA/hRiXW+d1uBv/Yk=;
  b=iiJTEYQvvQBvjcEIkJQUzdz+pq+5fhN+tFlFWUJYVfJRSfyZ3pws8KDr
   NJVvQf4HO0Z9BoCqcLGutinkwxh3zjFouaybTXh9Ew5Rc/hkVmZCAmW6b
   O/VNyzc4ZjSDDX/jSViaZ/BXnzGbZLMVS4MC8ZHEgJgWoIW23rMQ7xnrY
   faOacrTYDHFwDV1l7YKoWFaZ5qHgiP5cxAWQJAeXsvNlS3iVrFd05eeyO
   GoXMWR3xECWug7RLjVfZFQfVD6oRNnT4qlv6H5VjSY8iNHP4RxzASLeex
   ig/q8ObRI3T+Km6cCxUfJTWnn/5jJK0YJHf7lwr2b6JtveMGESIz2+dG8
   g==;
X-CSE-ConnectionGUID: /Q7/3KqvTfm4P8siQo904Q==
X-CSE-MsgGUID: s8W23AggR5G9moDlrrSLDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86921668"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="86921668"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 22:45:38 -0700
X-CSE-ConnectionGUID: 1VHxi5wMQ6+94nzOrBZH1Q==
X-CSE-MsgGUID: E74gyPgZSrKqBnJbdRO7FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="263561635"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Aug 2026 22:45:36 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtIpJ-00000000Muc-3swH;
	Mon, 10 Aug 2026 05:45:33 +0000
Date: Mon, 10 Aug 2026 13:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/hmx 93/114] arch/hexagon/kernel/smp.c:74:6:
 warning: no previous prototype for function 'smp_vm_unmask_irq'
Message-ID: <202608101323.wazfoQLp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/hmx
head:   d18cfcbc89df32524d340991739f2a7695263a90
commit: 6b67e2ee11b036dc18ffdc2028d4716b60cec657 [93/114] hexagon: add debug infrastructure
config: hexagon-randconfig-002-20260810 (https://download.01.org/0day-ci/archive/20260810/202608101323.wazfoQLp-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608101323.wazfoQLp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608101323.wazfoQLp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/hexagon/kernel/smp.c:74:6: warning: no previous prototype for function 'smp_vm_unmask_irq' [-Wmissing-prototypes]
      74 | void smp_vm_unmask_irq(void *info)
         |      ^
   arch/hexagon/kernel/smp.c:74:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      74 | void smp_vm_unmask_irq(void *info)
         | ^
         | static 
   1 warning generated.


vim +/smp_vm_unmask_irq +74 arch/hexagon/kernel/smp.c

43afdf50838634 Richard Kuo 2011-10-31  72  
43afdf50838634 Richard Kuo 2011-10-31  73  /*  Used for IPI call from other CPU's to unmask int  */
43afdf50838634 Richard Kuo 2011-10-31 @74  void smp_vm_unmask_irq(void *info)
43afdf50838634 Richard Kuo 2011-10-31  75  {
43afdf50838634 Richard Kuo 2011-10-31  76  	__vmintop_locen((long) info);
43afdf50838634 Richard Kuo 2011-10-31  77  }
43afdf50838634 Richard Kuo 2011-10-31  78  

:::::: The code at line 74 was first introduced by commit
:::::: 43afdf508386342d714f6911c1976f934b520cb0 Hexagon: Add SMP support

:::::: TO: Richard Kuo <rkuo@codeaurora.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
