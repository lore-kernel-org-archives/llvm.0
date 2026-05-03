Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718CF39FD9;
	Sun,  3 May 2026 00:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777766934; cv=none; b=Fplj7i+GRzYLV0ixYFTnWOs/6cwCwyHgkVQMxowH9v0D/txDci860sZuxp8HkKcbP71Gw7EYLdZ5PdLC4RJiLPG0oN1WP9QEDJu8c5sfgig12S7+gH+wh0raYc9X3E9EjouFQJsdGmnebz3e4iOLy5R6EOIn3YdW6h9+7yumN+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777766934; c=relaxed/simple;
	bh=hGnU/f2UiuUWBhbPiaKvVeUiCRsNiWbWX4uB0qNyhbc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eKvxpHpIdYtaiSrJ+sMzRURiTW7mNa1fxt/t9wKg4fkyAaxsC8W0TzPAq+VpEiDkjRmOuacfK8DJ4WX6d0DOSb3MfKJ4/MwsF5cXL0K0XPYZrZPrbUDO4uGa2Zcgrdx/SzfXqr06Mm18+P4cI+3u4tuaa+Qc0HrZ0HbNa9hpSR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yv1D7mxm; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yv1D7mxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777766933; x=1809302933;
  h=date:from:to:cc:subject:message-id;
  bh=hGnU/f2UiuUWBhbPiaKvVeUiCRsNiWbWX4uB0qNyhbc=;
  b=Yv1D7mxmR92+mas0jpq8wGL5IOEfcFkBNYNDovKyFU16n9FQYh0r9ZEp
   bHB5mHilZluXPZs+yCqeCr1EVnIT26RJ4lrELue4+3mCnaVgcuUtnB//+
   S/H+qAemT8KufZXQ0l1vNhDycc2D/SXn/PjUNyADxcVH9KEX/NSbigtnn
   OMdVlbQtR+hhxCArN3A088cXL1dyhFjE/5nVHH8naNyW3REuBwmcpXVqs
   4MyHrhfriNd5jMHJvjWS/OQcP7Zp381xewvE2KGrUDjz1bZdzdhxKpbUe
   oQbMscjShhUfqm5VeQ8GC77/rwEheiqk4cS3jWA3X+Eu7aV2k9iH1rSN+
   Q==;
X-CSE-ConnectionGUID: RNILHcstShmCpP62a3tzSA==
X-CSE-MsgGUID: PN+PI5N4TtaLhFQumeu5Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="77842287"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="77842287"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 17:08:49 -0700
X-CSE-ConnectionGUID: OOTFnLtqSp6Gsh7kiIvSZg==
X-CSE-MsgGUID: y3bJPKscQSuX/9LdNIkeqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="273281131"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 May 2026 17:08:47 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJKO4-000000001vj-1z2M;
	Sun, 03 May 2026 00:08:44 +0000
Date: Sun, 03 May 2026 08:08:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Harry Yoo (Oracle)" <harry@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [harry:slab-allow-runtime-parameter-tuning-rfc-v1r1-wip 5/5]
 mm/slub.c:5985:8: error: use of undeclared label 'flush'
Message-ID: <202605030847.0BApbpIn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/harry/linux.git slab-allow-runtime-parameter-tuning-rfc-v1r1-wip
head:   cb8be1e8cd9f6033638b579596456da407e4fb5c
commit: cb8be1e8cd9f6033638b579596456da407e4fb5c [5/5] mm/slab: allow changing sheaf_capacity at runtime
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260503/202605030847.0BApbpIn-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030847.0BApbpIn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030847.0BApbpIn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:5985:8: error: use of undeclared label 'flush'
    5985 |                 goto flush;
         |                      ^
>> mm/slub.c:8575:26: error: no member named 'barn' in 'struct kmem_cache_node'
    8575 |                 if (get_node(s, node)->barn)
         |                     ~~~~~~~~~~~~~~~~~  ^
   2 errors generated.


vim +/flush +5985 mm/slub.c

2d517aa09bbc420 Vlastimil Babka        2025-09-03  5958  
ec66e0d599520ab Vlastimil Babka        2025-09-03  5959  static void rcu_free_sheaf(struct rcu_head *head)
ec66e0d599520ab Vlastimil Babka        2025-09-03  5960  {
ec66e0d599520ab Vlastimil Babka        2025-09-03  5961  	struct slab_sheaf *sheaf;
fd6db58867924d2 Vlastimil Babka        2025-10-11  5962  	struct node_barn *barn = NULL;
ec66e0d599520ab Vlastimil Babka        2025-09-03  5963  	struct kmem_cache *s;
ec66e0d599520ab Vlastimil Babka        2025-09-03  5964  
ec66e0d599520ab Vlastimil Babka        2025-09-03  5965  	sheaf = container_of(head, struct slab_sheaf, rcu_head);
ec66e0d599520ab Vlastimil Babka        2025-09-03  5966  
ec66e0d599520ab Vlastimil Babka        2025-09-03  5967  	s = sheaf->cache;
ec66e0d599520ab Vlastimil Babka        2025-09-03  5968  
ec66e0d599520ab Vlastimil Babka        2025-09-03  5969  	/*
ec66e0d599520ab Vlastimil Babka        2025-09-03  5970  	 * This may remove some objects due to slab_free_hook() returning false,
ec66e0d599520ab Vlastimil Babka        2025-09-03  5971  	 * so that the sheaf might no longer be completely full. But it's easier
ec66e0d599520ab Vlastimil Babka        2025-09-03  5972  	 * to handle it as full (unless it became completely empty), as the code
ec66e0d599520ab Vlastimil Babka        2025-09-03  5973  	 * handles it fine. The only downside is that sheaf will serve fewer
ec66e0d599520ab Vlastimil Babka        2025-09-03  5974  	 * allocations when reused. It only happens due to debugging, which is a
ec66e0d599520ab Vlastimil Babka        2025-09-03  5975  	 * performance hit anyway.
1ce20c28eafdc10 Vlastimil Babka        2025-11-05  5976  	 *
1ce20c28eafdc10 Vlastimil Babka        2025-11-05  5977  	 * If it returns true, there was at least one object from pfmemalloc
1ce20c28eafdc10 Vlastimil Babka        2025-11-05  5978  	 * slab so simply flush everything.
ec66e0d599520ab Vlastimil Babka        2025-09-03  5979  	 */
1ce20c28eafdc10 Vlastimil Babka        2025-11-05  5980  	if (__rcu_free_sheaf_prepare(s, sheaf))
cb8be1e8cd9f603 Harry Yoo (Oracle      2026-04-21  5981) 		goto flush_unlocked;
ec66e0d599520ab Vlastimil Babka        2025-09-03  5982  
5ba6bc27b1f99b3 Vlastimil Babka (SUSE  2026-03-11  5983) 	barn = get_barn_node(s, sheaf->node);
5ba6bc27b1f99b3 Vlastimil Babka (SUSE  2026-03-11  5984) 	if (!barn)
fd6db58867924d2 Vlastimil Babka        2025-10-11 @5985  		goto flush;
fd6db58867924d2 Vlastimil Babka        2025-10-11  5986  
cb8be1e8cd9f603 Harry Yoo (Oracle      2026-04-21  5987) 	if (!local_trylock(&s->cpu_sheaves->lock))
cb8be1e8cd9f603 Harry Yoo (Oracle      2026-04-21  5988) 		goto flush_unlocked;
cb8be1e8cd9f603 Harry Yoo (Oracle      2026-04-21  5989) 
ec66e0d599520ab Vlastimil Babka        2025-09-03  5990  	/* due to slab_free_hook() */
ec66e0d599520ab Vlastimil Babka        2025-09-03  5991  	if (unlikely(sheaf->size == 0))
ec66e0d599520ab Vlastimil Babka        2025-09-03  5992  		goto empty;
ec66e0d599520ab Vlastimil Babka        2025-09-03  5993  
ec66e0d599520ab Vlastimil Babka        2025-09-03  5994  	/*
ec66e0d599520ab Vlastimil Babka        2025-09-03  5995  	 * Checking nr_full/nr_empty outside lock avoids contention in case the
ec66e0d599520ab Vlastimil Babka        2025-09-03  5996  	 * barn is at the respective limit. Due to the race we might go over the
ec66e0d599520ab Vlastimil Babka        2025-09-03  5997  	 * limit but that should be rare and harmless.
ec66e0d599520ab Vlastimil Babka        2025-09-03  5998  	 */
ec66e0d599520ab Vlastimil Babka        2025-09-03  5999  
ec66e0d599520ab Vlastimil Babka        2025-09-03  6000  	if (data_race(barn->nr_full) < MAX_FULL_SHEAVES) {
ec66e0d599520ab Vlastimil Babka        2025-09-03  6001  		stat(s, BARN_PUT);
ec66e0d599520ab Vlastimil Babka        2025-09-03  6002  		barn_put_full_sheaf(barn, sheaf);
cb8be1e8cd9f603 Harry Yoo (Oracle      2026-04-21  6003) 		local_unlock(&s->cpu_sheaves->lock);
ec66e0d599520ab Vlastimil Babka        2025-09-03  6004  		return;
ec66e0d599520ab Vlastimil Babka        2025-09-03  6005  	}
ec66e0d599520ab Vlastimil Babka        2025-09-03  6006  
ec66e0d599520ab Vlastimil Babka        2025-09-03  6007  	stat(s, BARN_PUT_FAIL);
ec66e0d599520ab Vlastimil Babka        2025-09-03  6008  	sheaf_flush_unused(s, sheaf);
ec66e0d599520ab Vlastimil Babka        2025-09-03  6009  
ec66e0d599520ab Vlastimil Babka        2025-09-03  6010  empty:
fd6db58867924d2 Vlastimil Babka        2025-10-11  6011  	if (barn && data_race(barn->nr_empty) < MAX_EMPTY_SHEAVES) {
ec66e0d599520ab Vlastimil Babka        2025-09-03  6012  		barn_put_empty_sheaf(barn, sheaf);
cb8be1e8cd9f603 Harry Yoo (Oracle      2026-04-21  6013) 		local_unlock(&s->cpu_sheaves->lock);
ec66e0d599520ab Vlastimil Babka        2025-09-03  6014  		return;
ec66e0d599520ab Vlastimil Babka        2025-09-03  6015  	}
ec66e0d599520ab Vlastimil Babka        2025-09-03  6016  
cb8be1e8cd9f603 Harry Yoo (Oracle      2026-04-21  6017) 	local_unlock(&s->cpu_sheaves->lock);
cb8be1e8cd9f603 Harry Yoo (Oracle      2026-04-21  6018) 	free_empty_sheaf(s, sheaf);
cb8be1e8cd9f603 Harry Yoo (Oracle      2026-04-21  6019) 	return;
cb8be1e8cd9f603 Harry Yoo (Oracle      2026-04-21  6020) 
cb8be1e8cd9f603 Harry Yoo (Oracle      2026-04-21  6021) flush_unlocked:
cb8be1e8cd9f603 Harry Yoo (Oracle      2026-04-21  6022) 	stat(s, BARN_PUT_FAIL);
cb8be1e8cd9f603 Harry Yoo (Oracle      2026-04-21  6023) 	sheaf_flush_unused(s, sheaf);
ec66e0d599520ab Vlastimil Babka        2025-09-03  6024  	free_empty_sheaf(s, sheaf);
ec66e0d599520ab Vlastimil Babka        2025-09-03  6025  }
ec66e0d599520ab Vlastimil Babka        2025-09-03  6026  

:::::: The code at line 5985 was first introduced by commit
:::::: fd6db58867924d2bfbc4ece4b0092f697f9fc31c slab: fix barn NULL pointer dereference on memoryless nodes

:::::: TO: Vlastimil Babka <vbabka@suse.cz>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
