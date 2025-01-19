Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB321F5FA;
	Sun, 19 Jan 2025 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737281907; cv=none; b=sjxAw6EhkJr1TAuNGEyjuSm+biz6Ui6blIa5rJ01RIxghySU8cpWXmFHynOvwM7vxw8X9/SpC2pMvRjz9AgQL3nFsV58y+euyPNDbGi4cBMqnOEoMXum8A9TtJKK1uaa7b4epPV+zfjjuFr+nFuO5F9FpyAw4S43Lb33EUtXOPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737281907; c=relaxed/simple;
	bh=fbDflAL469mFiNpSh8914Re9e765/OJwGE9qPeluOUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KVE7OBslv+c/uJJRnIl7ns40/PMaUlclJkaMKl78LAOLyZEprpXRU0O6l+awLl1srb2ZdnUXN1jvH/sCVGsmyEAp59VfrjoQIvghccYadfq2VrhW8gWritzTyeL9Pl/wCGjkmfbEGRv4KMq8xtwCl+TQ1rWVR2jWgqNAF9dd3YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k8Sjz1Qx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k8Sjz1Qx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737281906; x=1768817906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fbDflAL469mFiNpSh8914Re9e765/OJwGE9qPeluOUY=;
  b=k8Sjz1QxHyeQvzaDQtVp0yzCVVTwg5U717Qhrf0RARoz5FkrRCqgQY6k
   0zMPBgdFR+P3Ui4Xq14pUyWtNEwaIsIJW6Nl7gENjjwkoqKi076NWd3vR
   Qnl8HtATlyJlDBbOa/FgGVGLLq4dTAeG0bQ3SGzsBUUsXGbejJzuJvMwf
   Z/SfUe1OK1qqKz83SYmLeCvxbYIAacUsHzz3Rg734RSLN6preyrkSBmgO
   BR5Rx8b+UDRxiCi22ih96rrzYvzZ3+qdw+UyYpV/jiXs4xFxlsZ7VJxv2
   O4b/vlbD2U8C0jTcQD143YCXFpeNsVFVC+ehPuG/zqFZoHz6lpy/AGMLr
   A==;
X-CSE-ConnectionGUID: urMcTazBTPiO/mHTSWLmmQ==
X-CSE-MsgGUID: 8WJRrABXQz+MTMsWVjzDwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="48157725"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="48157725"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 02:18:25 -0800
X-CSE-ConnectionGUID: qmDwwgjqSf64zFyYFHaMRw==
X-CSE-MsgGUID: pmFL76bXQUaNqIkv6w1pMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="106374482"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Jan 2025 02:18:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZSNp-000VMF-0k;
	Sun, 19 Jan 2025 10:18:21 +0000
Date: Sun, 19 Jan 2025 18:18:16 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jj-apparmor:apparmor-next 9/19] security/apparmor/label.c:206:15:
 warning: address of array 'new->vec' will always evaluate to 'true'
Message-ID: <202501191802.bDp2voTJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   e6b087676954e36a7b1ed51249362bb499f8c1c2
commit: de4754c801f4ceefc6ce0d13480c506e0a91b449 [9/19] apparmor: carry mediation check on label
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250119/202501191802.bDp2voTJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501191802.bDp2voTJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501191802.bDp2voTJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from security/apparmor/label.c:10:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> security/apparmor/label.c:206:15: warning: address of array 'new->vec' will always evaluate to 'true' [-Wpointer-bool-conversion]
     206 |         AA_BUG(!new->vec);
         |                ~~~~~~^~~
   security/apparmor/include/lib.h:56:15: note: expanded from macro 'AA_BUG'
      56 |                 AA_BUG_FMT((X), "" args);                                   \
         |                             ^
   security/apparmor/include/lib.h:61:8: note: expanded from macro 'AA_BUG_FMT'
      61 |         WARN((X), "AppArmor WARN %s: (" #X "): " fmt, __func__, ##args)
         |               ^
   include/asm-generic/bug.h:132:25: note: expanded from macro 'WARN'
     132 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   5 warnings generated.


vim +206 security/apparmor/label.c

   200	
   201	static void accum_label_info(struct aa_label *new)
   202	{
   203		long u = FLAG_UNCONFINED;
   204		int i;
   205	
 > 206		AA_BUG(!new->vec);
   207	
   208		/* size == 1 is a profile and flags must be set as part of creation */
   209		if (new->size == 1)
   210			return;
   211	
   212		for (i = 0; i < new->size; i++) {
   213			u |= new->vec[i]->label.flags & (FLAG_DEBUG1 | FLAG_DEBUG2 |
   214							 FLAG_STALE);
   215			if (!(u & new->vec[i]->label.flags & FLAG_UNCONFINED))
   216				u &= ~FLAG_UNCONFINED;
   217			new->mediates |= new->vec[i]->label.mediates;
   218		}
   219		new->flags |= u;
   220	}
   221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
