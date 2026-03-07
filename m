Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4E514F9FB;
	Sat,  7 Mar 2026 22:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772924188; cv=none; b=JML6+O1Z/RRJy5gc/mgGHQOANJAsxvnUh5OOgaY1Nk5Zer+QteIR5GJPqdWtrmdbTnogSjGkRECRLGoY8rYJC+k5zwTjAkO7ScEf3kJVETF71apIDefCPgt1HKo05yIdPjmm+qrikqP+AG6/fggEg6NggNwaJhocsvY8g0dpegA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772924188; c=relaxed/simple;
	bh=S8KcR1LmjqTxj/mWoKrlCUsjydq8SPbkoQLE2AIRIaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upLqmvKVkXZXOt/lWZm41JXZcns0C2zN/zK93btlg1i+iOmnSRlgg2FVMXn54O0MHBIlOg04sZyuEU0pXEKrxto6OQ3c1uvam43FqlPgnJgZIGZ2d85cn+DWOxPF2sI/u5yZiywE36+UbvEbMqqsHs4O0JzBVaM0KuT+dQCKGBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OSC7TL2h; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OSC7TL2h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772924186; x=1804460186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S8KcR1LmjqTxj/mWoKrlCUsjydq8SPbkoQLE2AIRIaY=;
  b=OSC7TL2hCWPCCMOxKczKwHIcDQwG8pH4dvY4zh2wBHe3YicuRzk7EBYd
   5+HPhuFg8jwBrdieu9iCESbcYEWtAWEJWT2nmqOkJRvty4H0dTy5euOU4
   jUDJBIgogrkgxL++1c2xKZtwirpPrJe4n8Iu0qdK/L0BmDrFrGFoXu32k
   JZMdNtm64s46lTQcmJtRaKbf3pRE/damZMcdQF9tcmCI7a9WQ85CxmTJQ
   KDKvHgAq6KOMcjspU4S+QS79D1DklVA+pQBoPa/T2OI3FMdFOUl56HDC5
   NlWO+u8wMbvv3uQfXesRUQRB6/dKGLwkgj+3ETIgBHffVeQrpOU2xRwDo
   Q==;
X-CSE-ConnectionGUID: xAW/VkL3RYaw8EN5v37jNQ==
X-CSE-MsgGUID: qoh6WzpXS2ao1hv7imUXrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="74043052"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="74043052"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 14:56:26 -0800
X-CSE-ConnectionGUID: uCIvkWKkSZKiepC7ovznDw==
X-CSE-MsgGUID: gyg//feTTbC9tPeuQ0GjLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="218573738"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Mar 2026 14:56:21 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz0ZF-000000002hR-42FW;
	Sat, 07 Mar 2026 22:56:17 +0000
Date: Sun, 8 Mar 2026 06:55:23 +0800
From: kernel test robot <lkp@intel.com>
To: Haifeng Xu <haifeng.xu@shopee.com>, akpm@linux-foundation.org,
	david@fromorbit.com, roman.gushchin@linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	zhengqi.arch@bytedance.com, muchun.song@linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Haifeng Xu <haifeng.xu@shopee.com>
Subject: Re: [PATCH 2/3] mm: shrinker: optimize the allocation of
 shrinker_info when setting cgroup_memory_nokmem
Message-ID: <202603080606.UQEPDmnB-lkp@intel.com>
References: <20260306075757.198887-3-haifeng.xu@shopee.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306075757.198887-3-haifeng.xu@shopee.com>

Hi Haifeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v7.0-rc2 next-20260306]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haifeng-Xu/mm-shrinker-introduce-new-function-get_shrinker_id/20260306-160247
base:   linus/master
patch link:    https://lore.kernel.org/r/20260306075757.198887-3-haifeng.xu%40shopee.com
patch subject: [PATCH 2/3] mm: shrinker: optimize the allocation of shrinker_info when setting cgroup_memory_nokmem
config: i386-randconfig-002-20260307 (https://download.01.org/0day-ci/archive/20260308/202603080606.UQEPDmnB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603080606.UQEPDmnB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603080606.UQEPDmnB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/huge_memory.c:4355:38: error: no member named 'id' in 'struct shrinker'
    4355 |                         int id = deferred_split_shrinker->id;
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~  ^
>> mm/huge_memory.c:4358:35: error: no member named 'nonslab_id' in 'struct shrinker'
    4358 |                                 id = deferred_split_shrinker->nonslab_id;
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~  ^
   2 errors generated.


vim +4355 mm/huge_memory.c

  4307	
  4308	/* partially_mapped=false won't clear PG_partially_mapped folio flag */
  4309	void deferred_split_folio(struct folio *folio, bool partially_mapped)
  4310	{
  4311		struct deferred_split *ds_queue;
  4312		unsigned long flags;
  4313	
  4314		/*
  4315		 * Order 1 folios have no space for a deferred list, but we also
  4316		 * won't waste much memory by not adding them to the deferred list.
  4317		 */
  4318		if (folio_order(folio) <= 1)
  4319			return;
  4320	
  4321		if (!partially_mapped && !split_underused_thp)
  4322			return;
  4323	
  4324		/*
  4325		 * Exclude swapcache: originally to avoid a corrupt deferred split
  4326		 * queue. Nowadays that is fully prevented by memcg1_swapout();
  4327		 * but if page reclaim is already handling the same folio, it is
  4328		 * unnecessary to handle it again in the shrinker, so excluding
  4329		 * swapcache here may still be a useful optimization.
  4330		 */
  4331		if (folio_test_swapcache(folio))
  4332			return;
  4333	
  4334		ds_queue = folio_split_queue_lock_irqsave(folio, &flags);
  4335		if (partially_mapped) {
  4336			if (!folio_test_partially_mapped(folio)) {
  4337				folio_set_partially_mapped(folio);
  4338				if (folio_test_pmd_mappable(folio))
  4339					count_vm_event(THP_DEFERRED_SPLIT_PAGE);
  4340				count_mthp_stat(folio_order(folio), MTHP_STAT_SPLIT_DEFERRED);
  4341				mod_mthp_stat(folio_order(folio), MTHP_STAT_NR_ANON_PARTIALLY_MAPPED, 1);
  4342	
  4343			}
  4344		} else {
  4345			/* partially mapped folios cannot become non-partially mapped */
  4346			VM_WARN_ON_FOLIO(folio_test_partially_mapped(folio), folio);
  4347		}
  4348		if (list_empty(&folio->_deferred_list)) {
  4349			struct mem_cgroup *memcg;
  4350	
  4351			memcg = folio_split_queue_memcg(folio, ds_queue);
  4352			list_add_tail(&folio->_deferred_list, &ds_queue->split_queue);
  4353			ds_queue->split_queue_len++;
  4354			if (memcg) {
> 4355				int id = deferred_split_shrinker->id;
  4356	
  4357				if (!memcg_kmem_online() &&  memcg != root_mem_cgroup)
> 4358					id = deferred_split_shrinker->nonslab_id;
  4359	
  4360				set_shrinker_bit(memcg, folio_nid(folio), id);
  4361			}
  4362		}
  4363		split_queue_unlock_irqrestore(ds_queue, flags);
  4364	}
  4365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
