Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF90480DD4;
	Tue,  4 Aug 2026 16:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785862281; cv=none; b=p26n7ul7B5kKBSPl/goA78b8I9dQc3ikiDHhcDwZHBouiUySCTqV9/Mf/UzAC/MO3NyDDPsQjNGcwsgH0Fat70I+2vm2HA05/cH7CHLlnzE/R6hdCKfvPz4eNFYZTwybj7+bWVHx86k+qs6DNXwdt40nXvjFrpRkZ0dtfTwPUt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785862281; c=relaxed/simple;
	bh=oTst9dlQiqqEpHcodZItFhx9Bkcs1S5YPPAoEe0AiOE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oAsURjkvluAwkph5z8IEb+3US0isebmpt9vxjBmWzjFtSVBLWwD/7+rCdbCarIlLkF8fSZqmw91i9/w94D4r8jeLnsxmgblAPY3Rt6OwdXv15TUrVQ6u79J4HeguPG1oHggMYs2VXjEaKutY/LiKIL7AAWiL1jh3vH+n9fBhPUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aM7kOUX8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aM7kOUX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785862278; x=1817398278;
  h=date:from:to:cc:subject:message-id;
  bh=oTst9dlQiqqEpHcodZItFhx9Bkcs1S5YPPAoEe0AiOE=;
  b=aM7kOUX87Sfj9mCgU9u+P/VfFLKpRRwDZ5Q5yjCzWyNch50jNLKWyUd2
   bYpjbWii21N9SlMQCgf0nAzG7M4QwU6c0p3+SXb5wic5HPAU4iC/JdzGW
   yk11MUn6RKcfK2n5bE73gzmLHoJ88RYnUdGc4ZGrSw90VZhF8FTUD0bD1
   i5dbHKni+h72bKO5QDIz+DTnBN8XFsTvxC/ogZ/dpLl7ngdJX0RFm62le
   9vUFxIshZIrTGqQxXu/qlb4+d7c+OIT1di8/niW9i6F8U9Y89528ZsJpl
   AK+D53lc43FiABhV9L9BLILk21A8tN6JegMklFyLIQ1o0ZypjoZLU2Tld
   Q==;
X-CSE-ConnectionGUID: jEpatsHZQ2q4AYmCkCAsuA==
X-CSE-MsgGUID: sjhqeiB8S9qL1oegJc3Jog==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="90093811"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="90093811"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 09:51:14 -0700
X-CSE-ConnectionGUID: 92XVZibbSqeiwL+esuGrbw==
X-CSE-MsgGUID: TSY9cAG/TGeLu1rioKbmPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="291497317"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Aug 2026 09:51:12 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrIM7-00000000AEz-2Z0U;
	Tue, 04 Aug 2026 16:51:07 +0000
Date: Wed, 05 Aug 2026 00:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [reinette:resctrl/controls_rfc_v2 81/88]
 include/linux/resctrl.h:65:71: warning: declaration of 'struct rdt_resource'
 will not be visible outside of this function
Message-ID: <202608050040.qNdyOPko-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git resctrl/controls_rfc_v2
head:   fbed64f80515241bc6da124585328fd5047a4a13
commit: 0e63339f4b31df77e01c52f8c33f31d2a55008f8 [81/88] fs/resctrl: Introduce iterator for enabled controls
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260805/202608050040.qNdyOPko-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050040.qNdyOPko-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050040.qNdyOPko-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/proc/base.c:98:
>> include/linux/resctrl.h:65:71: warning: declaration of 'struct rdt_resource' will not be visible outside of this function [-Wvisibility]
      65 | resctrl_enabled_ctrl_iter_next(struct resctrl_ctrl_iter *iter, struct rdt_resource *r);
         |                                                                       ^
   1 warning generated.


vim +65 include/linux/resctrl.h

    63	
    64	struct resctrl_ctrl *
  > 65	resctrl_enabled_ctrl_iter_next(struct resctrl_ctrl_iter *iter, struct rdt_resource *r);
    66	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
