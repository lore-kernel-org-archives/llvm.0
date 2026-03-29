Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1FE313551;
	Sun, 29 Mar 2026 10:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774781389; cv=none; b=NVeqa+bXX3GBDnNSJvU6/xCkKZCrUKaVBU/stNffikqiXpCBriORsmJMBWE3qSgKoVWjw/1M5PkFWM/XYEPcmNmHlmYN6lz6B4UdmQt3vmDq4sRbc3UFndQiq2CjKdDwvHmM1rqQiOmwnyVahVDexGj2cqu8yTi+666dsK9OuVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774781389; c=relaxed/simple;
	bh=0jS+lxhtNLNxmUvtXwaJU9vXoM22BiN5K4t003u6/vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMqi1t9E7qVijIvEIt5MQr+92Zj9aU4YEPjMG7xvSXAltLkOj6N3+TiBTjdTHy42G/hJ1ONwPTqpf9KqEc9c1cRYH5G9ROKidVpT8ZzktRDeDA9WJ4+T4bYT7XKdQS18BAcXDuqNxesNCn7mKmvxxlsgrjHyQP/70wJfs5UDi0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPdaLZbl; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPdaLZbl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774781387; x=1806317387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0jS+lxhtNLNxmUvtXwaJU9vXoM22BiN5K4t003u6/vY=;
  b=nPdaLZblc0DN1u7aQ9NsS1dtJQmPTRj7TtE0DJUxwLUQdDdmER4Ur2JP
   1dSCzhWir4xD+B42lVh84ajPomvaPndIkTnQoeDPWlAgmtK7BBjnNAjpH
   F4Cn0XocIBqqXY9h43einHOW51n7dRy4+BxP4EP/F4TKVWquOREkDWsHl
   l0uE3N+Lg8YaUPCVYK41mRI81Zu1sq4e8s5pvOp0Dj3k/XdxWpWPm+GFn
   FPGLyvdjbhA3Sl32lLhsYQ1Z//iZzHXjS+T5ZqFaJClpJkqtXIaMmQ6al
   fKZJmRJ+LQU01BuIFSWSFMG8e6xiJtVEUl+wOIiuIWcebzRx28QFR+nNr
   w==;
X-CSE-ConnectionGUID: VpBzxNb2RDKOAcyGZmRedQ==
X-CSE-MsgGUID: j7oiiiFTTtOXO/+E47jtAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86870759"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="86870759"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 03:49:47 -0700
X-CSE-ConnectionGUID: xMZyIx/uQNi/bVUaLyn0PQ==
X-CSE-MsgGUID: aNcT5voZTsq2WxuqnuWh7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="224955420"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Mar 2026 03:49:43 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6ni8-00000000CID-0iui;
	Sun, 29 Mar 2026 10:49:40 +0000
Date: Sun, 29 Mar 2026 18:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, bhe@redhat.com,
	baohua@kernel.org, chrisl@kernel.org, kasong@tencent.com,
	nphamcs@gmail.com, shikemeng@huaweicloud.com, youngjun.park@lge.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mm/swap: use swap_ops to register swap device's
 methods
Message-ID: <202603291844.TWh2Ellp-lkp@intel.com>
References: <20260328075812.11060-3-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328075812.11060-3-21cnbao@gmail.com>

Hi Barry,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/mm-swap-rename-mm-page_io-c-to-mm-swap_io-c/20260328-170852
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260328075812.11060-3-21cnbao%40gmail.com
patch subject: [PATCH v2 2/3] mm/swap: use swap_ops to register swap device's methods
config: arm-randconfig-001-20260329 (https://download.01.org/0day-ci/archive/20260329/202603291844.TWh2Ellp-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603291844.TWh2Ellp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603291844.TWh2Ellp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/zswap.c:1057:19: error: use of undeclared identifier 'sis'; did you mean 'si'?
    1057 |         VM_WARN_ON_ONCE(!sis->ops || !sis->ops->write_folio);
         |                          ^~~
         |                          si
   include/linux/mmdebug.h:133:52: note: expanded from macro 'VM_WARN_ON_ONCE'
     133 | #define VM_WARN_ON_ONCE(cond) BUILD_BUG_ON_INVALID(cond)
         |                                                    ^~~~
   include/linux/build_bug.h:30:63: note: expanded from macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   mm/zswap.c:995:27: note: 'si' declared here
     995 |         struct swap_info_struct *si;
         |                                  ^
   mm/zswap.c:1057:32: error: use of undeclared identifier 'sis'; did you mean 'si'?
    1057 |         VM_WARN_ON_ONCE(!sis->ops || !sis->ops->write_folio);
         |                                       ^~~
         |                                       si
   include/linux/mmdebug.h:133:52: note: expanded from macro 'VM_WARN_ON_ONCE'
     133 | #define VM_WARN_ON_ONCE(cond) BUILD_BUG_ON_INVALID(cond)
         |                                                    ^~~~
   include/linux/build_bug.h:30:63: note: expanded from macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   mm/zswap.c:995:27: note: 'si' declared here
     995 |         struct swap_info_struct *si;
         |                                  ^
   2 errors generated.


vim +1057 mm/zswap.c

   971	
   972	/*********************************
   973	* writeback code
   974	**********************************/
   975	/*
   976	 * Attempts to free an entry by adding a folio to the swap cache,
   977	 * decompressing the entry data into the folio, and issuing a
   978	 * bio write to write the folio back to the swap device.
   979	 *
   980	 * This can be thought of as a "resumed writeback" of the folio
   981	 * to the swap device.  We are basically resuming the same swap
   982	 * writeback path that was intercepted with the zswap_store()
   983	 * in the first place.  After the folio has been decompressed into
   984	 * the swap cache, the compressed version stored by zswap can be
   985	 * freed.
   986	 */
   987	static int zswap_writeback_entry(struct zswap_entry *entry,
   988					 swp_entry_t swpentry)
   989	{
   990		struct xarray *tree;
   991		pgoff_t offset = swp_offset(swpentry);
   992		struct folio *folio;
   993		struct mempolicy *mpol;
   994		bool folio_was_allocated;
   995		struct swap_info_struct *si;
   996		int ret = 0;
   997	
   998		/* try to allocate swap cache folio */
   999		si = get_swap_device(swpentry);
  1000		if (!si)
  1001			return -EEXIST;
  1002	
  1003		mpol = get_task_policy(current);
  1004		folio = swap_cache_alloc_folio(swpentry, GFP_KERNEL, mpol,
  1005					       NO_INTERLEAVE_INDEX, &folio_was_allocated);
  1006		put_swap_device(si);
  1007		if (!folio)
  1008			return -ENOMEM;
  1009	
  1010		/*
  1011		 * Found an existing folio, we raced with swapin or concurrent
  1012		 * shrinker. We generally writeback cold folios from zswap, and
  1013		 * swapin means the folio just became hot, so skip this folio.
  1014		 * For unlikely concurrent shrinker case, it will be unlinked
  1015		 * and freed when invalidated by the concurrent shrinker anyway.
  1016		 */
  1017		if (!folio_was_allocated) {
  1018			ret = -EEXIST;
  1019			goto out;
  1020		}
  1021	
  1022		/*
  1023		 * folio is locked, and the swapcache is now secured against
  1024		 * concurrent swapping to and from the slot, and concurrent
  1025		 * swapoff so we can safely dereference the zswap tree here.
  1026		 * Verify that the swap entry hasn't been invalidated and recycled
  1027		 * behind our backs, to avoid overwriting a new swap folio with
  1028		 * old compressed data. Only when this is successful can the entry
  1029		 * be dereferenced.
  1030		 */
  1031		tree = swap_zswap_tree(swpentry);
  1032		if (entry != xa_load(tree, offset)) {
  1033			ret = -ENOMEM;
  1034			goto out;
  1035		}
  1036	
  1037		if (!zswap_decompress(entry, folio)) {
  1038			ret = -EIO;
  1039			goto out;
  1040		}
  1041	
  1042		xa_erase(tree, offset);
  1043	
  1044		count_vm_event(ZSWPWB);
  1045		if (entry->objcg)
  1046			count_objcg_events(entry->objcg, ZSWPWB, 1);
  1047	
  1048		zswap_entry_free(entry);
  1049	
  1050		/* folio is up to date */
  1051		folio_mark_uptodate(folio);
  1052	
  1053		/* move it to the tail of the inactive list after end_writeback */
  1054		folio_set_reclaim(folio);
  1055	
  1056		/* start writeback */
> 1057		VM_WARN_ON_ONCE(!sis->ops || !sis->ops->write_folio);
  1058		si->ops->write_folio(si, folio, NULL);
  1059	
  1060	out:
  1061		if (ret && ret != -EEXIST) {
  1062			swap_cache_del_folio(folio);
  1063			folio_unlock(folio);
  1064		}
  1065		folio_put(folio);
  1066		return ret;
  1067	}
  1068	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
