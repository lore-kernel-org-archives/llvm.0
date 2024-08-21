Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029CA192D90;
	Wed, 21 Aug 2024 13:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724246917; cv=none; b=hN2aqPFbu2Fre1tm6yWu/s9o2YPJQGYtXJiN9BAZCsbBqU2xo58zgDjipsacV2Yg/RYy/KI/FK4/3+UZ9wo/pTpicrj77VfYpAcAvuXrTr1Pc9wmh0r+zoVdmAdwFyM7uKtM+YRdmvbtAQ6dC2gDulRhofDsrnYrntF4d96IgYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724246917; c=relaxed/simple;
	bh=+jVaQv+lXjEHENNHUQVMJ1nndkT2djb2vtG91NL3tkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=of+h8Bwmw+MjbM8MzI4UYPcNb5d2QK0rUt2Yt38khfDS78LdwwPdRk6DRh96z5/rwQPC9dSssir36iUbfbQOlTE9srSPs4GHjt5ZG9o7WZt0m4JfZzGBvQwBWh17HrlhfNuQ6K8uZ7VDrRZiPzuIogFCAiaUd81Nd/Nxzgs7PdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/HjRY+E; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/HjRY+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724246915; x=1755782915;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+jVaQv+lXjEHENNHUQVMJ1nndkT2djb2vtG91NL3tkQ=;
  b=l/HjRY+Evj1/S615dYsD3q7/G7st0YjVvDJQCnxAE97U7nIix1pK3QxP
   1qWbFbzhNAFSYmdizXiixLA0Yb7dT+uwl39RyzDPsetmT4lVS88Kp+XCo
   umNWBeWHEOwpZDkPhXZvXT40O79aEfie87kS++zyh9+vtNTLD7OOGXtR0
   qeTylBaiReiqKRqNdDYWbBS+u/46divnJJ+o5lEU/31TkoYwyaKDc25cS
   e62rVKA/63OwksWl8xYzaug1MeLaierb/WpauaPh62LmoAecAmFFuCQKY
   NcGzEBEHPobd/JV6m6kZpitK9xzz9lBFqOqo1hoelKKP5Ec+lHKyI2V5Q
   Q==;
X-CSE-ConnectionGUID: BmL+BS18TOSP1FWg0FwUgw==
X-CSE-MsgGUID: A6n8xjq1Qse4Bfp1X6xYDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="40119152"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="40119152"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 06:28:34 -0700
X-CSE-ConnectionGUID: zlp6iIdJSOWn+Yrc24J21w==
X-CSE-MsgGUID: mtqJk6vTT0+ezNgq7n2emg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="98575593"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Aug 2024 06:28:33 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sglO2-000BPC-2l;
	Wed, 21 Aug 2024 13:28:30 +0000
Date: Wed, 21 Aug 2024 21:28:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC] mm, slub: avoid zeroing kmalloc redzone
Message-ID: <202408212001.MucBoQzB-lkp@intel.com>
References: <20240819064115.385086-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819064115.385086-1-peng.fan@oss.nxp.com>

Hi Peng,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on next-20240819]
[also build test ERROR on v6.11-rc4]
[cannot apply to akpm-mm/mm-everything linus/master vbabka-slab/for-next v6.11-rc4 v6.11-rc3 v6.11-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/mm-slub-avoid-zeroing-kmalloc-redzone/20240819-143423
base:   next-20240819
patch link:    https://lore.kernel.org/r/20240819064115.385086-1-peng.fan%40oss.nxp.com
patch subject: [RFC] mm, slub: avoid zeroing kmalloc redzone
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240821/202408212001.MucBoQzB-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408212001.MucBoQzB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408212001.MucBoQzB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/slub.c:13:
   In file included from include/linux/mm.h:2203:
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
   In file included from mm/slub.c:49:
   In file included from mm/internal.h:13:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/slub.c:2292:15: error: call to undeclared function 'get_orig_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2292 |                 orig_size = get_orig_size(s, x);
         |                             ^
>> mm/slub.c:2303:3: error: call to undeclared function 'set_orig_size'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2303 |                 set_orig_size(s, x, orig_size);
         |                 ^
   6 warnings and 2 errors generated.


vim +/get_orig_size +2292 mm/slub.c

  2275	
  2276		/*
  2277		 * As memory initialization might be integrated into KASAN,
  2278		 * kasan_slab_free and initialization memset's must be
  2279		 * kept together to avoid discrepancies in behavior.
  2280		 *
  2281		 * The initialization memset's clear the object and the metadata,
  2282		 * but don't touch the SLAB redzone.
  2283		 *
  2284		 * The object's freepointer is also avoided if stored outside the
  2285		 * object.
  2286		 */
  2287		if (unlikely(init)) {
  2288			int rsize;
  2289			unsigned int inuse, orig_size;
  2290	
  2291			inuse = get_info_end(s);
> 2292			orig_size = get_orig_size(s, x);
  2293			if (!kasan_has_integrated_init())
  2294				memset(kasan_reset_tag(x), 0,
  2295				       s->object_size > orig_size ? orig_size : s->object_size);
  2296			rsize = (s->flags & SLAB_RED_ZONE) ? s->red_left_pad : 0;
  2297			memset((char *)kasan_reset_tag(x) + inuse, 0,
  2298			       s->size - inuse - rsize);
  2299			/*
  2300			 * Restore orig_size, otherwize kmalloc redzone overwritten
  2301			 * would be reported
  2302			 */
> 2303			set_orig_size(s, x, orig_size);
  2304	
  2305		}
  2306		/* KASAN might put x into memory quarantine, delaying its reuse. */
  2307		return !kasan_slab_free(s, x, init, still_accessible);
  2308	}
  2309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
