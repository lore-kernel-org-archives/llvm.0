Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8642D8382;
	Fri, 10 Jul 2026 17:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705087; cv=none; b=CWLLvHyBopF1bvZ+qtQoTnICicmNOtyy4xy2IRU6VTtqzfD258d7Am2Oo3yHQeUR+KkQ8hJd3m84Wlz8Hy+sLpZGzvxuvvbGQl0e/O0pQCz/qxe901aZvoVxp80JZr1J5jvudaGXHioglKKtyuXuPEW158enS3Y949M5IWDA5nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705087; c=relaxed/simple;
	bh=fEu/GrD3g8HmXDSbvEp3FNnOnZ7e1d/mMwN0+NbRaAA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pSrrCRibaQal9ZRPyPeUzpRjDE/gBo+b+WtBqWbnV5arpYmPO9pfgOTQY7CUGhUw8uKkxWbtu17oLOM3Z6uTCJX3gShezU8vB0RFEwTAuf8qDUQE6M1JJEJfSfNxB7MaJBqss0JoAMFkuKfFhyF3IPeI5vmvzoqrmwDEDoSUDzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JRRZZNtT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRRZZNtT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783705085; x=1815241085;
  h=date:from:to:cc:subject:message-id;
  bh=fEu/GrD3g8HmXDSbvEp3FNnOnZ7e1d/mMwN0+NbRaAA=;
  b=JRRZZNtTnBJCMkSAEk0B/Og9aHtmE+pMSouq+nMpRZZvFKY+avSvgmya
   lD5O769iSo0OfBgF4XvsMEuWxycGhhAzjYjWVzbpwyRRoRgjbPJOJU23b
   +jmH5VIysBSUOcwdYZhtwfmG6D4NcfQWRz5iPQrBsKRjyLgK/xiWfbxL3
   LEn7yFa1vJ+z5cyXz0NIpVNKsTfK0A1vsdhgMfYp5UbGiKRjnZ6Zuzrb8
   CTfyC8UyMOEcithxLjyP2L6cZrXsuVFTIOiz3eanM7OTUeLfWtpzlX3QX
   56D/lh3/y+7uaItqsYsPVheMN18H+55DOkhSGwHqsr5+dq6i6yo0w1cku
   A==;
X-CSE-ConnectionGUID: T+vWNW9GQc6BvXHE5gYR6g==
X-CSE-MsgGUID: K4SWE2NlTKWL0vvbfBOcpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84187920"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84187920"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:38:05 -0700
X-CSE-ConnectionGUID: 6GkkIIM7RE6cEipJFVOluQ==
X-CSE-MsgGUID: YKQBRPQcQR21aeQlDSUzQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="293134998"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 10 Jul 2026 10:38:03 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiFAm-00000000JBt-1phZ;
	Fri, 10 Jul 2026 17:38:00 +0000
Date: Sat, 11 Jul 2026 01:37:46 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: 
 [gourryinverse:scratch/gourry/cxl/compression/file_cleancache 85/98]
 mm/cram.c:785:9: error: call to undeclared function
 'add_private_memory_driver_managed'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202607110149.Brcg1dl7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/cxl/compression/file_cleancache
head:   bcd0bfca5b64d6cbb5aadb07554b9bd218e0df85
commit: b91721666fdaddeaac4caa01b7f220f13ad984d6 [85/98] mm/cram: core compressed-RAM tier API
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260711/202607110149.Brcg1dl7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110149.Brcg1dl7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110149.Brcg1dl7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/cram.c:785:9: error: call to undeclared function 'add_private_memory_driver_managed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     785 |                 ret = add_private_memory_driver_managed(nid, ranges[i].start,
         |                       ^
>> mm/cram.c:787:5: error: use of undeclared identifier 'MHP_MERGE_RESOURCE'
     787 |                                 MHP_MERGE_RESOURCE, MMOP_ONLINE_MOVABLE, &cn->np);
         |                                 ^
   2 errors generated.


vim +/add_private_memory_driver_managed +785 mm/cram.c

   711	
   712	/**
   713	 * cram_register() - donate physical region(s) to CRAM as a private node
   714	 * @nid:         target NUMA node
   715	 * @ranges:      perceived physical regions to donate (struct range, end-inclusive)
   716	 * @n:           number of ranges
   717	 * @zratio:      hw compression ratio, per-mille N:1 (3:1 => 3000, 1:1 => 1000)
   718	 * @ops:         driver callbacks.  ops.owner (= THIS_MODULE) pins the module for
   719	 *               the node's lifetime.  Stored by value.
   720	 * @driver_data: the driver's per-node object, the ops callback cookie and np
   721	 *               owner.  Opaque to CRAM (keyed operations use @nid).
   722	 *
   723	 * CRAM owns the node lifecycle.  It hotplugs each range as an N_MEMORY_PRIVATE
   724	 * node (caps = CRAM_NP_CAPS, backed by &cn->np), onlines movable, and starts
   725	 * kswapd for LRU aging / writeback.  The driver does no hotplug of its own.
   726	 *
   727	 * Return: 0 on success.  -errno on failure (nothing left onlined on failure).
   728	 */
   729	int cram_register(int nid, const struct range *ranges, unsigned int n,
   730			  u32 zratio, struct cram_ops ops, void *driver_data)
   731	{
   732		struct cram_node *cn;
   733		unsigned int i, added = 0;
   734		int ret;
   735	
   736		if (!cram_valid_nid(nid) || !ranges || !n)
   737			return -EINVAL;
   738	
   739		/* Pin the driver module for the node's lifetime (NULL = built-in). */
   740		if (!try_module_get(ops.owner))
   741			return -EBUSY;
   742	
   743		cn = kzalloc(sizeof(*cn), GFP_KERNEL);
   744		if (!cn) {
   745			ret = -ENOMEM;
   746			goto err_module;
   747		}
   748		cn->ranges = kmemdup(ranges, n * sizeof(*ranges), GFP_KERNEL);
   749		if (!cn->ranges) {
   750			ret = -ENOMEM;
   751			goto err_free;
   752		}
   753		cn->nr_ranges = n;
   754		cn->zratio = zratio;
   755		cn->current_ratio = zratio;	/* assume configured ratio until reported */
   756		cn->alloc_allowed = true;	/* demotions permitted until the driver revokes */
   757		cn->ops = ops;
   758		cn->driver_data = driver_data;
   759		cn->nid = nid;
   760		cn->np.owner = driver_data;
   761		cn->np.caps = CRAM_NP_CAPS;
   762		refcount_set(&cn->refcount, 1);
   763		INIT_WORK(&cn->wmark_work, cram_wmark_work_fn);
   764		INIT_WORK(&cn->promote_work, cram_promote_work_fn);
   765		spin_lock_init(&cn->promote_lock);
   766		INIT_LIST_HEAD(&cn->balloon_pages);
   767		mutex_init(&cn->balloon_mutex);
   768	
   769		mutex_lock(&cram_mutex);
   770	
   771		/* Accretion / re-register onto an existing node is not yet supported. */
   772		if (cram_nodes[nid]) {
   773			mutex_unlock(&cram_mutex);
   774			ret = -EBUSY;
   775			goto err_ranges;
   776		}
   777	
   778		/*
   779		 * CRAM owns the node.  Hotplug each range as a private node (the first
   780		 * call node_private_register()s &cn->np) and online it movable.  On a
   781		 * failure roll back the ranges already added (fresh/empty, so the atomic
   782		 * ranges-offline succeeds).
   783		 */
   784		for (i = 0; i < n; i++) {
 > 785			ret = add_private_memory_driver_managed(nid, ranges[i].start,
   786					range_len(&ranges[i]), "System RAM (cram)",
 > 787					MHP_MERGE_RESOURCE, MMOP_ONLINE_MOVABLE, &cn->np);
   788			if (ret) {
   789				if (added)
   790					offline_and_remove_memory_ranges(cn->ranges, added);
   791				mutex_unlock(&cram_mutex);
   792				goto err_ranges;
   793			}
   794			added++;
   795		}
   796	
   797		/*
   798		 * Publish the control node first, then arm the CRAM mask last.  Once
   799		 * node_is_cram() / cram_pick_node() observe the node, cram_nodes[nid] is
   800		 * already valid.  Teardown clears the mask first, the mirror image.
   801		 */
   802		static_branch_inc(&cram_enabled);
   803		rcu_assign_pointer(cram_nodes[nid], cn);
   804		node_set(nid, cram_node_mask);
   805	
   806		/* Start kswapd on the private node for LRU aging and writeback */
   807		kswapd_run(nid);
   808	
   809		mutex_unlock(&cram_mutex);
   810		return 0;
   811	
   812	err_ranges:
   813		kfree(cn->ranges);
   814	err_free:
   815		kfree(cn);
   816	err_module:
   817		module_put(ops.owner);
   818		return ret;
   819	}
   820	EXPORT_SYMBOL_GPL(cram_register);
   821	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
